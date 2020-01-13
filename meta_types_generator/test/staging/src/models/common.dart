part of meta_types_models;

@sum
abstract class $Json {
  Map<String, Json> get object;
  List<Json> get array;
  String get string;
  num get number;
  bool get boolean;
  Null get nil;
}

@sum
@serializable
abstract class $Either<A, B> implements EitherBase<A, B> {
  A get a;
  B get b;

  Either<C, B> map<C>(C Function(A) mapper) => when(
        a: (a) => Either.a(mapper(a)),
        b: (b) => Either.b(b),
      );

  Either<C, B> fmap<C>(Either<C, B> Function(A) mapper) => when(
        a: (a) => mapper(a),
        b: (b) => Either.b(b),
      );

  @computed
  Either<B, A> get reversed => when(
        a: (a) => Either.b(a),
        b: (b) => Either.a(b),
      );
}

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

Result<S, Object> computeResultUntyped<S>(S Function() func) {
  try {
    return Result.success(func());
  } catch (e, s) {
    return Result.error(Err(error: e, trace: s));
  }
}
