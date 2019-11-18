part of meta_types_models;

@dataInterface
abstract class _$SumField implements Field {}

@data
abstract class $SumField implements _$SumField {
  const $SumField();
}

@data
abstract class $SumValue implements _$SumField, Value {
  const $SumValue();
}

@data
abstract class $Sum<T extends _$SumField> implements Meta<T> {
  const $Sum();

  bool get isFinal;

  bool get isInterface;

  bool get isConst;

  Iterable<MetaInterface<T, Sum<T>>> get interfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.meta.localNonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);
}
