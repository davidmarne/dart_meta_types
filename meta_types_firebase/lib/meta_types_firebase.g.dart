// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_types_firebase.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Document<T> extends $Document<T> {
  Document({@required String id, @required T data})
      : _id = id,
        assert(id != null),
        _data = data,
        assert(data != null);

  final String _id;

  final T _data;

  String get id {
    return _id;
  }

  T get data {
    return _data;
  }

  Document<T> copy({String id, T data}) {
    return Document(
      id: id ?? _id,
      data: data ?? _data,
    );
  }

  int get hashCode => $jf($jc($jc(0, _id.hashCode), _data.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Document) return false;
    return id == other.id && data == other.data;
  }

  String toString() {
    return "Document (id: $id, data: $data)";
  }
}

class DocumentResolution<T> extends $DocumentResolution<T> {
  const DocumentResolution.fetching()
      : _fetching = true,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const DocumentResolution.dirty(Document<T> dirty)
      : _fetching = null,
        assert(dirty != null),
        _dirty = dirty,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const DocumentResolution.resolved(Document<T> resolved)
      : _fetching = null,
        _dirty = null,
        assert(resolved != null),
        _resolved = resolved,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const DocumentResolution.deleting()
      : _fetching = null,
        _dirty = null,
        _resolved = null,
        _deleting = true,
        _denied = null,
        _notFound = null;

  const DocumentResolution.denied()
      : _fetching = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = true,
        _notFound = null;

  const DocumentResolution.notFound()
      : _fetching = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = true;

  final bool _fetching;

  final Document<T> _dirty;

  final Document<T> _resolved;

  final bool _deleting;

  final bool _denied;

  final bool _notFound;

  void get fetching {
    if (_fetching != null) return;
    throw Exception('Illegal access of sum field, fetching is not set');
  }

  Document<T> get dirty {
    if (_dirty != null) return _dirty;
    throw Exception('Illegal access of sum field, dirty is not set');
  }

  Document<T> get resolved {
    if (_resolved != null) return _resolved;
    throw Exception('Illegal access of sum field, resolved is not set');
  }

  void get deleting {
    if (_deleting != null) return;
    throw Exception('Illegal access of sum field, deleting is not set');
  }

  void get denied {
    if (_denied != null) return;
    throw Exception('Illegal access of sum field, denied is not set');
  }

  void get notFound {
    if (_notFound != null) return;
    throw Exception('Illegal access of sum field, notFound is not set');
  }

  bool get isFetching {
    return _fetching != null;
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

  void whenFetching(void Function() handler) {
    if (_fetching != null) return handler();
  }

  void whenDirty(void Function(Document<T>) handler) {
    if (_dirty != null) return handler(_dirty);
  }

  void whenResolved(void Function(Document<T>) handler) {
    if (_resolved != null) return handler(_resolved);
  }

  void whenDeleting(void Function() handler) {
    if (_deleting != null) return handler();
  }

  void whenDenied(void Function() handler) {
    if (_denied != null) return handler();
  }

  void whenNotFound(void Function() handler) {
    if (_notFound != null) return handler();
  }

  WHEN when<WHEN>(
      {@required WHEN Function() fetching,
      @required WHEN Function(Document<T>) dirty,
      @required WHEN Function(Document<T>) resolved,
      @required WHEN Function() deleting,
      @required WHEN Function() denied,
      @required WHEN Function() notFound}) {
    if (_fetching != null) {
      return fetching();
    }
    if (_dirty != null) {
      return dirty(_dirty);
    }
    if (_resolved != null) {
      return resolved(_resolved);
    }
    if (_deleting != null) {
      return deleting();
    }
    if (_denied != null) {
      return denied();
    }
    if (_notFound != null) {
      return notFound();
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function() fetching,
      WHEN Function(Document<T>) dirty,
      WHEN Function(Document<T>) resolved,
      WHEN Function() deleting,
      WHEN Function() denied,
      WHEN Function() notFound}) {
    if (_fetching != null) {
      if (fetching != null)
        return fetching();
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
        return deleting();
      else
        return otherwise();
    }
    if (_denied != null) {
      if (denied != null)
        return denied();
      else
        return otherwise();
    }
    if (_notFound != null) {
      if (notFound != null)
        return notFound();
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _fetching.hashCode), _dirty.hashCode),
                  _resolved.hashCode),
              _deleting.hashCode),
          _denied.hashCode),
      _notFound.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DocumentResolution) return false;
    return _fetching == other._fetching &&
        _dirty == other._dirty &&
        _resolved == other._resolved &&
        _deleting == other._deleting &&
        _denied == other._denied &&
        _notFound == other._notFound;
  }

  String toString() {
    return "DocumentResolution (${when(fetching: () => 'fetching', dirty: (dirty) => 'dirty $dirty', resolved: (resolved) => 'resolved $resolved', deleting: () => 'deleting', denied: () => 'denied', notFound: () => 'notFound')}))";
  }
}

