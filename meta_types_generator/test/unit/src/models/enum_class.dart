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
abstract class $Enum<T extends EnumField> implements Meta<T> {
  const $Enum();

  String get type;

  // Iterable<MetaInterfaceType<Data<D>>> get dataInterfaces;

  // @computed
  // Iterable<D> get dataFields =>
  //     dataInterfaces.map((i) => i.meta.nonComputedFields).expand((i) => i);
}

@DataClass()
abstract class $EnumLoader {
  const $EnumLoader();
  String get name;
  Object get value;
}
