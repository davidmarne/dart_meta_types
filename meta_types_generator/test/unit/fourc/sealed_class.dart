part of meta_types;

@DataClass()
abstract class $SealedField implements Field {
  const $SealedField();
}

@DataClass()
abstract class $SealedValue implements $SealedField, Value {
  const $SealedValue();
}

@DataClass(isFinal: true)
abstract class $Sealed<T extends $SealedField> implements Meta<T> {
  const $Sealed();

  bool get isFinal;

  bool get isInterface;

  Iterable<Sealed<T>> get interfaces => throw Exception('Sealed:interfaces');

  @computed
  Iterable<T> get computedFields => fields.where((f) => f.isComputed);

  @computed
  Iterable<T> get nonComputedFields => localNonComputedFields.toList()
    ..addAll(interfaces.expand((i) => i.nonComputedFields));

  @computed
  Iterable<T> get localNonComputedFields => fields.where((f) => !f.isComputed);
}
