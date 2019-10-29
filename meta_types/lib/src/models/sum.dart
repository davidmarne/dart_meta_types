part of meta_types_models;

@DataClass()
abstract class $SumField implements Field {
  const $SumField();
}

@DataClass()
abstract class $SumValue implements $SumField, Value {
  const $SumValue();
}

@DataClass()
abstract class $Sum<T extends SumField> implements Meta<T> {
  const $Sum();

  bool get isFinal;

  bool get isInterface;

  bool get isConst;

  Iterable<MetaInterfaceType<Sum<T>>> get interfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.meta.localNonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);
}
