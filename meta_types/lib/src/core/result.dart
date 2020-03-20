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
}

@data
abstract class $Err {
  Object get error;
  StackTrace get trace;
}

extension FutureResultExtension<T> on Future<T> {
  Future<Result<T>> get result =>
      then((d) => Result.success(d)).catchError((e, s) => Result.error(e, s));
}

extension FutureResult<S> on Future<Result<S>> {
  Future<Result<M>> map<M>(M Function(S) mapper) => then((v) => v.map(mapper));

  Future<Result<M>> fmap<M>(Result<M> Function(S) mapper) =>
      then((v) => v.fmap(mapper));

  Future<Result<M>> fmapFuture<M>(
    Future<Result<M>> Function(S) mapper, {
    Future<Result<M>> Function(Err) onError,
  }) =>
      then((v) => v.when(
            success: mapper,
            error: (e) =>
                onError != null ? onError(e) : Future.value(Result<M>.error(e)),
          ));

  Future<Result<S>> onError(
    Future<Result<S>> Function(Err) onError,
  ) =>
      catchError((e, StackTrace s) =>
          e is E ? onError(Err(error: e, trace: s)) : throw e);
}

// @deprecated
// Result<S, E> computeResult<S, E>(S Function() func) {
//   try {
//     return Result.success(func());
//   } on E catch (e, s) {
//     return Result.error(Err(error: e, trace: s));
//   }
// }

// @deprecated
// Result<S, Object> computeResultCatchAll<S>(S Function() func) {
//   try {
//     return Result.success(func());
//   } catch (e, s) {
//     return Result.error(Err(error: e, trace: s));
//   }
// }

// @deprecated
// Future<Result<S, E>> computeResultAsync<S, E>(Future<S> Function() func) async {
//   try {
//     return Result.success(await func());
//   } on E catch (e, s) {
//     return Result.error(Err(error: e, trace: s));
//   }
// }

// @deprecated
// Future<Result<S, Object>> computeResultCatchAllAsync<S>(
//     Future<S> Function() func) async {
//   try {
//     return Result.success(await func());
//   } catch (e, s) {
//     return Result.error(Err(error: e, trace: s));
//   }
// }
