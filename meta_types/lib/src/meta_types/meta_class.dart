part of meta_types;

@dataInterface
abstract class Meta<T extends Field> {
  String get name;
  bool get isPrivate;
  Iterable<TypeParameterDeclaration> get typeParameters;
  Iterable<T> get fields;
  Iterable<Method> get methods;
  bool get serializable;
  bool get implementsBase;
}

@data
abstract class $MetaInterface<F extends Field, T extends Meta<F>> {
  T get meta;
  Iterable<FieldType> get typeArguments;
  Iterable<F> get parametarizedFields;
}

@seal
abstract class $MetaSeal implements Meta<Field> {
  const $MetaSeal();

  Data<DataField> get data;
  Sealed<SealedField, DataField> get sealed;
  Sum<SumField> get sum;
  Enum<EnumField, DataField> get enumeration;
}

extension on MetaSeal {
  Iterable<Field> get allFields => when(
        data: (d) => d.nonComputedFields,
        sealed: (s) => s.nonComputedFields,
        sum: (s) => s.nonComputedFields,
        enumeration: (e) => e.fields,
      );
}

@data
abstract class $TypeParameterDeclaration {
  const $TypeParameterDeclaration();
  String get type;
  Option<FieldType> get extension;

  @computed
  String get typeParameterStr => '$type${genericsStr}';
  String get genericsStr => extension.when(
        some: (type) => ' extends ${type.typeStr}',
        none: () => '',
      );
}

@data
abstract class $FieldType {
  const $FieldType();
  String get type;
  Option<Iterable<FieldType>> get generics;

  @computed
  String get typeStr => '$type${genericsStr}';
  String get genericsStr => generics.when(
        some: (gs) => '<${gs.map((g) => g.typeStr).join(',')}>',
        none: () => '',
      );
}

@dataInterface
abstract class Field implements FieldBase {
  FieldType get returnType;
  String get name;
  bool get isComputed;
  bool get isPrivate;
  Option<SerializableField> get serialableField;
}

@dataInterface
abstract class Value {
  Object get value;
}

@data
abstract class $Method {
  String get name;
  Iterable<TypeParameterDeclaration> get typeParameters;
  FieldType get returnType;
  Iterable<MethodParameter> get inputs;
}

@data
abstract class $MethodParameter {
  String get name;
  FieldType get type;
}
