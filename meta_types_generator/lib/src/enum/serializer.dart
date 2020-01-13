import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Enum, EnumField, DataField;
import '../common/serializer_utils.dart';

Class generateEnumSerializer(Enum<EnumField, DataField> enumClass) =>
    Class((b) => b
      ..abstract = false
      ..name = '${enumClass.name}Serializer'
      ..extend = Reference('StructuredSerializer<${enumClass.name}>')
      ..methods.add(
        serialize(
          enumClass.name,
          enumClass.typeParameters,
          _serializeBody(enumClass),
        ),
      )
      ..methods.add(
        deserialize(
          enumClass.name,
          enumClass.typeParameters,
          _deserializeBody(enumClass),
        ),
      )
      ..fields.add(types(enumClass.name))
      ..fields.add(wireName(enumClass.name)));

String _serializeBody(Enum<EnumField, DataField> enumClass) => '''
  return <Object>[object.when(
    ${_generateSerializeValues(enumClass)}
  )];
''';
String _generateSerializeValues(Enum<EnumField, DataField> enumClass) =>
    enumClass.nonComputedFields
        .map(
          (f) =>
              '${f.name}: (object) => serializers.serialize(\'${f.name}\', specifiedType: FullType(String))',
        )
        .join(',');

String _deserializeBody(Enum<EnumField, DataField> enumClass) => '''
  switch(serialized.first as String) {
    ${_switchClauses(enumClass)}
  }
  throw FallThroughError();
''';

String _switchClauses(Enum<EnumField, DataField> enumClass) =>
    enumClass.nonComputedFields
        .fold('', (comb, next) => comb + _switchClause(enumClass, next));

String _switchClause(Enum<EnumField, DataField> e, EnumField f) => '''
  case '${f.name}':
    return ${e.name}.${f.name};
''';
