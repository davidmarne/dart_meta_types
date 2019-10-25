part of meta_types_models;

@DataClass()
abstract class $SealedField implements Field {
  const $SealedField();
}

@DataClass()
abstract class $SealedValue implements $SealedField, Value {
  const $SealedValue();
}

@DataClass()
abstract class $Sealed<T extends SealedField, D extends DataField>
    implements Meta<T> {
  const $Sealed();

  bool get isConst;

  Iterable<Data<D>> get dataInterfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => fields.where((f) => !f.isComputed);

  @computed
  Iterable<D> get dataFields =>
      dataInterfaces.map((i) => i.nonComputedFields).expand((i) => i);
}
