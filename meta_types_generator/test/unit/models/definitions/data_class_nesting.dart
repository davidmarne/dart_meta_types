part of models;

@DataClass()
abstract class $NestingDataClass<T> {
  $NestedDataClass get nested;
  $GenericNestedDataClass<T> get genericNested;
}

@DataClass()
abstract class $NestedDataClass {
  String get baz => 'baz';
}

@DataClass()
abstract class $GenericNestedDataClass<T> {
  T get nested;
}