class CollectionResolution<T> extends $CollectionResolution<T> {
  const CollectionResolution.fetching()
      : _fetching = true,
        _resolved = null,
        _dirty = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const CollectionResolution.resolved(BuiltList<DocumentResolution<T>> resolved)
      : _fetching = null,
        assert(resolved != null),
        _resolved = resolved,
        _dirty = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const CollectionResolution.dirty(BuiltList<DocumentResolution<T>> dirty)
      : _fetching = null,
        _resolved = null,
        assert(dirty != null),
        _dirty = dirty,
        _deleting = null,
        _denied = null,
        _notFound = null;

  const CollectionResolution.deleting()
      : _fetching = null,
        _resolved = null,
        _dirty = null,
        _deleting = true,
        _denied = null,
        _notFound = null;

  const CollectionResolution.denied()
      : _fetching = null,
        _resolved = null,
        _dirty = null,
        _deleting = null,
        _denied = true,
        _notFound = null;

  const CollectionResolution.notFound()
      : _fetching = null,
        _resolved = null,
        _dirty = null,
        _deleting = null,
        _denied = null,
        _notFound = true;

  final bool _fetching;

  final BuiltList<DocumentResolution<T>> _resolved;

  final BuiltList<DocumentResolution<T>> _dirty;

  final bool _deleting;

  final bool _denied;

  final bool _notFound;

  void get fetching {
    if (_fetching != null) return;
    throw Exception('Illegal access of sum field, fetching is not set');
  }

  BuiltList<DocumentResolution<T>> get resolved {
    if (_resolved != null) return _resolved;
    throw Exception('Illegal access of sum field, resolved is not set');
  }

  BuiltList<DocumentResolution<T>> get dirty {
    if (_dirty != null) return _dirty;
    throw Exception('Illegal access of sum field, dirty is not set');
  }

  void get deleting {
    if (_deleting != null) return;
    throw Exception('Illegal access of sum field, deleting is not set');
  }

  void get denied {
    if (_denied != null) return;
    throw Exception('Illegal access of sum field, denied is not set');
  }

  void get notFound {
    if (_notFound != null) return;
    throw Exception('Illegal access of sum field, notFound is not set');
  }

  bool get isFetching {
    return _fetching != null;
  }

  bool get isResolved {
    return _resolved != null;
  }

  bool get isDirty {
    return _dirty != null;
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

  void whenFetching(void Function() handler) {
    if (_fetching != null) return handler();
  }

  void whenResolved(void Function(BuiltList<DocumentResolution<T>>) handler) {
    if (_resolved != null) return handler(_resolved);
  }

  void whenDirty(void Function(BuiltList<DocumentResolution<T>>) handler) {
    if (_dirty != null) return handler(_dirty);
  }

  void whenDeleting(void Function() handler) {
    if (_deleting != null) return handler();
  }

  void whenDenied(void Function() handler) {
    if (_denied != null) return handler();
  }

  void whenNotFound(void Function() handler) {
    if (_notFound != null) return handler();
  }

  WHEN when<WHEN>(
      {@required WHEN Function() fetching,
      @required WHEN Function(BuiltList<DocumentResolution<T>>) resolved,
      @required WHEN Function(BuiltList<DocumentResolution<T>>) dirty,
      @required WHEN Function() deleting,
      @required WHEN Function() denied,
      @required WHEN Function() notFound}) {
    if (_fetching != null) {
      return fetching();
    }
    if (_resolved != null) {
      return resolved(_resolved);
    }
    if (_dirty != null) {
      return dirty(_dirty);
    }
    if (_deleting != null) {
      return deleting();
    }
    if (_denied != null) {
      return denied();
    }
    if (_notFound != null) {
      return notFound();
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function() fetching,
      WHEN Function(BuiltList<DocumentResolution<T>>) resolved,
      WHEN Function(BuiltList<DocumentResolution<T>>) dirty,
      WHEN Function() deleting,
      WHEN Function() denied,
      WHEN Function() notFound}) {
    if (_fetching != null) {
      if (fetching != null)
        return fetching();
      else
        return otherwise();
    }
    if (_resolved != null) {
      if (resolved != null)
        return resolved(_resolved);
      else
        return otherwise();
    }
    if (_dirty != null) {
      if (dirty != null)
        return dirty(_dirty);
      else
        return otherwise();
    }
    if (_deleting != null) {
      if (deleting != null)
        return deleting();
      else
        return otherwise();
    }
    if (_denied != null) {
      if (denied != null)
        return denied();
      else
        return otherwise();
    }
    if (_notFound != null) {
      if (notFound != null)
        return notFound();
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _fetching.hashCode), _resolved.hashCode),
                  _dirty.hashCode),
              _deleting.hashCode),
          _denied.hashCode),
      _notFound.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CollectionResolution) return false;
    return _fetching == other._fetching &&
        _resolved == other._resolved &&
        _dirty == other._dirty &&
        _deleting == other._deleting &&
        _denied == other._denied &&
        _notFound == other._notFound;
  }

  String toString() {
    return "CollectionResolution (${when(fetching: () => 'fetching', resolved: (resolved) => 'resolved $resolved', dirty: (dirty) => 'dirty $dirty', deleting: () => 'deleting', denied: () => 'denied', notFound: () => 'notFound')}))";
  }
}
