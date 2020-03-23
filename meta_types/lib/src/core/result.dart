part of core;

@sum
abstract class $Result<S> implements ResultBase<S> {
  S get success;
  Err get error;

  Result<M> map<M>(M Function(S) mapper) => when(
        success: (s) => Result.success(mapper(s)),
        error: (e) => Result.error(e),
      );

  Result<M> fmap<M>(Result<M> Function(S) mapper) => when(
        success: (s) => mapper(s),
        error: (e) => Result.error(e),
      );

  void whenTypedError<E>(void Function(E) handler) {
    whenError((e) {
      if (e is E) {
        handler(e as E);
      }
    });
  }
}

@data
abstract class $Err {
  Object get error;
  StackTrace get trace;
}

extension FutureResultExtension<T> on Future<T> {
  Future<Result<T>> get result => then(
        (d) => Result.success(d),
      ).catchError(
        (Object e, StackTrace s) => Result.error(
          Err(error: e, trace: s),
        ),
      );
}
