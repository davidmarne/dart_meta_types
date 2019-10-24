// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redux.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class PoolActions<T> extends _PoolActionsBase<T> with PoolActionsActions {
  final T _update;
  final bool _updateSet;

  final String _remove;
  final bool _removeSet;

  PoolActions.updateFactory(this._update)
      : _removeSet = false,
        _remove = null,
        _updateSet = true;

  PoolActions.removeFactory(this._remove)
      : _updateSet = false,
        _update = null,
        _removeSet = true;

  T get update => _update;
  bool get updateSet => _updateSet;

  String get remove => _remove;
  bool get removeSet => _removeSet;

  W when<W>({
    @required W update(T update),
    @required W remove(String remove),
  }) {
    if (_updateSet) return update(this.update);
    return remove(this.remove);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PoolActions) return false;
    return update == other.update && remove == other.remove;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, update.hashCode), remove.hashCode));
  }
}

abstract class _PoolActionsBase<T extends Doc> extends SealedClass {
  T get update;
  String get remove;
  bool get updateSet;

  bool get removeSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<T>("update"),
        new SealedClassField<String>("remove")
      ];
  W when<W>({
    @required W update(T update),
    @required W remove(String remove),
  });
}

abstract class _PoolStateBase<T extends Doc> extends DataClass {
  Map<String, T> get map;
  @computed
  Iterable<T> get list => map.values;
  @override
  Iterable<ComputedField> get computedFields =>
      [new ComputedField<Iterable<T>>("list")];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<Map<String, T>>("map")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class PoolState<T> extends _PoolStateBase<T> {
  final Map<String, T> _map;
  Iterable<T> _list;

  PoolState({
    @required Map<String, T> map,
  })  : _map = map,
        super() {
    assert(this.map != null, "null value provided for field map");
  }

  PoolState clone({
    Map<String, T> map,
  }) =>
      new PoolState<T>(
        map: map ?? _map,
      );

  @override
  Map<String, T> get map => _map;
  @override
  Iterable<T> get list => _list ??= super.list;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PoolState) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }
}
