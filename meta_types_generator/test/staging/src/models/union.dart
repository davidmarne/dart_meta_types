part of meta_types_models;

@dataInterface
abstract class _$UnionField implements Field {}

@data
abstract class $UnionField implements _$UnionField {
  const $UnionField();
}

@data
abstract class $UnionValue implements _$UnionField, Value {
  const $UnionValue();
}

@data
abstract class $Union<T extends _$UnionField> implements Meta<T> {
  const $Union();

  bool get isFinal;

  bool get isInterface;

  bool get isConst;

  Iterable<MetaInterface<T, Union<T>>> get interfaces;

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.meta.localNonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);
}
