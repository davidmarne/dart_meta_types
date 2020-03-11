part of meta_types;

@dataInterface
abstract class _$DataField implements Field {
  bool get isAbstract;

  bool get isDefaulted;
}

@data
abstract class $DataField implements _$DataField {
  const $DataField();
}

@data
abstract class $DataValue implements _$DataField, Value {
  const $DataValue();
}

@data
abstract class $Data<T extends _$DataField> implements Meta<T> {
  const $Data();

  bool get isFinal;
//
  bool get isInterface;

  bool get isConst;

  Iterable<MetaInterface<T, Data<T>>> get interfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.parametarizedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);

  @computed
  Iterable<T> get nonDefaultedFields =>
      nonComputedFields.where((f) => !f.isDefaulted);

  @computed
  Iterable<T> get localNonDefaultedFields => fields.where((f) => f.isAbstract);

  @computed
  Iterable<T> get defaultedFields =>
      nonComputedFields.where((f) => f.isDefaulted);

  @computed
  Iterable<T> get localDefaultedFields => fields.where((f) => f.isDefaulted);
}
