part of models;

@DataClass()
abstract class $ImplementorDataClass implements InterfaceOne, InterfaceThree {
  int get implementor;
}

@DataClass(isInterface: true)
abstract class InterfaceOne implements InterfaceTwo {
  int get one;
}

@DataClass(isInterface: true)
abstract class InterfaceTwo {
  String get two;
}

@DataClass(isInterface: true)
abstract class InterfaceThree {
  int get three;
}
