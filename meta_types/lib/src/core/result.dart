part of core;

@sum
abstract class $Result<S, E> implements ResultBase<S, E> {
  S get success;
  Err<E> get error;

  Result<M, E> map<M>(M Function(S) mapper) => when(
        success: (s) => Result.success(mapper(s)),
        error: (e) => Result.error(e),
      );

  Result<M, E> fmap<M>(Result<M, E> Function(S) mapper) => when(
        success: (s) => mapper(s),
        error: (e) => Result.error(e),
      );
}

@data
abstract class $Err<E> {
  E get error;
  StackTrace get trace;
}

Result<S, E> computeResult<S, E>(S Function() func) {
  try {
    return Result.success(func());
  } on E catch (e, s) {
    return Result.error(Err(error: e, trace: s));
  }
}

Result<S, Object> computeResultCatchAll<S>(S Function() func) {
  try {
    return Result.success(func());
  } catch (e, s) {
    return Result.error(Err(error: e, trace: s));
  }
}

Future<Result<S, E>> computeResultAsync<S, E>(Future<S> Function() func) async {
  try {
    return Result.success(await func());
  } on E catch (e, s) {
    return Result.error(Err(error: e, trace: s));
  }
}

Future<Result<S, Object>> computeResultCatchAllAsync<S>(
    Future<S> Function() func) async {
  try {
    return Result.success(await func());
  } catch (e, s) {
    return Result.error(Err(error: e, trace: s));
  }
}

extension FutureResult<S, E> on Future<Result<S, E>> {
  Future<Result<M, E>> map<M>(M Function(S) mapper) =>
      then((v) => v.map(mapper));

  Future<Result<M, E>> fmap<M>(Result<M, E> Function(S) mapper) =>
      then((v) => v.fmap(mapper));

  Future<Result<M, E>> fmapFuture<M>(
    Future<Result<M, E>> Function(S) mapper, {
    Future<Result<M, E>> Function(Err<E>) onError,
  }) =>
      then((v) => v.when(
            success: mapper,
            error: (e) => onError != null
                ? onError(e)
                : Future.value(Result<M, E>.error(e)),
          ));

  Future<Result<S, E>> onError(
    Future<Result<S, E>> Function(Err<E>) onError,
  ) =>
      catchError((e, StackTrace s) =>
          e is E ? onError(Err(error: e, trace: s)) : throw e);
}
