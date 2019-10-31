import 'package:test/test.dart';

import 'models/models.dart';

void main() {
  group('Sealed class: ', () {
    test('string-int', () {
      final testInteger = 9;
      final testString = '9';
      final intInstance = new TestSealedClass.integer(testInteger);
      final stringInstance = new TestSealedClass.string(testString);

      // test equality & hash override
      expect(intInstance == stringInstance, isFalse);
      expect(intInstance.hashCode == stringInstance.hashCode, isFalse);

      final intClone = new TestSealedClass.integer(testInteger);
      expect(intInstance == intClone, isTrue);
      expect(intInstance.hashCode == intClone.hashCode, isTrue);

      final stringClone = new TestSealedClass.string(testString);
      expect(stringInstance == stringClone, isTrue);
      expect(stringInstance.hashCode == stringClone.hashCode, isTrue);

      expect(intInstance.integer, testInteger);
      expect(intInstance.isInteger, isTrue);
      expect(intInstance.string, isNull);
      expect(intInstance.isString, isFalse);

      expect(stringInstance.string, testString);
      expect(stringInstance.isString, isTrue);
      expect(stringInstance.integer, isNull);
      expect(stringInstance.isInteger, isFalse);

      intInstance.when<void>(
        integer: expectAsync1((int v) {}),
        string: (String v) => fail('string should not be called'),
      );

      stringInstance.when<void>(
        integer: (int v) => fail('int should not be called'),
        string: expectAsync1((String v) {}),
      );
    });

    test('nested', () {
      final testInteger = 9;
      final testString = '9';
      final intInstance = new NestingSealedClass.nested(
        new NestedSealedClass.integer(testInteger),
      );
      final stringInstance = new NestingSealedClass.nested(
        new NestedSealedClass.string(testString),
      );

      // test equality & hash override
      expect(intInstance == stringInstance, isFalse);
      expect(intInstance.hashCode == stringInstance.hashCode, isFalse);

      final intClone = new NestingSealedClass.nested(
        new NestedSealedClass.integer(testInteger),
      );
      expect(intInstance == intClone, isTrue);
      expect(intInstance.hashCode == intClone.hashCode, isTrue);

      final stringClone = new NestingSealedClass.nested(
        new NestedSealedClass.string(testString),
      );
      expect(stringInstance == stringClone, isTrue);
      expect(stringInstance.hashCode == stringClone.hashCode, isTrue);

      expect(intInstance.nested.integer, testInteger);
      expect(intInstance.nested.isInteger, isTrue);
      expect(intInstance.nested.string, isNull);
      expect(intInstance.nested.isString, isFalse);

      expect(stringInstance.nested.string, testString);
      expect(stringInstance.nested.isString, isTrue);
      expect(stringInstance.nested.integer, isNull);
      expect(stringInstance.nested.isInteger, isFalse);

      intInstance.nested.when<void>(
        integer: expectAsync1((int v) {}),
        string: (String v) => fail('string should not be called'),
      );

      stringInstance.nested.when<void>(
        integer: (int v) => fail('int should not be called'),
        string: expectAsync1((String v) {}),
      );

      final result = stringInstance.when<int>(
        integer: (int v) => fail('int should not be called'),
        nested: expectAsync1<int, NestedSealedClass>(
          (v) => v.when<int>(
            integer: (int v) => fail('int should not be called'),
            string: expectAsync1((String v) => 5),
          ),
        ),
      );

      expect(result, 5);
    });

    test('b-tree dfs traversal', () {
      expect(preorderTraversal(testTree), '1,2,3,4,5');
    });
  });
}
