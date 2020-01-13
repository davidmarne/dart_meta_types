import 'package:test/test.dart';

import 'models/models.dart';
import 'package:meta_types/meta_types.dart';

void main() {
  group('dataclass: ', () {
    group('field types: ', () {
      // test('using default', () {
      //   final testFieldWithNoDefault = 9;
      //   final instance =
      //       new TestDataClass(fieldWithNoDefault: testFieldWithNoDefault);
      //   final copy = instance.copy();

      //   // test equality & hash override
      //   expect(copy == instance, isTrue);
      //   expect(copy.hashCode == instance.hashCode, isTrue);

      //   expect(instance.fieldWithNoDefault, testFieldWithNoDefault);
      //   expect(instance.fieldWithDefault, 10);
      //   expect(instance.computedField, 10);
      // });

      // test('overriding default', () {
      //   final testFieldWithNoDefault = 9;
      //   final testFieldWithDefault = 99;
      //   final instance = new TestDataClass(
      //       fieldWithNoDefault: testFieldWithNoDefault,
      //       fieldWithDefault: testFieldWithDefault);
      //   final copy = instance.copy();

      //   // test equality & hash override
      //   expect(copy == instance, isTrue);
      //   expect(copy.hashCode == instance.hashCode, isTrue);

      //   expect(instance.fieldWithNoDefault, testFieldWithNoDefault);
      //   expect(instance.fieldWithDefault, testFieldWithDefault);
      //   expect(instance.computedField, testFieldWithDefault);
      // });

      test('serialize sum', () {
        final s = SerializeSum.a(9);
        final ser = SerializeSumSerializer();
        final data = serializers.serializeWith(ser, s);
        print(data);
      });
      test('serialize data', () {
        final s = SerializeData(x: 0, y: 1);
        final ser = SerializeDataSerializer();
        final data = serializers.serializeWith(ser, s);
        print(data);
      });
    });
  });
}

final serializers = (Serializers().toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addAll([
        SerializeDataSerializer(),
        SerializeSumSerializer(),
      ]))
    .build();
