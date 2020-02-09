# dart_meta_types

[![Pub](https://img.shields.io/pub/v/meta_types.svg)](https://pub.dartlang.org/packages/meta_types)

a code gen solution for defining sum types, sealed classes, data classes, and enum classes for dart.
[examples](meta_types/example/example.dart).

## puropse

* provide means for defining algebreic data types in dart.
* define patterns and apis for generating 3rd party extensions to generated models. e.g. meta_types_firebase.
* provide means for meta-programming with your models without using dart:mirrors.

## How to use meta_types

* Define model definitions using annotations from the meta_types package.
* Add meta_types_generator and build_runner to your dev_dependencies
* generate code by running `pub run build_runner run`

See meta_types/example for examples on how to write model definitions.

## Features

* all types
  * serializable with built_value serializer
  * toString, hashCode, == implementaion
  * const constructors
  * computed values
  * generics
* data class
  * interfaces
  * copy method
  * default values
  * generated constructor
  * generics
* sum class
  * when method (exhaustive)
  * wheno method (non-exhaustive)
  * generated constructors
  * generics
  * methods to check if a given field is set
  * unsafe getters (throw when field is unset)
  * safe callbacks (provided method called only if corresponding field is set)
  * void type fields (TODO make serializable)
* sealed class
  * accessors to implemented fields
  * when method (exhaustive)
  * wheno method (non-exhaustive)
  * generated constructors
  * generics
  * methods to check if a given field is set
  * unsafe getters (throw when field is unset)
  * safe callbacks (provided method called only if corresponding field is set)
* enum class
  * enums with associated values of any type
  * values set
  * methods to check enumeration type
  * safe callbacks (provided method called only if correct enumeration type)
  * when method (exhaustive)
  * wheno method (non-exhaustive)

* TODO:
  * enum ordinal
  * serialization for void sum types
  * sound variance when released in dart
  * support nullable types when nnbd is released in dart

## Example - Binary tree ADT using sum and data classes

```dart

// model definitions

@sum
abstract class $BinaryTree<T> {
  T get leaf;
  Branch<T> get branch;
}

@data
abstract class $Branch<T> {
  T get value;
  BinaryTree<T> get left;
  BinaryTree<T> get right;
}
```

```dart
// model usage

void preorderTraversal(BinaryTree<int> tree) => tree.when(
      leaf: (val) {
        print(val);
      },
      branch: (b) {
        print(b.value);
        preorderTraversal(b.left);
        preorderTraversal(b.right);
      },
    );

final tree = BinaryTree<int>.branchFactory(
  Branch(
    value: 1,
    left: BinaryTree.branchFactory(
      Branch(
        value: 2,
        left: BinaryTree.leafFactory(3),
        right: BinaryTree.leafFactory(4),
      ),
    ),
    right: BinaryTree.leafFactory(5),
  ),
);

// prints 1, 2, 3, 4, 5
preorderTraversal(tree);
```

### Example: data class features
```dart
// model definition
@data
abstract class $ExampleDataClass {
  // fieldWithNoDefault is a field without a default value
  // the constructor will require a value be passed for this param
  int get fieldWithNoDefault;

  // fieldWithDefault uses a default value of 10 if
  // no other value is passed to the constructor
  int get fieldWithDefault => 10;

  // data class fields are not nullable, one must
  // use the Option class to represent nullable fields
  Option<int> get optional;

  // computed fields memoize the result of the getter function
  @computed
  int get computedField => fieldWithDefault + 5;
}
```


### Example: sealed class features

```dart
@dataInterface
abstract class SuperType {
  int get inheritedField;
}

@data
abstract class $SubclassA {
  int get fieldA;
}

@data
abstract class $SubclassB {
  int get fieldB;
}

@seal
abstract class $SealedTypeOfSuper implements SuperType {
  SubclassA get a;
  SubclassB get b;
}

// usage
final instanceOfA = SealedTypeOfSuper.a(SubclassA(fieldA: 2, inheritedField: 1));
final instanceOfB = SealedTypeOfSuper.b(SubclassB(fieldB: 3, inheritedField: 1));

// ...

print(instanceOfA); // SealedTypeOfSuper( SubclassA (fieldA: 2, inheritedField: 1) )
print(instanceOfB); // SealedTypeOfSuper( SubclassB (fieldB: 3, inheritedField: 1) )

print(instanceOfA.a); // ok
print(instanceOfA.b); // throws
print(instanceOfA.inheritedField); // ok

print(instanceOfA.isA); // true
print(instanceOfA.isB); // false

// prints SubclassA (fieldA: 2, inheritedField: 1)
instanceOfA.when(
  a: (a) => print(a),
  a: (a) => print(a),
)

```

see more examples [here](meta_types/example/example.dart)
