part of models;

@SealedClass()
abstract class $NestingSealedClass {
  int get integer;
  $NestedSealedClass get nested;
}

@SealedClass()
abstract class $NestedSealedClass {
  int get integer;
  String get string;
}
