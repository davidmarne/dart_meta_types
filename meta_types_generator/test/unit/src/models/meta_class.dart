part of meta_types_models;

@DataClass(isInterface: true)
abstract class Meta<T extends Field> {
  String get name;
  bool get isPrivate;
  Iterable<TypeParameterDeclaration> get generics; //TODO option
  Iterable<T> get fields;
}

@DataClass()
abstract class $MetaInterfaceType<T extends Meta> {
  T get meta;
  Iterable<FieldType> get generics;
}

@SealedClass()
abstract class $MetaSeal implements Meta<Field> {
  const $MetaSeal();

  Data<DataField> get data;
  Sealed<SealedField, DataField> get sealed;
  Sum<SumField> get sum;
  Enum<EnumField> get enumeration;
}

@SumClass()
abstract class $Generic {
  const $Generic();
  TypeParameterDeclaration get declaration;
  String get parameter;
}

@DataClass()
abstract class $TypeParameterDeclaration {
  const $TypeParameterDeclaration();
  String get type;
  Option<FieldType> get extension; //TODO rname to boudn

  @computed
  String get typeParameterStr => '$type${genericsStr}';
  String get genericsStr => extension.when(
        some: (type) => " extends ${type.typeStr}",
        none: () => "",
      );
}

@DataClass()
abstract class $FieldType {
  const $FieldType();
  String get type;
  Option<Iterable<FieldType>> get generics;

  @computed
  String get typeStr => '$type${genericsStr}';
  String get genericsStr => generics.when(
        some: (gs) => "<${gs.map((g) => g.typeStr).join(",")}>",
        none: () => "",
      );
}

@DataClass(isInterface: true)
abstract class Field {
  FieldType get returnType;
  String get name;
  bool get isComputed;
}

@DataClass(isInterface: true)
abstract class Value {
  Object get value;
}
