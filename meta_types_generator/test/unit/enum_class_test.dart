import 'package:test/test.dart';

import 'test_models/enumeration.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('enumclass: ', () {
    test('ordinal', () {
      expect(TestEnum.a.ordinal, equals(0));
      expect(TestEnum.b.ordinal, equals(1));
    });
    test('values', () {
      expect(TestEnum.values.length, equals(2));
      expect(TestEnum.a, equals(TestEnum.values[0]));
      expect(TestEnum.b, equals(TestEnum.values[1]));
    });
    test('when', () {
      const a = TestEnum.a;
      final aDoubled = a.when(a: (a) => a, b: (b) => fail('should not be b'));
      expect(aDoubled, equals(0));

      const b = TestEnum.b;
      final bDoubled = b.when(a: (a) => fail('should not be a'), b: (b) => b);
      expect(bDoubled, equals('b'));
    });
    test('wheno', () {
      const a = TestEnum.a;
      final aDoubled =
          a.wheno(otherwise: () => 5, b: (b) => fail('should not be b'));
      expect(aDoubled, equals(5));

      const b = TestEnum.b;
      final bDoubled =
          b.wheno(a: (a) => fail('should not be a'), otherwise: () => 'foo');
      expect(bDoubled, equals('foo'));
    });
    test('when fields', () {
      const a = TestEnum.a;
      a.whenA((v) => expect(v, 0));
      a.whenB((v) => fail('should not be called'));

      const b = TestEnum.b;
      b.whenA((v) => fail('should not be called'));
      b.whenB((v) => expect(v, 'b'));
    });

    test('is fields', () {
      const a = TestEnum.a;
      expect(a.isA, isTrue);
      expect(a.isB, isFalse);

      const b = TestEnum.b;
      expect(b.isA, isFalse);
      expect(b.isB, isTrue);
    });
    test('serialize and equality', () {
      const enu = TestEnum.a;
      _expectEquality(enu, TestEnum.a);
      _expectSerializable(enu, FullType(TestEnumSerializer));
      // ignore: unrelated_type_equality_checks
      expect(enu == TestEnum.b, isFalse);
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
        TestEnumSerializer(),
      ]))
    .build();
