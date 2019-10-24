// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Resolution<T> extends _ResolutionBase<T> {
  final Null _fetching;
  final bool _fetchingSet;

  final T _creating;
  final bool _creatingSet;

  final T _dirty;
  final bool _dirtySet;

  final T _resolved;
  final bool _resolvedSet;

  final Null _unknown;
  final bool _unknownSet;

  Resolution.fetchingFactory(this._fetching)
      : _creatingSet = false,
        _creating = null,
        _dirtySet = false,
        _dirty = null,
        _resolvedSet = false,
        _resolved = null,
        _unknownSet = false,
        _unknown = null,
        _fetchingSet = true;

  Resolution.creatingFactory(this._creating)
      : _fetchingSet = false,
        _fetching = null,
        _dirtySet = false,
        _dirty = null,
        _resolvedSet = false,
        _resolved = null,
        _unknownSet = false,
        _unknown = null,
        _creatingSet = true;

  Resolution.dirtyFactory(this._dirty)
      : _fetchingSet = false,
        _fetching = null,
        _creatingSet = false,
        _creating = null,
        _resolvedSet = false,
        _resolved = null,
        _unknownSet = false,
        _unknown = null,
        _dirtySet = true;

  Resolution.resolvedFactory(this._resolved)
      : _fetchingSet = false,
        _fetching = null,
        _creatingSet = false,
        _creating = null,
        _dirtySet = false,
        _dirty = null,
        _unknownSet = false,
        _unknown = null,
        _resolvedSet = true;

  Resolution.unknownFactory(this._unknown)
      : _fetchingSet = false,
        _fetching = null,
        _creatingSet = false,
        _creating = null,
        _dirtySet = false,
        _dirty = null,
        _resolvedSet = false,
        _resolved = null,
        _unknownSet = true;

  Null get fetching => _fetching;
  bool get fetchingSet => _fetchingSet;

  T get creating => _creating;
  bool get creatingSet => _creatingSet;

  T get dirty => _dirty;
  bool get dirtySet => _dirtySet;

  T get resolved => _resolved;
  bool get resolvedSet => _resolvedSet;

  Null get unknown => _unknown;
  bool get unknownSet => _unknownSet;

  W when<W>({
    @required W fetching(Null fetching),
    @required W creating(T creating),
    @required W dirty(T dirty),
    @required W resolved(T resolved),
    @required W unknown(Null unknown),
  }) {
    if (_fetchingSet) return fetching(this.fetching);
    if (_creatingSet) return creating(this.creating);
    if (_dirtySet) return dirty(this.dirty);
    if (_resolvedSet) return resolved(this.resolved);
    return unknown(this.unknown);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Resolution) return false;
    return fetching == other.fetching &&
        creating == other.creating &&
        dirty == other.dirty &&
        resolved == other.resolved &&
        unknown == other.unknown;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, fetching.hashCode), creating.hashCode),
                dirty.hashCode),
            resolved.hashCode),
        unknown.hashCode));
  }
}

abstract class _ResolutionBase<T extends Doc> extends SealedClass {
  Null get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  Null get unknown;
  bool get fetchingSet;

  bool get creatingSet;

  bool get dirtySet;

  bool get resolvedSet;

  bool get unknownSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<Null>("fetching"),
        new SealedClassField<T>("creating"),
        new SealedClassField<T>("dirty"),
        new SealedClassField<T>("resolved"),
        new SealedClassField<Null>("unknown")
      ];
  W when<W>({
    @required W fetching(Null fetching),
    @required W creating(T creating),
    @required W dirty(T dirty),
    @required W resolved(T resolved),
    @required W unknown(Null unknown),
  });
}

abstract class Doc {
  String get uid;
  Doc cloneDoc({
    String uid,
  });
}
