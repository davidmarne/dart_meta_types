import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart' show Sum, SumField;
import '../common/serializer_utils.dart';

Class generateSumSerializer(Sum<SumField> sumClass) => Class(
      (b) => b
        ..abstract = false
        ..name = '${sumClass.name}Serializer'
        ..extend = Reference('StructuredSerializer<${sumClass.name}>')
        ..methods.add(
          serialize(
            sumClass.name,
            sumClass.typeParameters,
            _serializeBody(sumClass),
          ),
        )
        ..methods.add(
          deserialize(
            sumClass.name,
            sumClass.typeParameters,
            _deserializeBody(sumClass),
          ),
        )
        ..fields.add(types(sumClass.name))
        ..fields.add(
          wireName(sumClass.name),
        ),
    );

String _serializeBody(Sum<SumField> sumClass) => '''
  return object.when(
    ${_generateSerializeValues(sumClass)}
  );
''';

String _generateSerializeValues(Sum<SumField> sumClass) =>
    sumClass.nonComputedFields
        .map(
          (f) =>
              '${f.name}: (object) => [\'kind\', serializers.serialize(\'${f.name}\', specifiedType: FullType(String)), \'value\', serializers.serialize(object, specifiedType: ${fullType(sumClass.typeParameters, f.returnType)})]',
        )
        .join(',');

String _deserializeBody(Sum<SumField> sumClass) => '''
  final iterator = serialized.iterator;
  iterator.moveNext();
  iterator.moveNext();
  final key = iterator.current as String;
  iterator.moveNext();
  iterator.moveNext();
  final dynamic value\$ = iterator.current;
  switch(key) {
    ${_switchClauses(sumClass)}
  }
  throw FallThroughError();
''';

String _switchClauses(Sum<SumField> sumClass) => sumClass.nonComputedFields
    .fold('', (comb, next) => comb + _switchClause(sumClass, next));

String _switchClause(Sum<SumField> e, SumField f) => '''
  case '${f.name}':
    return ${e.name}.${f.name}(serializers.deserialize(value\$, specifiedType: ${fullType(e.typeParameters, f.returnType)}));
''';
