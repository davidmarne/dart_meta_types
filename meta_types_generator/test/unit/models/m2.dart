library m2;

import 'package:meta_types/meta_types.dart';
part 'm2.g.dart';

@DataClass(isFinal: true)
abstract class $IMPORTDataClass {
  int get foo;

  IMPORTDataClass operator +(IMPORTDataClass other) => other;
  int get ref => 8;
  void method() {
    print('hi');
  }
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
