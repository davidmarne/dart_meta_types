part of meta_types_models;

@DataClass()
abstract class $SealedField implements Field {
  const $SealedField();
}

// @DataClass()
// abstract class $SealedValue implements SealedField, Value {
//   const $SealedValue();
// }

@DataClass()
abstract class $Sealed<T extends SealedField> implements Meta<T> {
  const $Sealed();

  bool get isFinal;

  bool get isInterface;

  Iterable<Sealed<T>> get interfaces => throw NotGenerated('Sealed:interfaces');

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toSet()
    ..addAll(interfaces.expand((i) => i.localNonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);
}
