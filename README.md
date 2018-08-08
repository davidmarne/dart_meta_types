# dart_meta_types

[![Pub](https://img.shields.io/pub/v/meta_types.svg)](https://pub.dartlang.org/packages/meta_types)

a code gen solution for defining sealed classes, data classes, and enum classes for dart.
[examples](meta_types/example/example.dart).

## puropse

* attempt to keep dart up to par with data types supported by kotlin.
* provide means for defining algebreic data types in dart.
* define patterns and apis for generating 3rd party mixins to provide additional functionality to generated models. e.g. meta_types_json.
* support explicitly defining dataclasses as abstract, interface, extendable, and/or final. The generator can enforces strict practices for these concepts which dart-lang itself does not enforce.
* provide means for representing non-nullable and nullable types in your data model.
* provide means for meta-programming with your models without using dart:mirrors.

## How to use meta_types

* Define model definitions using annotations from the meta_types package.
* Add meta_types_generator and build_runner to your dev_dependencies
* generate code by running `pub run build_runner run`

See meta_types/example for examples on how to write model definitions.

## One rule to follow

When writing class definitions ALWAYS use other class definitions when referencing other meta types. When writing code ALWAYS use the generated classes. Using the class definitons gives the generator the ability to resolve type information for classes that have not yet been generated.

For this reason, class definitions for public models should always be made public.

## Types

* All metatypes are hashable and comparable.
* All meta_types extend from a base class that allow them to be used generically for metaprogramming.

For example, you can write a function that has in input of type `DataClass` which can be called with any data class. That function can use the accessors on DataClass to iterate over all the fields in the dataclass.

### data classes

Data classes are immutable classes that only contain data. Dataclasses can be interfaces, abstract, extendable, or final. All generated models extend `DataClass`.

### sealed classes

Sealed classes are immutable classes that have multiple fields, but only a single field can be set. Sealed classes cannot be extended or used as interfaces. All generated models extend `SealedClass`.

### enum classes

Enum classes are classes that represent enumerations, using any type to represent the enumeration values. Enum classes cannot be extended or used as interfaces. All generated models extend `EnumClass`.

## Example - Binary tree ADT using sealed and data classes

```dart

// model definitions

@SealedClass()
abstract class $BinaryTree<T> {
  T get leaf;
  $Branch<T> get branch;
}

@DataClass()
abstract class $Branch<T> {
  T get value;
  $BinaryTree<T> get left;
  $BinaryTree<T> get right;
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
@DataClass()
abstract class $ExampleDataClass {
  // fieldWithNoDefault is a field without a default value
  // the constructor will require a value be passed for this param
  int get fieldWithNoDefault;

  // fieldWithDefault uses a default value of 10 if
  // no other value is passed to the constructor
  int get fieldWithDefault => 10;

  // data class fields are not nullable, one must
  // use the Nullable class to represent nullable fields
  Nullable<int> get nullable;

  // computed fields memoize the result of the getter function
  @computed
  int get computedField => fieldWithDefault + 5;
}
```

```dart
// model usage

final d = ExampleDataClass(
  fieldWithNoDefault: 0,
  nullable: Nullable<int>.nil(),
);

print(d.fieldWithNoDefault); // 0
print(d.fieldWithDefault); // 10
print(d.nullable.value); // null
print(d.computedField); // 15

```

see more examples [here](meta_types/example/example.dart)
