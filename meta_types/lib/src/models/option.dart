part of meta_types_models;

@SumClass()
abstract class $Option<T> implements IOption<T> {
  const $Option();

  T get some;
  void get none;

  Option<M> map<M>(M Function(T) mapper) => when(
        some: (v) => Option.some(mapper(v)),
        none: () => Option.none(),
      );

  Option<M> fmap<M>(Option<M> Function(T) mapper) => when(
        some: (v) => mapper(v),
        none: () => Option.none(),
      );
}

// const x = Option.none();
