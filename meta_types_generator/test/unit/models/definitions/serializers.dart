part of models;

@serializable
@data
abstract class $SerializeData {
  int get x;
  double get y;
}

@serializable
@sum
abstract class $SerializeSum {
  int get a;
  double get b;
}

@serializable
@enumeration
abstract class $SerializeEnum {
  const $SerializeEnum();

  static const int x = 0;
  static const int y = 1;
}

@dataInterface
abstract class SerializeSealData {
  int get x;
  double get y;
}

@data
abstract class $SerializeSealDataA implements SerializeSealData {}

@data
abstract class $SerializeSealDataB implements SerializeSealData {}

@serializable
@seal
abstract class $SerializeSeal implements SerializeSealData {
  SerializeSealDataA get a;
  SerializeSealDataB get b;
}
