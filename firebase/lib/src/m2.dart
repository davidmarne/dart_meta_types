// library models;
// // import 'dart:async';

// // import 'package:meta/meta.dart';
// import 'package:meta_types/meta_types.dart';
// // import 'package:built_collection/built_collection.dart';
// // import 'package:firebase/firestore.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_hooks/flutter_hooks.dart';

// part 'models.g.dart';

// const creating = "creating";

// typedef Deserialize = T Function<T>(Object);

// @DataClass()
// abstract class $Doc {
//   String get meta;
// }
// //
library m2;

import 'package:meta_types/meta_types.dart';
part 'm2.g.dart';

@DataClass(isFinal: true)
abstract class $IMPORTDataClass {
  int get foo;
}

@SealedClass()
abstract class $Option<T> {
  T get some;
  void get none;
}

@SealedClass()
abstract class $Either<A, B> {
  A get a;
  B get b;
}

@SealedClass()
abstract class $Result<S, F> {
  S get success;
  F get failure;
}

@SealedClass()
abstract class $Json {
  int get integer;
  String get string;
  bool get boolean;
  double get float;
  List<Json> get list;
  Map<String, Json> get map;
}
