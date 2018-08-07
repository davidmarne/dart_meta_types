import 'dart:async';
import 'package:meta/meta.dart';
import 'package:meta_types/meta_types.dart';
import 'package:redux/redux.dart';
export 'package:meta/meta.dart' show required;
export 'dart:async' show FutureOr;

class Actions extends SealedClassMixin {
  final Type stateType;
  const Actions(this.stateType);
}

typedef D MetaReducer<D extends DataClass, A extends SealedClass>(
  D state,
  A action,
);

typedef FutureOr<void> MetaMiddleware<D extends DataClass,
    A extends SealedClass>(
  MiddlewareApi<D, A> api,
  MetaNextDispatcher next,
  A action,
);

typedef FutureOr<void> MetaNextDispatcher();

class MiddlewareApi<D extends DataClass, A extends SealedClass> {
  Store<D> _store;

  MiddlewareApi(this._store);

  D getState() => _store.state;

  void dispatch(A a) {
    _store.dispatch(a);
  }
}

class MetaTypesStore<D extends DataClass, A extends SealedClass>
    extends Store<D> {
  MetaTypesStore({
    @required MetaReducer<D, A> reducer,
    D initialState,
    List<MetaMiddleware<D, A>> metaMiddleware: const [],
    List<Middleware<D>> middleware: const [],
    bool syncStream: false,
  }) : super((D state, dynamic a) => reducer(state, a as A),
            initialState: initialState,
            middleware: metaMiddleware
                .map((mw) => (Store<D> store, dynamic action,
                        NextDispatcher next) =>
                    mw(MiddlewareApi(store), () => next(action), action as A))
                .toList()
                  ..addAll(middleware),
            syncStream: syncStream,
            distinct: true);

  // protect dispatch so users cannot dispatch non meta actions
  @override
  void dispatch(covariant A a) {
    super.dispatch(a);
  }
}
