part of meta_types_models;

@DataClass(isInterface: true)
abstract class Meta<T extends Field> {
  String get name;
  bool get isPrivate;
  Iterable<Generic> get generics;
  Iterable<T> get fields;
}

@SealedClass()
abstract class $MetaUnion {
  const $MetaUnion();

  Data get data;
  Sealed get sealed;
  // Enum get enumeration;
}

@DataClass()
abstract class $Generic {
  const $Generic();
  String get type;
  Option<String> get extension;
}

@DataClass(isInterface: true)
abstract class Field {
  String get returnType;
  Option<List<String>> get returnTypeGenerics;
  String get name;
  bool get isComputed;
}

@DataClass(isInterface: true)
abstract class Value {
  Object get value;
}
