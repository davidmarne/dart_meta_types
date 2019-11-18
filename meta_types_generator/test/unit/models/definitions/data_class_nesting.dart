part of models;

@data
abstract class $NestingDataClass<T> {
  NestedDataClass get nested;
  GenericNestedDataClass<T> get genericNested;
}

@data
abstract class $NestedDataClass {
  String get baz => 'baz';
}

@data
abstract class $GenericNestedDataClass<T> {
  T get nested;
}
