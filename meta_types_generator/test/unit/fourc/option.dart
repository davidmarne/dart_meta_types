part of meta_types;

@SealedClass()
abstract class $Option<T> {
  const $Option();

  T get some;
  void get none;
}

// const x = Option.none();
