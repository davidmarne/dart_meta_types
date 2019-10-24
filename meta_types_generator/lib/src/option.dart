class Option<T> {
  final T _some;
  Option.some(this._some) : assert(_some != null);
  Option.none() : _some = null;
  Option(this._some);

  bool get isPresent => _some != null;
  bool get isAbsent => !isPresent;

  Option<M> map<M>(M Function(T) mapper) => when(
        some: (v) => Option.some(mapper(v)),
        none: () => Option.none(),
      );

  Option<M> fmap<M>(Option<M> Function(T) mapper) => when(
        some: (v) => mapper(v),
        none: () => Option.none(),
      );

  W when<W>({
    W Function(T) some,
    W Function() none,
  }) =>
      _some != null ? some(_some) : none();

  void whenPresent(void Function(T) handler) {
    if (isPresent) {
      handler(_some);
    }
  }

  void whenAbsent(void Function() handler) {
    if (!isAbsent) {
      handler();
    }
  }
}

class Either<A, B> {
  final A _a;
  final B _b;
  Either.a(this._a) : _b = null;
  Either.b(this._b) : _a = null;
  Either(this._a, this._b);
}

class Result<S, F> {
  final S _success;
  final F _failure;
  Result(this._success, this._failure);
}
