part of meta_types;

@DataClass(isInterface: true)
abstract class Meta<T extends Field> {
  String get name;
  bool get isPrivate;
  Iterable<Generic> get generics;
  Iterable<T> get fields;
}

@SealedClass()
abstract class $MetaUnionValue {
  const $MetaUnionValue();

  Data<DataValue> get data;
  Sealed<SealedValue> get sealed;
  Enum<EnumValue> get enumeration;
}

@SealedClass()
abstract class $MetaUnion {
  const $MetaUnion();

  Data<DataField> get data;
  Sealed<SealedField> get sealed;
  Enum<EnumField> get enumeration;
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

@DataClass(isInterface: true)
abstract class FieldValue implements Value, Field {}
