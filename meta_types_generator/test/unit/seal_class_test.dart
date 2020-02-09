import 'package:test/test.dart';

import 'test_models/seal.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('sealclass: ', () {
    test('when', () {
      final a = Seal.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      final aDoubled = a.when(
        a: (a) => a.inheritedValue * 2,
        b: (b) => b.inheritedValue * 3,
      );
      expect(aDoubled, equals(2));

      final b = Seal.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      final bDoubled = b.when(
        a: (a) => a.inheritedValue * 2,
        b: (b) => b.inheritedValue * 3,
      );
      expect(bDoubled, equals(3));
    });
    test('wheno', () {
      final a = Seal.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      final aDoubled = a.wheno(
        b: (b) => b.inheritedValue * 3,
        otherwise: () => 5,
      );
      expect(aDoubled, equals(5));

      final b = Seal.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      final bDoubled = b.wheno(
        a: (a) => a.inheritedValue * 2,
        otherwise: () => 5,
      );
      expect(bDoubled, equals(5));
    });
    test('when fields', () {
      final a = Seal.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      a.whenA((v) => expect(v.a, 2));
      a.whenB((v) => fail('should not be called'));

      final b = Seal.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      b.whenA((v) => fail('should not be called'));
      b.whenB((v) => expect(v.b, 2));
    });

    test('is fields', () {
      final a = Seal.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      expect(a.isA, isTrue);
      expect(a.isB, isFalse);

      final b = Seal.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      expect(b.isA, isFalse);
      expect(b.isB, isTrue);
    });

    test('inherited field', () {
      final a = Seal.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      expect(a.inheritedValue, 1);

      final b = Seal.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      expect(b.inheritedValue, 1);
    });
    test('const', () {
      const constSeal = SealConst.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      _expectEquality(
          constSeal,
          SealConst.a(
            const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
          ));
      _expectSerializable(constSeal, FullType(SealConstSerializer));
    });
    test('computed values', () {
      final a = SealComputedFields.a(
        const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
      );
      expect(a.a.a, 2);
      expect(a.value, 2);
      _expectEquality(
          a,
          SealComputedFields.a(
            const DataInterfaceBasicImplementationA(a: 2, inheritedValue: 1),
          ));
      _expectSerializable(a, FullType(SealComputedFieldsSerializer));

      final b = SealComputedFields.b(
        const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
      );
      expect(b.b.b, 2);
      expect(b.value, 2);
      _expectEquality(
          b,
          SealComputedFields.b(
            const DataInterfaceBasicImplementationB(b: 2, inheritedValue: 1),
          ));
      _expectSerializable(b, FullType(SealComputedFieldsSerializer));
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
        SealSerializer(),
        SealConstSerializer(),
        SealComputedFieldsSerializer(),
        DataInterfaceBasicImplementationASerializer(),
        DataInterfaceBasicImplementationBSerializer(),
      ]))
    .build();
