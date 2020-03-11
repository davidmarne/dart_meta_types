import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart' show Sealed, SealedField, DataField;
import '../common/serializer_utils.dart';

Class generateSealedSerializer(Sealed<SealedField, DataField> sealClass) =>
    Class(
      (b) => b
        ..abstract = false
        ..name = '${sealClass.name}Serializer'
        ..extend = Reference('StructuredSerializer<${sealClass.name}>')
        ..methods.add(
          serialize(
            sealClass.name,
            sealClass.typeParameters,
            _serializeBody(sealClass),
          ),
        )
        ..methods.add(
          deserialize(
            sealClass.name,
            sealClass.typeParameters,
            _deserializeBody(sealClass),
          ),
        )
        ..fields.add(types(sealClass.name))
        ..fields.add(
          wireName(sealClass.name),
        ),
    );

String _serializeBody(Sealed<SealedField, DataField> sealClass) => '''
  return object.when(
    ${_generateSerializeValues(sealClass)}
  );
''';

String _generateSerializeValues(Sealed<SealedField, DataField> sealClass) =>
    sealClass.nonComputedFields
        .map(
          (f) =>
              '${f.name}: (object) => [\'kind\', serializers.serialize(\'${f.name}\', specifiedType: FullType(String)), \'value\', serializers.serialize(object, specifiedType: ${fullType(sealClass.typeParameters, f.returnType)})]',
        )
        .join(',');

String _deserializeBody(Sealed<SealedField, DataField> sealClass) => '''
  final iterator = serialized.iterator;
  iterator.moveNext();
  iterator.moveNext();
  final key = iterator.current as String;
  iterator.moveNext();
  iterator.moveNext();
  final dynamic value\$ = iterator.current;
  switch(key) {
    ${_switchClauses(sealClass)}
  }
  throw FallThroughError();
''';

String _switchClauses(Sealed<SealedField, DataField> sealClass) =>
    sealClass.nonComputedFields
        .fold('', (comb, next) => comb + _switchClause(sealClass, next));

String _switchClause(Sealed<SealedField, DataField> e, SealedField f) => '''
  case '${f.name}':
    return ${e.name}.${f.name}(serializers.deserialize(value\$, specifiedType: ${fullType(e.typeParameters, f.returnType)}) as ${f.returnType.type});
''';
