part of models;

@DataClass()
abstract class $BaseDataClass extends $SuperDataClass
    implements $OtherDataClass {
  int get foo;
}

@DataClass(isAbstract: true)
abstract class $SuperDataClass extends $Super2DataClass {
  int get bar;
}

@DataClass(isAbstract: true)
abstract class $Super2DataClass {
  String get baz;
}

@DataClass(isInterface: true)
abstract class $OtherDataClass {
  int get other;
}
