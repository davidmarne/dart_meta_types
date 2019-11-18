import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, Option, Generic, TypeParameterDeclaration, FieldType;
// import 'data_class_meta_generator.dart';
import '../util.dart';

Class generateDataSerializer(Data<DataField> dataClass) => Class((b) => b
  ..abstract = false
  ..name = '${dataClass.name}Serializer'
  ..extend = Reference('StructuredSerializer<${dataClass.name}>')
  ..methods.add(_serialize(dataClass))
  ..methods.add(_deserialize(dataClass))
  ..fields.add(_types(dataClass))
  ..fields.add(_wireName(dataClass)));

Method _serialize(Data<DataField> dataClass) => Method((b) => b
  ..annotations.add(Reference('override'))
  ..name = 'serialize'
  ..returns = Reference('Iterable<Object>')
  ..requiredParameters.add(Parameter((b) => b
    ..name = 'serializers'
    ..named = false
    ..type = Reference('Serializers')))
  ..requiredParameters.add(Parameter((b) => b
    ..name = 'object'
    ..named = false
    ..type = Reference(dataClass.name)))
  ..optionalParameters.add(Parameter((b) => b
    ..name = 'specifiedType'
    ..named = true
    ..type = Reference('FullType')
    ..defaultTo = Code('FullType.unspecified')))
  ..body = Code('''
    ${_paramDeclaration(dataClass)}
    return <Object>[${_generateSerializeValues(dataClass)}];
  '''));

String _generateSerializeValues(Data<DataField> dataClass) =>
    dataClass.nonComputedFields
        .map((f) => [
              '\'${f.name}\'',
              'serializers.serialize(object.${f.name}, specifiedType: ${_fullType(dataClass, f.returnType)})',
            ])
        .expand((f) => f)
        .join(',');

Method _deserialize(Data<DataField> dataClass) => Method(
      (b) => b
        ..annotations.add(Reference('override'))
        ..name = 'deserialize'
        ..returns = Reference(dataClass.name)
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'serializers'
          ..named = false
          ..type = Reference('Serializers')))
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'serialized'
          ..named = false
          ..type = Reference('Iterable<Object>')))
        ..optionalParameters.add(Parameter((b) => b
          ..name = 'specifiedType'
          ..named = true
          ..type = Reference('FullType')
          ..defaultTo = Code('FullType.unspecified')))
        ..body = Code('''
            ${_paramDeclaration(dataClass)}
            ${_loaders(dataClass)}
            final iterator = serialized.iterator;
            while (iterator.moveNext()) {
              final key = iterator.current as String;
              iterator.moveNext();
              final dynamic value\$ = iterator.current;
              switch (key) {
                ${_switchClauses(dataClass)}
              }
            }

            return ${dataClass.name}${_downgradeGenerics(dataClass)}(${_constructorParams(dataClass)});
        '''),
    );

String _downgradeGenerics(Data dataClass) => dataClass.typeParameters.isEmpty
    ? ''
    : '<${dataClass.typeParameters.map(_downgradeGeneric).join(',')}>';

String _downgradeGeneric(TypeParameterDeclaration p) => p.extension.when(
      none: () => 'Object',
      some: (s) => s.typeStr,
    );

String _readTypeArgs(Data<DataField> data) =>
    data.typeParameters.isEmpty ? '' : '${classGenerics(data.typeParameters)}';

String _paramDeclaration(Data<DataField> dataClass) =>
    dataClass.typeParameters.isEmpty
        ? ''
        : '''
  final isUnderspecified = specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
  ${_paramVarDeclarations(dataClass)}
''';

String _paramVarDeclarations(Data<DataField> dataClass) =>
    dataClass.typeParameters.toList().asMap().entries.fold(
        '', (comb, next) => comb + _paramVarDeclaration(next.key, next.value));

String _paramVarDeclaration(int index, TypeParameterDeclaration param) =>
    'final param${param.type} = isUnderspecified ? FullType.object : specifiedType.parameters[$index];';

String _constructorParams(Data<DataField> dataClass) =>
    dataClass.nonComputedFields
        .fold('', (comb, next) => comb + _constructorParam(dataClass, next));

String _constructorParam(Data d, DataField f) =>
    '${f.name}: ${f.name} as ${_downgradeGenericCast(d, f.returnType)},';

String _downgradeGenericCast(Data d, FieldType f) => d.typeParameters
        .any((g) => g.type == f.type)
    ? _downgradeGeneric(d.typeParameters.firstWhere((g) => g.type == f.type))
    : f.type +
        f.generics.when(
            some: (s) =>
                '<${s.map((f) => _downgradeGenericCast(d, f)).join(',')}>',
            none: () => '');

String _loaders(Data<DataField> dataClass) =>
    dataClass.nonComputedFields.fold('', (comb, next) => comb + _loader(next));

String _loader(DataField f) => 'Object ${f.name};';

String _switchClauses(Data<DataField> dataClass) => dataClass.nonComputedFields
    .fold('', (comb, next) => comb + _switchClause(dataClass, next));

String _switchClause(Data d, DataField f) => '''
  case '${f.name}':
    ${f.name} = serializers.deserialize(value\$,
        specifiedType: ${_fullType(d, f.returnType)});
    break;
''';

String _fullType(Data d, FieldType f) =>
    d.typeParameters.any((g) => g.type == f.type)
        ? 'param${f.type}'
        : _fullType2(d, f);

String _fullType2(Data d, FieldType f) =>
    'FullType(${_replaceTypeArg(d, f)}${_fullTypeArgs(d, f)})';

String _fullTypeArgs(Data d, FieldType f) => f.generics.when(
      none: () => '',
      some: (generics) => ', [${_fullTypeArg(d, generics)}]',
    );

String _fullTypeArg(Data d, Iterable<FieldType> generics) => generics
    .map((f) => d.typeParameters.any((g) => g.type == f.type)
        ? 'param${f.type}'
        : _fullType(d, f))
    .join(',');

String _replaceTypeArg(Data d, FieldType f) =>
    d.typeParameters.any((g) => g.type == f.type) ? 'param${f.type}' : f.type;

Field _types(Data<DataField> dataClass) => Field((b) => b
  ..annotations.add(Reference('override'))
  ..name = 'types'
  ..modifier = FieldModifier.final$
  ..type = Reference('Iterable<Type>')
  ..assignment = Code('const [${dataClass.name}]'));

Field _wireName(Data<DataField> dataClass) => Field((b) => b
  ..annotations.add(Reference('override'))
  ..name = 'wireName'
  ..modifier = FieldModifier.final$
  ..type = Reference('String')
  ..assignment = Code('\'${dataClass.name}\''));
