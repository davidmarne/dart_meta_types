part of meta_types_models;

@dataInterface
abstract class _$SealedField implements Field {}

@data
abstract class $SealedField implements _$SealedField {
  const $SealedField();
}

@data
abstract class $SealedValue implements _$SealedField, Value {
  const $SealedValue();
}

@data
abstract class $Sealed<T extends _$SealedField, D extends _$DataField>
    implements Meta<T> {
  const $Sealed();

  bool get isConst;

  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => fields.where((f) => !f.isComputed);

  @computed
  Iterable<D> get dataFields =>
      dataInterfaces.map((i) => i.parametarizedFields).expand((i) => i);
}
