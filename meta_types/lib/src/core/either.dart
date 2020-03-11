part of core;

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
