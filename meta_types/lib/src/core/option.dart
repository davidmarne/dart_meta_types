part of core;

@sum
@serializable
abstract class $Option<T> implements OptionBase<T> {
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

extension IterableExtension<T> on Iterable<T> {
  Option<T> get firstOption => isEmpty ? Option.none() : Option.some(first);

  Option<T> firstWhereOption(bool Function(T) test) {
    final first = firstWhere(test, orElse: () => null);
    return first == null ? Option.none() : Option.some(first);
  }

  Iterable<Option<T>> get toOptionIterable sync* {
    for (final v in this) {
      if (v == null) {
        yield Option.none();
      } else {
        yield Option.some(v);
      }
    }
  }
}

extension IterableOfOptions<T> on Iterable<Option<T>> {
  Iterable<T> get whereIsSome sync* {
    for (final o in this) {
      if (o.isSome) yield o.some;
    }
  }
}

extension MapOfOptions<K, V> on Map<K, Option<V>> {
  Map<K, V> get whereValueIsSome {
    final result = <K, V>{};
    for (final k in keys) {
      final v = this[k];
      if (v.isSome) {
        result[k] = v.some;
      }
    }
    return result;
  }
}
