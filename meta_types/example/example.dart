import 'package:meta_types/meta_types.dart';
import 'package:meta_types/core.dart';

part 'example.g.dart';

// ExampleSumClass will require one and only
// on of the following fields are set.
@sum
abstract class $ExampleSumClass {
  int get integer;
  String get string;
}

// regular data class
@data
abstract class $ExampleDataClass {
  // fieldWithNoDefault is a field without a default value
  // the constructor will require a value be passed for this param
  int get fieldWithNoDefault;

  // fieldWithDefault uses a default value of 10 if
  // no other value is passed to the constructor
  int get fieldWithDefault => 10;

  // data class fields are not nullable, one must
  // use the Option sum type to represent nullable fields
  Option<int> get nullable;

  // computed fields memoize the result of the getter function
  @computed
  int get computedField => fieldWithDefault + 5;
}

// InterfaceDataClass must only be implemented. No code will be generated.
@dataInterface
abstract class InterfaceDataClass {
  String get foo;
}

// ImplementorDataClass will implement $InterfaceDataClass
@data
abstract class $ImplementorDataClass implements InterfaceDataClass {
  int get baz;
}

@data
abstract class $ImplementorDataClass2 implements InterfaceDataClass {
  int get bar;
}

// sealed class is a sum of InterfaceDataClass.
// all fields must implement InterfaceDataClass.
// Any fields form InterfaceDataClass will be accesiable
// from instance of SealedDataClass.
@seal
abstract class $SealedDataClass implements InterfaceDataClass {
  ImplementorDataClass get one;
  ImplementorDataClass2 get two;
}

// enum class, all fields must be static const

@enumeration
abstract class $ExampleEnumString {
  const $ExampleEnumString();

  static const String a = 'a';
  static const String b = 'b';
  static const String c = 'c';
}

// Binary tree is an example of an algebreic data type

@sum
abstract class $BinaryTree<T> {
  T get leaf;
  Branch<T> get branch;
}

@data
abstract class $Branch<T> {
  T get val;
  BinaryTree<T> get left;
  BinaryTree<T> get right;
}

void traverse(BinaryTree<int> tree) => tree.when(
      leaf: (val) {
        print(val);
      },
      branch: (b) {
        print(b.val);
        traverse(b.left);
        traverse(b.right);
      },
    );
