import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, Option, Generic;
import 'data_class_meta_generator.dart';
import 'util.dart';

Class generateData(Data<DataField> dataClass) => Class((b) => b
  ..abstract = false
  // ..mixins.addAll(_mixins(dataClass))
  ..types.addAll(
    dataClass.generics.map(
      (g) => Reference(g.typeParameterStr),
    ),
  )
  ..constructors.add(new Constructor(
    (b) => b
      ..constant = dataClass.isConst
      ..initializers.addAll(
        dataClass.nonComputedFields.map(_initializer).expand((i) => i),
      )
      ..optionalParameters.addAll(
        dataClass.nonComputedFields.map(
          (f) => Parameter(
            (b) => b
              ..named = true
              ..name = _removeUnderscore(f.name)
              ..type = Reference(f.returnType.typeStr),
          ),
        ),
      ),
  ))
  // ..constructors.add(
  //   Constructor(
  //     (b) => b
  //       ..factory = true
  //       ..name = 'load'
  //       ..lambda = true
  //       ..requiredParameters.add(
  //         Parameter(
  //           (b) => b
  //             ..name = 'loaders'
  //             ..type = Reference('Iterable<DataLoader>'),
  //         ),
  //       )
  //       ..body = Code('''
  //         ${dataClass.name}(${_loaderFields(dataClass)})
  //       '''),
  //   ),
  // )
  ..name = dataClass.name
  ..types.addAll([])
  ..extend = Reference(
    '\$${dataClass.name}' +
        extendedClassGenerics(
          dataClass.generics,
        ),
    '',
  )
  // ..methods.addAll(_)
  ..methods.add(_clone(dataClass))
  ..fields.addAll([if (!dataClass.isConst) ..._genComputedFields(dataClass)])
  ..fields.addAll(_genNonComputedFields(dataClass))
  // ..fields.add(genDataField(dataClass))
  // ..methods.add(genDataGetter(dataClass))
  ..methods.addAll(_nonDefaultedFieldsGetter(dataClass))
  ..methods.addAll(_defaultedFieldsGetter(dataClass))
  ..methods
      .addAll([if (!dataClass.isConst) ..._genComputedFieldsGetter(dataClass)])
  ..methods.add(_hashCode(dataClass))
  ..methods.add(_equality(dataClass))
  ..methods.add(_toString(dataClass)));

Iterable<Code> _initializer(DataField field) => [
      Code('_${field.name} = ${_removeUnderscore(field.name)}'),
      Code('assert(${_removeUnderscore(field.name)} != null)'),
    ];

Method _clone(Data<DataField> dataClass) => Method((b) => b
  ..name = 'clone'
  ..returns = Reference(
    dataClass.name + extendedClassGenerics(dataClass.generics),
  )
  ..optionalParameters
      .addAll(dataClass.nonComputedFields.map((f) => Parameter((b) => b
        ..named = true
        ..name = _removeUnderscore(f.name)
        ..type = Reference(f.returnType.typeStr))))
  ..body = Code('''
  return ${dataClass.name}(${_cloneParams(dataClass)});
  '''));

String _loaderFields(Data<DataField> dataClass) => dataClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb${field.name}: loaders.firstWhere((l) => l.name == \'${field.name}\').value as ${field.returnType.typeStr},');

String _cloneParams(Data<DataField> dataClass) => dataClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb${_removeUnderscore(field.name)}: ${_removeUnderscore(field.name)} ?? _${field.name},');

Method _equality(Data<DataField> dataClass) => Method((b) => b
  ..name = 'operator =='
  ..returns = TypeReference((b) => b..symbol = 'bool')
  ..requiredParameters.add(Parameter((b) => b
    ..name = 'other'
    ..type = Reference('dynamic')))
  ..body = Code('''
    if (identical(other, this)) return true;
    if (other is! ${dataClass.name}) return false;
    return ${_equalityFold(dataClass.nonComputedFields)};
  '''));

String _equalityFold(Iterable<DataField> e) =>
    e.map((field) => '${field.name} == other.${field.name}').join('&&');

Method _hashCode(Data<DataField> dataClass) => Method((b) => b
  ..name = 'hashCode'
  ..type = MethodType.getter
  ..returns = TypeReference((b) => b..symbol = 'int')
  ..body = Code('''
    return \$jf(${_hashFold(dataClass.nonComputedFields)});
  '''));

String _hashFold(Iterable<DataField> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, ${field.name}.hashCode)');

Method _toString(Data<DataField> dataClass) => Method((b) => b
  ..name = 'toString'
  ..returns = TypeReference((b) => b..symbol = 'String')
  ..body = Code('''
    return "${dataClass.name} (${_toStringFold(dataClass.nonDefaultedFields)})";
  '''));

String _toStringFold(Iterable<DataField> e) =>
    e.map((field) => '${field.name}: \$${field.name}').join(', ');

Iterable<Field> _genNonComputedFields(Data e) =>
    e.nonComputedFields.map((field) => Field((b) => b
      ..modifier = FieldModifier.final$
      ..name = '_${field.name}'
      ..type = Reference(field.returnType.typeStr)));

Iterable<Field> _genComputedFields(Data e) =>
    e.computedFields.map((field) => Field((b) => b
      ..name = '_${field.name}'
      ..type = Reference(field.returnType.typeStr)));

Iterable<Method> _nonDefaultedFieldsGetter(Data e) =>
    e.nonDefaultedFields.map((field) => Method((b) => b
      ..name = field.name
      ..returns = Reference(field.returnType.typeStr)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.name};
      ''')));

Iterable<Method> _defaultedFieldsGetter(Data e) =>
    e.defaultedFields.map((field) => Method((b) => b
      ..name = field.name
      ..returns = Reference(field.returnType.typeStr)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.name} ?? super.${field.name};
      ''')));

Iterable<Method> _genComputedFieldsGetter(Data e) =>
    e.computedFields.map((field) => Method((b) => b
      ..name = field.name
      ..returns = Reference(field.returnType.typeStr)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.name} ??= super.${field.name};
      ''')));

String _removeUnderscore(String field) =>
    field.startsWith('_') ? field.substring(1) : field;
