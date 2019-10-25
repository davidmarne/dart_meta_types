part of meta_types_models;

@DataClass()
abstract class $DataField implements Field {
  const $DataField();

  bool get isAbstract;
  bool get isDefaulted;
}

@DataClass()
abstract class $DataValue implements $DataField, Value {
  const $DataValue();
}

@DataClass()
abstract class $Data<T extends DataField> implements Meta<T> {
  const $Data();

  bool get isFinal;

  bool get isInterface;

  bool get isConst;

  Iterable<Data<T>> get interfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.localNonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);

  @computed
  Iterable<T> get nonDefaultedFields => localNonDefaultedFields.toSet()
    ..addAll(interfaces.expand((i) => i.localNonDefaultedFields));

  @computed
  Iterable<T> get localNonDefaultedFields => fields.where((f) => f.isAbstract);

  @computed
  Iterable<T> get defaultedFields => localDefaultedFields.toSet()
    ..addAll(interfaces.expand((i) => i.localDefaultedFields));

  @computed
  Iterable<T> get localDefaultedFields => fields.where((f) => f.isDefaulted);
}