part of models;

@seal
abstract class $NestingSealedClass {
  int get integer;
  NestedSealedClass get nested;
}

@seal
abstract class $NestedSealedClass {
  int get integer;
  String get string;
}
