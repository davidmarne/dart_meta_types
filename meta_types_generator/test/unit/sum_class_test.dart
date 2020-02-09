import 'package:test/test.dart';

import 'test_models/sum.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('sumclass: ', () {
    test('when', () {
      const a = SumConst.a(2);
      final aDoubled = a.when(a: (a) => a * 2, b: (b) => b.toInt() * 2);
      expect(aDoubled, equals(4));

      const b = SumConst.b(3);
      final bDoubled = b.when(a: (a) => a * 2, b: (b) => b.toInt() * 2);
      expect(bDoubled, equals(6));
    });
    test('wheno', () {
      const a = SumConst.a(2);
      final aResult = a.wheno(otherwise: () => 2, b: (b) => b.toInt() * 2);
      expect(aResult, equals(2));

      const b = SumConst.b(3);
      final bResult = b.wheno(otherwise: () => 2, b: (b) => b.toInt() * 2);
      expect(bResult, equals(6));
    });
    test('when fields', () {
      const a = SumConst.a(2);
      a.whenA((v) => expect(v, 2));
      a.whenB((v) => fail('should not be called'));

      const b = SumConst.b(2);
      b.whenA((v) => fail('should not be called'));
      b.whenB((v) => expect(v, 2));
    });

    test('is fields', () {
      const a = SumConst.a(2);
      expect(a.isA, isTrue);
      expect(a.isB, isFalse);

      const b = SumConst.b(2);
      expect(b.isA, isFalse);
      expect(b.isB, isTrue);
    });
    test('const', () {
      const constSum = SumConst.a(3);
      _expectEquality(constSum, SumConst.a(3));
      _expectSerializable(constSum, FullType(SumConstSerializer));
      expect(constSum == SumConst.b(3), isFalse);
    });
    test('with void', () {
      const a = SumWithVoid.a(3);
      _expectEquality(a, SumWithVoid.a(3));
      _expectSerializable(a, FullType(SumWithVoidSerializer));

      const v = SumWithVoid.v();
      _expectEquality(v, SumWithVoid.v());
      _expectSerializable(v, FullType(SumWithVoidSerializer));
    });
    test('computed values', () {
      final a = SumComputedFields.a(3);
      expect(a.a, 3);
      expect(a.doubled, 6);
      _expectEquality(a, SumComputedFields.a(3));
      _expectSerializable(a, FullType(SumComputedFieldsSerializer));

      final b = SumComputedFields.b(3.0);
      expect(b.b, 3.0);
      expect(a.doubled, 6);
      _expectEquality(b, SumComputedFields.b(3.0));
      _expectSerializable(b, FullType(SumComputedFieldsSerializer));
    });
    test('generics', () {
      final genericNoExtension =
          SumGenerics<int, DataInterfaceBasicImplementation>.genericNoExtension(
              2);

      _expectEquality(
          genericNoExtension,
          SumGenerics<int, DataInterfaceBasicImplementation>.genericNoExtension(
              2));

      _expectSerializable(
          genericNoExtension,
          FullType(SumGenericsSerializer, [
            FullType(int),
            FullType(DataInterfaceBasicImplementation),
          ]));

      final genericSumExtension = SumGenerics<int,
          DataInterfaceBasicImplementation>.genericSumExtension(
        DataInterfaceBasicImplementation(
          inheritedValue: 0,
          concreteValue: 1,
        ),
      );

      _expectEquality(
          genericSumExtension,
          SumGenerics<int,
              DataInterfaceBasicImplementation>.genericSumExtension(
            DataInterfaceBasicImplementation(
              inheritedValue: 0,
              concreteValue: 1,
            ),
          ));

      _expectSerializable(
          genericSumExtension,
          FullType(SumGenericsSerializer, [
            FullType(int),
            FullType(DataInterfaceBasicImplementation),
          ]));
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
        SumGenericsSerializer(),
        SumConstSerializer(),
        SumComputedFieldsSerializer(),
        SumWithVoidSerializer(),
      ]))
    .build();
