import 'package:test/test.dart';

import 'test_models/enumeration.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('enumclass: ', () {
    test('when', () {
      const a = Enum.a;
      final aDoubled = a.when(a: (a) => a, b: (b) => fail('should not be b'));
      expect(aDoubled, equals(0));

      const b = Enum.b;
      final bDoubled = b.when(a: (a) => fail('should not be a'), b: (b) => b);
      expect(bDoubled, equals("b"));
    });
    test('wheno', () {
      const a = Enum.a;
      final aDoubled =
          a.wheno(otherwise: () => 5, b: (b) => fail('should not be b'));
      expect(aDoubled, equals(5));

      const b = Enum.b;
      final bDoubled =
          b.wheno(a: (a) => fail('should not be a'), otherwise: () => "foo");
      expect(bDoubled, equals("foo"));
    });
    test('when fields', () {
      const a = Enum.a;
      a.whenA((v) => expect(v, 0));
      a.whenB((v) => fail('should not be called'));

      const b = Enum.b;
      b.whenA((v) => fail('should not be called'));
      b.whenB((v) => expect(v, "b"));
    });

    test('is fields', () {
      const a = Enum.a;
      expect(a.isA, isTrue);
      expect(a.isB, isFalse);

      const b = Enum.b;
      expect(b.isA, isFalse);
      expect(b.isB, isTrue);
    });
    test('serialize and equality', () {
      const enu = Enum.a;
      _expectEquality(enu, Enum.a);
      _expectSerializable(enu, FullType(EnumSerializer));
      expect(enu == Enum.b, isFalse);
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
        EnumSerializer(),
      ]))
    .build();
