// import 'package:meta_types/meta_types.dart';
// import 'package:meta_types/meta_types_models.dart';

// part 'example.g.dart';

// // regular data class,
// @DataClass()
// abstract class $ExampleDataClass {
//   // fieldWithNoDefault is a field without a default value
//   // the constructor will require a value be passed for this param
//   int get fieldWithNoDefault;

//   // fieldWithDefault uses a default value of 10 if
//   // no other value is passed to the constructor
//   int get fieldWithDefault => 10;

//   // data class fields are not nullable, one must
//   // use the Option sum type to represent nullable fields
//   Option<int> get nullable;

//   // computed fields memoize the result of the getter function
//   @computed
//   int get computedField => fieldWithDefault + 5;
// }

// // ImplementorDataClass will implement $InterfaceDataClass
// @DataClass()
// abstract class $ImplementorDataClass implements InterfaceDataClass {
//   int get foo;
// }

// // $InterfaceDataClass must only be implemented. It will not be constructable itself.
// // It cannot be used in extends clauses, only implements clauses. Interfaces cannot
// // have default values.
// @DataClass(isInterface: true)
// abstract class InterfaceDataClass {
//   String get bar;
// }

// // ExampleSealedClass will require one and only
// // on of the following fields are set. A when function
// // is also generated for easy switching. e.g.:
// // sealedClassInstance.when<void>(
// //   (intval) => print('int val is $intval'),
// //   (strval) => print('str val is $strval'),
// // );
// @SumClass()
// abstract class $ExampleSealedClass {
//   int get integer;
//   String get string;
// }

// // // enum class with int will using incrementing integers as values
// // // unless a nother value is specified

// // @EnumClass(int)
// // abstract class $ExampleEnumInteger {
// //   static int a; // 0
// //   static int b; // 1
// //   static int c = 1000; // 1000
// //   static int d; // 3
// // }

// // enum class with strings will use field name as value
// // unless a nother value is specified

// // @EnumClass(String)
// // abstract class $ExampleEnumString {
// //   static String a;
// //   static String b;
// //   static String c = 'custom';
// // }

// // // enum class with custom type.

// // @EnumClass()
// // abstract class $ProtocolState implements Signal {
// //   const $ProtocolState();

// //   static const Waiting waiting = Waiting();
// //   static const Talking talking = Talking();
// // }

// // abstract class Signal {
// //   ProtocolState get signal;
// // }

// // class Waiting implements Signal {
// //   const Waiting();
// //   ProtocolState get signal => ProtocolState.talking;
// // }

// // class Talking implements Signal {
// //   const Talking();
// //   ProtocolState get signal => ProtocolState.waiting;
// // }

// // Binary tree is an example of an algebreic data type
// // It is the combination of two sums

// @SumClass()
// abstract class $BinaryTree<T> {
//   T get leaf;
//   Branch<T> get branch;
// }

// @DataClass()
// abstract class $Branch<T> {
//   T get val;
//   BinaryTree<T> get left;
//   BinaryTree<T> get right;
// }

// void traverse(BinaryTree<int> tree) => tree.when(
//       leaf: (val) {
//         print(val);
//       },
//       branch: (b) {
//         print(b.val);
//         traverse(b.left);
//         traverse(b.right);
//       },
//     );
