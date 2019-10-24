part of models;

@DataClass(isFinal: true)
abstract class $FinalDataClass implements NonFinalInterfaceDataClass {
  IMPORTDataClass get foo;
}

@DataClass(isInterface: true)
abstract class NonFinalInterfaceDataClass {
  String get bar;
}
