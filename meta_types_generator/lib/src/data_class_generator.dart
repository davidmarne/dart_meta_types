import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'data_class.dart';
import 'option.dart';
import 'util.dart';

Class generateDataClass(DataClass dataClass) => Class((b) => b
  ..abstract = false
  // ..mixins.addAll(_mixins(dataClass))
  ..types.addAll(
      dataClass.metaClassReference.generics.map((g) => Reference(g.symbol)))
  ..constructors.add(new Constructor(
    (b) => b
      ..constant = dataClass.computedFields.isEmpty && dataClass.isConst
      ..initializers.addAll(
        dataClass.allNonComputedFields.map(_initializer).expand((i) => i),
      )
      ..optionalParameters.addAll(
        dataClass.allNonComputedFields.map(
          (f) => Parameter(
            (b) => b
              ..named = true
              ..name = f.propertyName
              ..type = Reference(f.returnTypeName),
          ),
        ),
      ),
  ))
  ..name = dataClass.metaClassReference.symbol
  ..types.addAll([])
  ..extend = Reference(
    '\$${dataClass.metaClassReference.symbol}' +
        classGenerics(
          dataClass.metaClassReference.generics,
        ),
    dataClass.metaClassReference.url,
  )
  // ..methods.addAll(_)
  ..methods.add(_clone(dataClass))
  ..fields.addAll(_genComputedFields(dataClass))
  ..fields.addAll(_genNonComputedFields(dataClass))
  ..methods.addAll(_nonDefaultedFieldsGetter(dataClass))
  ..methods.addAll(_defaultedFieldsGetter(dataClass))
  ..methods.addAll(_genComputedFieldsGetter(dataClass))
  ..methods.add(_hashCode(dataClass))
  ..methods.add(_equality(dataClass))
  ..methods.add(_toString(dataClass)));

Iterable<Code> _initializer(DataClassField field) => [
      Code('_${field.propertyName} = ${field.propertyName}'),
      Code('assert(${field.propertyName} != null)'),
    ];

Iterable<Reference> _mixins(DataClass dataClass) => dataClass.mixins
    .map((m) => Reference(dataClass.metaClassReference.symbol + m));

Method _clone(DataClass dataClass) => Method((b) => b
  ..name = 'clone'
  ..returns = Reference(
    dataClass.metaClassReference.symbol +
        classGenerics(dataClass.metaClassReference.generics),
  )
  ..optionalParameters
      .addAll(dataClass.allNonComputedFields.map((f) => Parameter((b) => b
        ..named = true
        ..name = f.propertyName
        ..type = Reference(f.returnTypeName))))
  ..body = Code('''
  return ${dataClass.metaClassReference.symbol}(${_cloneParams(dataClass)});
  '''));

String _cloneParams(DataClass dataClass) => dataClass.allNonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb${field.propertyName}: ${field.propertyName} ?? _${field.propertyName},');

Method _equality(DataClass dataClass) => Method((b) => b
  ..name = 'operator =='
  ..returns = TypeReference((b) => b..symbol = 'bool')
  ..requiredParameters.add(Parameter((b) => b
    ..name = 'other'
    ..type = Reference('dynamic')))
  ..body = Code('''
    if (identical(other, this)) return true;
    if (other is! ${dataClass.metaClassReference.symbol}) return false;
    return ${_equalityFold(dataClass.allNonComputedFields)};
  '''));

String _equalityFold(Iterable<DataClassField> e) => e
    .map((field) => '${field.propertyName} == other.${field.propertyName}')
    .join('&&');

Method _hashCode(DataClass dataClass) => Method((b) => b
  ..name = 'hashCode'
  ..type = MethodType.getter
  ..returns = TypeReference((b) => b..symbol = 'int')
  ..body = Code('''
    return \$jf(${_hashFold(dataClass.allNonComputedFields)});
  '''));

String _hashFold(Iterable<DataClassField> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, ${field.propertyName}.hashCode)');

Method _toString(DataClass dataClass) => Method((b) => b
  ..name = 'toString'
  ..returns = TypeReference((b) => b..symbol = 'String')
  ..body = Code('''
    return "${dataClass.metaClassReference.symbol} (${_toStringFold(dataClass.allNonDefaultedFields)})";
  '''));

String _toStringFold(Iterable<DataClassField> e) => e
    .map((field) => '${field.propertyName}: \$${field.propertyName}')
    .join(', ');

Iterable<Field> _genNonComputedFields(DataClass e) =>
    e.allNonComputedFields.map((field) => Field((b) => b
      ..modifier = FieldModifier.final$
      ..name = '_${field.propertyName}'
      ..type = Reference(field.returnTypeName)));

Iterable<Field> _genComputedFields(DataClass e) =>
    e.computedFields.map((field) => Field((b) => b
      ..name = '_${field.propertyName}'
      ..type = Reference(field.returnTypeName)));

Iterable<Method> _nonDefaultedFieldsGetter(DataClass e) =>
    e.allNonDefaultedFields.map((field) => Method((b) => b
      ..name = field.propertyName
      ..returns = Reference(field.returnTypeName)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.propertyName};
      ''')));

Iterable<Method> _defaultedFieldsGetter(DataClass e) =>
    e.allDefaultedFields.map((field) => Method((b) => b
      ..name = field.propertyName
      ..returns = Reference(field.returnTypeName)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.propertyName} ?? super.${field.propertyName};
      ''')));

Iterable<Method> _genComputedFieldsGetter(DataClass e) =>
    e.computedFields.map((field) => Method((b) => b
      ..name = field.propertyName
      ..returns = Reference(field.returnTypeName)
      ..type = MethodType.getter
      ..body = Code('''
        return _${field.propertyName} ??= super.${field.propertyName};
      ''')));
