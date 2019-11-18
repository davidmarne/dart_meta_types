part of models;

@data
abstract class $GenericDataClass<T> {
  int get foo;
  T get bar;
}

@data
abstract class $GenericsDataClass<T, P> {
  int get foo;
  T get bar;
  P get baz;
}
