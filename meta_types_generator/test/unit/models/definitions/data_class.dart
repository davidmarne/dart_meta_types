part of models;

@data
abstract class $TestDataClass {
  int get fieldWithNoDefault;

  int get fieldWithDefault => 10;

  @computed
  int get computedField => fieldWithDefault;
}
