part of meta_types_models;

@dataInterface
abstract class _$EnumField implements Field {}

@data
abstract class $EnumField implements _$EnumField {
  const $EnumField();
}

@data
abstract class $EnumValue implements _$EnumField, Value {
  const $EnumValue();
}

@data
abstract class $Enum<T extends _$EnumField, D extends _$DataField>
    implements Meta<T> {
  const $Enum();

  String get type;

  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => fields.where((f) => !f.isComputed);

  @computed
  Iterable<D> get dataFields =>
      dataInterfaces.map((i) => i.meta.nonComputedFields).expand((i) => i);
}
