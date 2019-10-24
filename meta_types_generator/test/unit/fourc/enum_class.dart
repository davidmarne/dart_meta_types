part of meta_types;

@DataClass()
abstract class $EnumField implements Field {
  const $EnumField();
}

@DataClass()
abstract class $EnumValue implements $EnumField, Value {
  const $EnumValue();
}

@DataClass()
abstract class $Enum<T extends $EnumField> implements Meta<T> {
  const $Enum();
  // Type get type => String;
  // Iterable<String> get mixins;
}
