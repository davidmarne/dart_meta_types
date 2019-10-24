part of meta_types;

@DataClass()
abstract class $DataField implements Field {
  const $DataField();

  bool get isAbstract;
  bool get isDefaulted;
}

@DataClass()
abstract class $DataValue implements DataField, Value {
  const $DataValue();
}

@DataClass(isFinal: true)
abstract class $Data<T extends DataField> implements Meta<T> {
  const $Data();

  bool get isFinal;

  bool get isInterface;

  Iterable<Data> get interfaces => throw NotGenerated('Data:interfaces');

  @computed
  Iterable<DataValue> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<DataValue> get nonComputedFields => localNonComputedFields.toList()
    ..addAll(interfaces.expand((i) => i.localNonComputedFields));

  @computed
  Iterable<DataValue> get localNonComputedFields =>
      fields.where((f) => !f.isComputed);

  @computed
  Iterable<DataValue> get nonDefaultedFields => localNonDefaultedFields.toList()
    ..addAll(interfaces.expand((i) => i.localNonDefaultedFields));

  @computed
  Iterable<DataValue> get localNonDefaultedFields =>
      fields.where((f) => f.isAbstract);

  @computed
  Iterable<DataValue> get defaultedFields => localDefaultedFields.toList()
    ..addAll(interfaces.expand((i) => i.localDefaultedFields));

  @computed
  Iterable<DataValue> get localDefaultedFields =>
      fields.where((f) => f.isDefaulted);
}
