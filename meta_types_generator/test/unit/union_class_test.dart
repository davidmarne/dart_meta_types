import 'package:test/test.dart';

import 'models/models.dart';

void main() {
  group('Sealed class: ', () {
    test('string-int', () {
      final testInteger = 9;
      final testString = '9';
      final intInstance = new TestSealedClass.integerFactory(testInteger);
      final stringInstance = new TestSealedClass.stringFactory(testString);

      // test equality & hash override
      expect(intInstance == stringInstance, isFalse);
      expect(intInstance.hashCode == stringInstance.hashCode, isFalse);

      final intClone = new TestSealedClass.integerFactory(testInteger);
      expect(intInstance == intClone, isTrue);
      expect(intInstance.hashCode == intClone.hashCode, isTrue);

      final stringClone = new TestSealedClass.stringFactory(testString);
      expect(stringInstance == stringClone, isTrue);
      expect(stringInstance.hashCode == stringClone.hashCode, isTrue);

      expect(intInstance.integer, testInteger);
      expect(intInstance.integerSet, isTrue);
      expect(intInstance.string, isNull);
      expect(intInstance.stringSet, isFalse);

      expect(stringInstance.string, testString);
      expect(stringInstance.stringSet, isTrue);
      expect(stringInstance.integer, isNull);
      expect(stringInstance.integerSet, isFalse);

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
      final intInstance = new NestingSealedClass.nestedFactory(
        new NestedSealedClass.integerFactory(testInteger),
      );
      final stringInstance = new NestingSealedClass.nestedFactory(
        new NestedSealedClass.stringFactory(testString),
      );

      // test equality & hash override
      expect(intInstance == stringInstance, isFalse);
      expect(intInstance.hashCode == stringInstance.hashCode, isFalse);

      final intClone = new NestingSealedClass.nestedFactory(
        new NestedSealedClass.integerFactory(testInteger),
      );
      expect(intInstance == intClone, isTrue);
      expect(intInstance.hashCode == intClone.hashCode, isTrue);

      final stringClone = new NestingSealedClass.nestedFactory(
        new NestedSealedClass.stringFactory(testString),
      );
      expect(stringInstance == stringClone, isTrue);
      expect(stringInstance.hashCode == stringClone.hashCode, isTrue);

      expect(intInstance.nested.integer, testInteger);
      expect(intInstance.nested.integerSet, isTrue);
      expect(intInstance.nested.string, isNull);
      expect(intInstance.nested.stringSet, isFalse);

      expect(stringInstance.nested.string, testString);
      expect(stringInstance.nested.stringSet, isTrue);
      expect(stringInstance.nested.integer, isNull);
      expect(stringInstance.nested.integerSet, isFalse);

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
