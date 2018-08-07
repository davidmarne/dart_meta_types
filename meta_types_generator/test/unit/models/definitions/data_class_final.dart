part of models;

@DataClass(isFinal: true)
abstract class $FinalDataClass implements $NonFinalInterfaceDataClass {
  int get foo;
}

@DataClass(isInterface: true)
abstract class $NonFinalInterfaceDataClass {
  String get bar;
}
