import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show TypeParameterDeclaration, FieldType;

Method serialize(
  String name,
  Iterable<TypeParameterDeclaration> typeParameters,
  String body,
) =>
    Method((b) => b
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
        ..type = Reference(name)))
      ..optionalParameters.add(Parameter((b) => b
        ..name = 'specifiedType'
        ..named = true
        ..type = Reference('FullType')
        ..defaultTo = Code('FullType.unspecified')))
      ..body = Code(_paramDeclaration(typeParameters) + body));

Method deserialize(
  String name,
  Iterable<TypeParameterDeclaration> typeParameters,
  String body,
) =>
    Method(
      (b) => b
        ..annotations.add(Reference('override'))
        ..name = 'deserialize'
        ..returns = Reference(name)
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
        ..body = Code(_paramDeclaration(typeParameters) + body),
    );

Field types(String name) => Field((b) => b
  ..annotations.add(Reference('override'))
  ..name = 'types'
  ..modifier = FieldModifier.final$
  ..type = Reference('Iterable<Type>')
  ..assignment = Code('const [$name]'));

Field wireName(String name) => Field((b) => b
  ..annotations.add(Reference('override'))
  ..name = 'wireName'
  ..modifier = FieldModifier.final$
  ..type = Reference('String')
  ..assignment = Code('\'$name\''));

// String restrictedSectionSerializeBody(M meta) =>

String _paramDeclaration(Iterable<TypeParameterDeclaration> typeParameters) =>
    typeParameters.isEmpty
        ? ''
        : '''
  final isUnderspecified = specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
  ${_paramVarDeclarations(typeParameters)}
''';

String _paramVarDeclarations(
        Iterable<TypeParameterDeclaration> typeParameters) =>
    typeParameters.toList().asMap().entries.fold(
        '', (comb, next) => comb + _paramVarDeclaration(next.key, next.value));

String _paramVarDeclaration(int index, TypeParameterDeclaration param) =>
    'final param${param.type} = isUnderspecified ? FullType.object : specifiedType.parameters[$index];';

// String _downgradeGenerics(Data dataClass) => dataClass.typeParameters.isEmpty
//     ? ''
//     : '<${dataClass.typeParameters.map(_downgradeGeneric).join(',')}>';

// String _downgradeGeneric(TypeParameterDeclaration p) => p.extension.when(
//       none: () => 'Object',
//       some: (s) => s.typeStr,
//     );

// String _readTypeArgs(Data<DataField> data) =>
//     data.typeParameters.isEmpty ? '' : '${classGenerics(data.typeParameters)}';

// String __paramDeclaration(Data<DataField> dataClass) =>
//     dataClass.typeParameters.isEmpty
//         ? ''
//         : '''
//   final isUnderspecified = specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
//   ${_paramVarDeclarations(dataClass)}
// ''';

// String _paramVarDeclarations(Data<DataField> dataClass) =>
//     dataClass.typeParameters.toList().asMap().entries.fold(
//         '', (comb, next) => comb + _paramVarDeclaration(next.key, next.value));

// String _paramVarDeclaration(int index, TypeParameterDeclaration param) =>
//     'final param${param.type} = isUnderspecified ? FullType.object : specifiedType.parameters[$index];';

// String _constructorParams(Data<DataField> dataClass) =>
//     dataClass.nonComputedFields
//         .fold('', (comb, next) => comb + _constructorParam(dataClass, next));

// String _constructorParam(Data d, DataField f) =>
//     '${f.name}: ${f.name} as ${_downgradeGenericCast(d, f.returnType)},';

// String _downgradeGenericCast(Data d, FieldType f) => d.typeParameters
//         .any((g) => g.type == f.type)
//     ? _downgradeGeneric(d.typeParameters.firstWhere((g) => g.type == f.type))
//     : f.type +
//         f.generics.when(
//             some: (s) =>
//                 '<${s.map((f) => _downgradeGenericCast(d, f)).join(',')}>',
//             none: () => '');

// String _loaders(Data<DataField> dataClass) =>
//     dataClass.nonComputedFields.fold('', (comb, next) => comb + _loader(next));

// String _loader(DataField f) => 'Object ${f.name};';

// String _switchClauses(Data<DataField> dataClass) => dataClass.nonComputedFields
//     .fold('', (comb, next) => comb + _switchClause(dataClass, next));

// String _switchClause(Data d, DataField f) => '''
//   case '${f.name}':
//     ${f.name} = serializers.deserialize(value\$,
//         specifiedType: ${_fullType(d, f.returnType)});
//     break;
// ''';
String fullType(
  Iterable<TypeParameterDeclaration> typeParameters,
  FieldType f,
) =>
    typeParameters.any((g) => g.type == f.type)
        ? 'param${f.type}'
        : _fullType(typeParameters, f);

String _fullType(
  Iterable<TypeParameterDeclaration> typeParameters,
  FieldType f,
) =>
    'FullType(${_replaceTypeArg(typeParameters, f)}${_fullTypeArgs(typeParameters, f)})';

String _fullTypeArgs(
        Iterable<TypeParameterDeclaration> typeParameters, FieldType f) =>
    f.generics.when(
      none: () => '',
      some: (generics) => ', [${_fullTypeArg(typeParameters, generics)}]',
    );

String _fullTypeArg(Iterable<TypeParameterDeclaration> typeParameters,
        Iterable<FieldType> generics) =>
    generics
        .map((f) => typeParameters.any((g) => g.type == f.type)
            ? 'param${f.type}'
            : fullType(typeParameters, f))
        .join(',');

String _replaceTypeArg(
        Iterable<TypeParameterDeclaration> typeParameters, FieldType f) =>
    typeParameters.any((g) => g.type == f.type) ? 'param${f.type}' : f.type;
