// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_types_firebase_flutter_hook.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Reference extends $Reference {
  Reference({String path})
      : _path = path,
        assert(path != null);

  final String _path;

  Reference clone({String path}) {
    return Reference(
      path: path ?? _path,
    );
  }

  String get path {
    return _path;
  }

  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Reference) return false;
    return path == other.path;
  }

  String toString() {
    return "Reference (path: $path)";
  }
}

class Resolution<T extends DocReference> extends $Resolution<T> {
  Resolution.fetching(Reference fetching)
      : assert(fetching != null),
        _fetching = fetching,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  Resolution.creating(T creating)
      : _fetching = null,
        assert(creating != null),
        _creating = creating,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  Resolution.dirty(T dirty)
      : _fetching = null,
        _creating = null,
        assert(dirty != null),
        _dirty = dirty,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  Resolution.resolved(T resolved)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        assert(resolved != null),
        _resolved = resolved,
        _deleting = null,
        _denied = null,
        _notFound = null;

  Resolution.deleting(T deleting)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        assert(deleting != null),
        _deleting = deleting,
        _denied = null,
        _notFound = null;

  Resolution.denied(Reference denied)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        assert(denied != null),
        _denied = denied,
        _notFound = null;

  Resolution.notFound(Reference notFound)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        assert(notFound != null),
        _notFound = notFound;

  Resolution(
      {Reference fetching,
      T creating,
      T dirty,
      T resolved,
      T deleting,
      Reference denied,
      Reference notFound})
      : _fetching = fetching,
        _creating = creating,
        _dirty = dirty,
        _resolved = resolved,
        _deleting = deleting,
        _denied = denied,
        _notFound = notFound {
    var found = false;
    if (fetching != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (creating != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (dirty != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (resolved != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (deleting != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (denied != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (notFound != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Reference _fetching;

  final T _creating;

  final T _dirty;

  final T _resolved;

  final T _deleting;

  final Reference _denied;

  final Reference _notFound;

  String get path {
    return when(
      fetching: (fetching) => fetching.path,
      creating: (creating) => creating.path,
      dirty: (dirty) => dirty.path,
      resolved: (resolved) => resolved.path,
      deleting: (deleting) => deleting.path,
      denied: (denied) => denied.path,
      notFound: (notFound) => notFound.path,
    );
  }

  Reference get fetching {
    if (_fetching != null) return _fetching;
    throw Exception('TODO name htis');
  }

  T get creating {
    if (_creating != null) return _creating;
    throw Exception('TODO name htis');
  }

  T get dirty {
    if (_dirty != null) return _dirty;
    throw Exception('TODO name htis');
  }

  T get resolved {
    if (_resolved != null) return _resolved;
    throw Exception('TODO name htis');
  }

  T get deleting {
    if (_deleting != null) return _deleting;
    throw Exception('TODO name htis');
  }

  Reference get denied {
    if (_denied != null) return _denied;
    throw Exception('TODO name htis');
  }

  Reference get notFound {
    if (_notFound != null) return _notFound;
    throw Exception('TODO name htis');
  }

  bool get isFetching {
    return _fetching != null;
  }

  bool get isCreating {
    return _creating != null;
  }

  bool get isDirty {
    return _dirty != null;
  }

  bool get isResolved {
    return _resolved != null;
  }

  bool get isDeleting {
    return _deleting != null;
  }

  bool get isDenied {
    return _denied != null;
  }

  bool get isNotFound {
    return _notFound != null;
  }

  void whenFetching(void Function(Reference) handler) {
    if (_fetching != null) handler(_fetching);
  }

  void whenCreating(void Function(T) handler) {
    if (_creating != null) handler(_creating);
  }

  void whenDirty(void Function(T) handler) {
    if (_dirty != null) handler(_dirty);
  }

  void whenResolved(void Function(T) handler) {
    if (_resolved != null) handler(_resolved);
  }

  void whenDeleting(void Function(T) handler) {
    if (_deleting != null) handler(_deleting);
  }

  void whenDenied(void Function(Reference) handler) {
    if (_denied != null) handler(_denied);
  }

  void whenNotFound(void Function(Reference) handler) {
    if (_notFound != null) handler(_notFound);
  }

  WHEN when<WHEN>(
      {WHEN Function(Reference) fetching,
      WHEN Function(T) creating,
      WHEN Function(T) dirty,
      WHEN Function(T) resolved,
      WHEN Function(T) deleting,
      WHEN Function(Reference) denied,
      WHEN Function(Reference) notFound}) {
    if (_fetching != null) {
      return fetching(_fetching);
    }
    if (_creating != null) {
      return creating(_creating);
    }
    if (_dirty != null) {
      return dirty(_dirty);
    }
    if (_resolved != null) {
      return resolved(_resolved);
    }
    if (_deleting != null) {
      return deleting(_deleting);
    }
    if (_denied != null) {
      return denied(_denied);
    }
    if (_notFound != null) {
      return notFound(_notFound);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Reference) fetching,
      WHENO Function(T) creating,
      WHENO Function(T) dirty,
      WHENO Function(T) resolved,
      WHENO Function(T) deleting,
      WHENO Function(Reference) denied,
      WHENO Function(Reference) notFound}) {
    if (_fetching != null) {
      if (fetching != null)
        return fetching(_fetching);
      else
        return otherwise();
    }
    if (_creating != null) {
      if (creating != null)
        return creating(_creating);
      else
        return otherwise();
    }
    if (_dirty != null) {
      if (dirty != null)
        return dirty(_dirty);
      else
        return otherwise();
    }
    if (_resolved != null) {
      if (resolved != null)
        return resolved(_resolved);
      else
        return otherwise();
    }
    if (_deleting != null) {
      if (deleting != null)
        return deleting(_deleting);
      else
        return otherwise();
    }
    if (_denied != null) {
      if (denied != null)
        return denied(_denied);
      else
        return otherwise();
    }
    if (_notFound != null) {
      if (notFound != null)
        return notFound(_notFound);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, _fetching.hashCode), _creating.hashCode),
                        _dirty.hashCode),
                    _resolved.hashCode),
                _deleting.hashCode),
            _denied.hashCode),
        _notFound.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Resolution) return false;
    return _fetching == other._fetching &&
        _creating == other._creating &&
        _dirty == other._dirty &&
        _resolved == other._resolved &&
        _deleting == other._deleting &&
        _denied == other._denied &&
        _notFound == other._notFound;
  }

  String toString() {
    final value = when(
      fetching: (fetching) => 'fetching $fetching',
      creating: (creating) => 'creating $creating',
      dirty: (dirty) => 'dirty $dirty',
      resolved: (resolved) => 'resolved $resolved',
      deleting: (deleting) => 'deleting $deleting',
      denied: (denied) => 'denied $denied',
      notFound: (notFound) => 'notFound $notFound',
    );
    return 'Resolution( $value )';
  }
}

abstract class IResolution<T> {
  void whenFetching(void Function(Reference) handler);
  void whenCreating(void Function(T) handler);
  void whenDirty(void Function(T) handler);
  void whenResolved(void Function(T) handler);
  void whenDeleting(void Function(T) handler);
  void whenDenied(void Function(Reference) handler);
  void whenNotFound(void Function(Reference) handler);
  WHEN when<WHEN>(
      {WHEN Function(Reference) fetching,
      WHEN Function(T) creating,
      WHEN Function(T) dirty,
      WHEN Function(T) resolved,
      WHEN Function(T) deleting,
      WHEN Function(Reference) denied,
      WHEN Function(Reference) notFound});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Reference) fetching,
      WHENO Function(T) creating,
      WHENO Function(T) dirty,
      WHENO Function(T) resolved,
      WHENO Function(T) deleting,
      WHENO Function(Reference) denied,
      WHENO Function(Reference) notFound});
}

