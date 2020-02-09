import 'package:test/test.dart';

import 'test_models/data.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('dataclass: ', () {
    test('copy', () {
      const constData = DataClassConst(value: 3);
      final copied = constData.copy(value: 4);
      expect(constData.value, equals(3));
      expect(copied.value, equals(4));
    });
    test('const', () {
      const constData = DataClassConst(value: 3);
      _expectEquality(constData, constData.copy());
      _expectSerializable(constData, FullType(DataClassConstSerializer));
    });
    test('default values', () {
      final overriden = DataClassDefaultFields(value: 3);
      expect(overriden.value, 3);
      _expectEquality(overriden, overriden.copy());
      _expectSerializable(
          overriden, FullType(DataClassDefaultFieldsSerializer));

      final defaulted = DataClassDefaultFields();
      expect(defaulted.value, 2);
      _expectEquality(defaulted, defaulted.copy());
      _expectSerializable(
          defaulted, FullType(DataClassDefaultFieldsSerializer));
    });
    test('computed values', () {
      final data = DataClassComputedFields(value: 3);
      expect(data.value, 3);
      expect(data.doubled, 6);
      _expectEquality(data, data.copy());
      _expectSerializable(data, FullType(DataClassComputedFieldsSerializer));
    });
    test('generics', () {
      final data = DataClassGenerics<int, DataInterfaceBasicImplementation>(
        genericNoExtension: 2,
        genericDataClassExtension: DataInterfaceBasicImplementation(
          inheritedValue: 0,
          concreteValue: 1,
        ),
      );

      _expectEquality(data, data.copy());
      _expectSerializable(
          data,
          FullType(DataClassGenericsSerializer, [
            FullType(int),
            FullType(DataInterfaceBasicImplementation),
          ]));
    });
    test('interface generics (unset)', () {
      final data = DataInterfaceGenericsImplementationUnset<int>(
        inheritedValue: 0,
        concreteValue: 1,
      );

      _expectEquality(data, data.copy());
      _expectSerializable(
          data,
          FullType(DataInterfaceGenericsImplementationUnset, [
            FullType(int),
          ]));
    });
    test('interface generics (set)', () {
      final data = DataInterfaceGenericsImplementationSet(
        inheritedValue: 0,
        concreteValue: 1,
      );

      _expectEquality(data, data.copy());
      _expectSerializable(
          data, FullType(DataInterfaceGenericsImplementationSet));
    });
  });
}

void _expectEquality<T>(T a, T b) {
  expect(a.hashCode, equals(b.hashCode));
  expect(a == b, isTrue);
}

void _expectSerializable<T>(T input, FullType type) {
  final serialized = serializers.serialize(input, specifiedType: type);
  final deserialized = serializers.deserialize(serialized, specifiedType: type);
  _expectEquality(input, deserialized);
}

final serializers = (Serializers().toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addAll([
        DataInterfaceBasicImplementationSerializer(),
        DataClassGenericsSerializer(),
        DataClassConstSerializer(),
        DataClassDefaultFieldsSerializer(),
        DataClassComputedFieldsSerializer(),
        DataInterfaceGenericsImplementationUnsetSerializer(),
        DataInterfaceGenericsImplementationSetSerializer(),
      ]))
    .build();
