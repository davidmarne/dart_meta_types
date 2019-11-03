part of meta_types_models;

@DataClass()
abstract class $EnumField implements Field {
  const $EnumField();
}

@DataClass()
abstract class $EnumsValue implements $EnumField, Value {
  const $EnumsValue();
}

@DataClass()
abstract class $Enum<T extends EnumField, D extends DataField>
    implements Meta<T> {
  const $Enum();

  String get type;

  // Iterable<MetaInterfaceType<Data<D>>> get dataInterfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => fields.where((f) => !f.isComputed);

  // @computed
  // Iterable<D> get dataFields =>
  //     dataInterfaces.map((i) => i.meta.nonComputedFields).expand((i) => i);
}