class Subscription extends $Subscription {
  Subscription({int id, Reference ref})
      : _id = id,
        assert(id != null),
        _ref = ref,
        assert(ref != null);

  final int _id;

  final Reference _ref;

  Subscription clone({int id, Reference ref}) {
    return Subscription(
      id: id ?? _id,
      ref: ref ?? _ref,
    );
  }

  int get id {
    return _id;
  }

  Reference get ref {
    return _ref;
  }

  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), ref.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Subscription) return false;
    return id == other.id && ref == other.ref;
  }

  String toString() {
    return "Subscription (id: $id, ref: $ref)";
  }
}

class FirebaseHookData<T extends DocReference> extends $FirebaseHookData<T> {
  FirebaseHookData(
      {BuiltMap<Reference, Resolution<T>> data, Iterable<Resolution<T>> datas})
      : __data = data,
        assert(data != null),
        _datas = datas,
        assert(datas != null);

  final BuiltMap<Reference, Resolution<T>> __data;

  final Iterable<Resolution<T>> _datas;

  FirebaseHookData<T> clone(
      {BuiltMap<Reference, Resolution<T>> data,
      Iterable<Resolution<T>> datas}) {
    return FirebaseHookData(
      data: data ?? __data,
      datas: datas ?? _datas,
    );
  }

  BuiltMap<Reference, Resolution<T>> get _data {
    return __data;
  }

  Iterable<Resolution<T>> get datas {
    return _datas ?? super.datas;
  }

  int get hashCode {
    return $jf($jc($jc(0, _data.hashCode), datas.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FirebaseHookData) return false;
    return _data == other._data && datas == other.datas;
  }

  String toString() {
    return "FirebaseHookData (_data: $_data)";
  }
}
