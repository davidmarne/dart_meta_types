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
}
