part of models;

@DataClass()
abstract class $GenericDataClass<T> {
  int get foo;
  T get bar;
}

@DataClass()
abstract class $GenericsDataClass<T, P> {
  int get foo;
  T get bar;
  P get baz;
}
