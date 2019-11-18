part of models;

@data
abstract class $ImplementorDataClass implements InterfaceOne, InterfaceThree {
  int get implementor;
}

@dataInterface
abstract class InterfaceOne implements InterfaceTwo {
  int get one;
}

@dataInterface
abstract class InterfaceTwo {
  String get two;
}

@dataInterface
abstract class InterfaceThree {
  int get three;
}
