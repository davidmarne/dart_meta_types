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
