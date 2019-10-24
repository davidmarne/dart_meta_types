import 'package:meta_types/meta_types.dart';
import 'package:meta_types_redux/meta_types_redux.dart';
import 'package:meta_types_firebase_redux/meta_types_firebase_redux.dart';

part 'redux.g.dart';

////////////////////
/// Actions
///////////////////

/// [PoolActions]
@Actions($PoolState)
@SealedClass()
abstract class $PoolActions<T extends $Doc> {
  T get update;
  String get remove;
}

////////////////////
/// State Interface
///////////////////

@DataClass()
abstract class $PoolState<T extends $Doc> {
  Map<String, T> get map;

  @computed
  Iterable<T> get list => map.values;
}

////////////////////
/// Main Reducer
///////////////////

PoolState<T> modelReducer<T extends Doc>(
        PoolState<T> state, PoolActions<T> action) =>
    action.reduce(
      state,
      update: _update,
      remove: _remove,
    );

PoolState<T> _update<T extends Doc>(PoolState<T> state, T payload) =>
    state.clone(
      map: Map.from(state.map)..addAll({payload.uid: payload}),
    );

PoolState<T> _remove<T extends Doc>(PoolState<T> state, String payload) =>
    state.clone(
      map: Map.from(state.map)..remove(payload),
    );
