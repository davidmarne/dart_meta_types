part of models;

@seal
abstract class $Generic1SealedClass<T> {
  T get t;
  String get string;
}

@seal
abstract class $GenericSealedClass<T1, T2> {
  T1 get t1;
  T2 get t2;
}
