import 'package:test/test.dart';

import 'models/models.dart';

void main() {
  group('dataclass: ', () {
    group('field types: ', () {
      test('using default', () {
        final testFieldWithNoDefault = 9;
        final instance =
            new TestDataClass(fieldWithNoDefault: testFieldWithNoDefault);
        final clone = instance.clone();

        // test equality & hash override
        expect(clone == instance, isTrue);
        expect(clone.hashCode == instance.hashCode, isTrue);

        expect(instance.fieldWithNoDefault, testFieldWithNoDefault);
        expect(instance.fieldWithDefault, 10);
        expect(instance.computedField, 10);
      });

      test('overriding default', () {
        final testFieldWithNoDefault = 9;
        final testFieldWithDefault = 99;
        final instance = new TestDataClass(
            fieldWithNoDefault: testFieldWithNoDefault,
            fieldWithDefault: testFieldWithDefault);
        final clone = instance.clone();

        // test equality & hash override
        expect(clone == instance, isTrue);
        expect(clone.hashCode == instance.hashCode, isTrue);

        expect(instance.fieldWithNoDefault, testFieldWithNoDefault);
        expect(instance.fieldWithDefault, testFieldWithDefault);
        expect(instance.computedField, testFieldWithDefault);
      });
    });
  });
}
