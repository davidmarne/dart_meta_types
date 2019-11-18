// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Reference extends $Reference {
  Reference({String path, String id})
      : _path = path,
        assert(path != null),
        _id = id,
        assert(id != null);

  final String _path;

  final String _id;

  Reference clone({String path, String id}) {
    return Reference(
      path: path ?? _path,
      id: id ?? _id,
    );
  }

  String get path {
    return _path;
  }

  String get id {
    return _id;
  }

  int get hashCode {
    return $jf($jc($jc(0, path.hashCode), id.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Reference) return false;
    return path == other.path && id == other.id;
  }

  String toString() {
    return "Reference (path: $path, id: $id)";
  }
}

class DocumentResolution<T extends Path> extends $DocumentResolution<T> {
  DocumentResolution.fetching(Reference fetching)
      : assert(fetching != null),
        _fetching = fetching,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  DocumentResolution.creating(T creating)
      : _fetching = null,
        assert(creating != null),
        _creating = creating,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  DocumentResolution.dirty(T dirty)
      : _fetching = null,
        _creating = null,
        assert(dirty != null),
        _dirty = dirty,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  DocumentResolution.resolved(T resolved)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        assert(resolved != null),
        _resolved = resolved,
        _deleting = null,
        _denied = null,
        _notFound = null;

  DocumentResolution.deleting(T deleting)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        assert(deleting != null),
        _deleting = deleting,
        _denied = null,
        _notFound = null;

  DocumentResolution.denied(Reference denied)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        assert(denied != null),
        _denied = denied,
        _notFound = null;

  DocumentResolution.notFound(Reference notFound)
      : _fetching = null,
        _creating = null,
        _dirty = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        assert(notFound != null),
        _notFound = notFound;

  DocumentResolution(
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

  String get id {
    return when(
      fetching: (fetching) => fetching.id,
      creating: (creating) => creating.id,
      dirty: (dirty) => dirty.id,
      resolved: (resolved) => resolved.id,
      deleting: (deleting) => deleting.id,
      denied: (denied) => denied.id,
      notFound: (notFound) => notFound.id,
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
    if (other is! DocumentResolution) return false;
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
    return 'DocumentResolution( $value )';
  }
}

abstract class IDocumentResolution<T> {
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

class CollectionResolution<T extends Path> extends $CollectionResolution<T> {
  CollectionResolution.fetching(Reference fetching)
      : assert(fetching != null),
        _fetching = fetching,
        _appendingItem = null,
        _prependingItem = null,
        _removingItem = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  CollectionResolution.appendingItem(AppendingItem<T> appendingItem)
      : _fetching = null,
        assert(appendingItem != null),
        _appendingItem = appendingItem,
        _prependingItem = null,
        _removingItem = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  CollectionResolution.prependingItem(PrependingItem<T> prependingItem)
      : _fetching = null,
        _appendingItem = null,
        assert(prependingItem != null),
        _prependingItem = prependingItem,
        _removingItem = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  CollectionResolution.removingItem(RemovingItem<T> removingItem)
      : _fetching = null,
        _appendingItem = null,
        _prependingItem = null,
        assert(removingItem != null),
        _removingItem = removingItem,
        _resolved = null,
        _deleting = null,
        _denied = null,
        _notFound = null;

  CollectionResolution.resolved(Items<T> resolved)
      : _fetching = null,
        _appendingItem = null,
        _prependingItem = null,
        _removingItem = null,
        assert(resolved != null),
        _resolved = resolved,
        _deleting = null,
        _denied = null,
        _notFound = null;

  CollectionResolution.deleting(Items<T> deleting)
      : _fetching = null,
        _appendingItem = null,
        _prependingItem = null,
        _removingItem = null,
        _resolved = null,
        assert(deleting != null),
        _deleting = deleting,
        _denied = null,
        _notFound = null;

  CollectionResolution.denied(Reference denied)
      : _fetching = null,
        _appendingItem = null,
        _prependingItem = null,
        _removingItem = null,
        _resolved = null,
        _deleting = null,
        assert(denied != null),
        _denied = denied,
        _notFound = null;

  CollectionResolution.notFound(Reference notFound)
      : _fetching = null,
        _appendingItem = null,
        _prependingItem = null,
        _removingItem = null,
        _resolved = null,
        _deleting = null,
        _denied = null,
        assert(notFound != null),
        _notFound = notFound;

  CollectionResolution(
      {Reference fetching,
      AppendingItem<T> appendingItem,
      PrependingItem<T> prependingItem,
      RemovingItem<T> removingItem,
      Items<T> resolved,
      Items<T> deleting,
      Reference denied,
      Reference notFound})
      : _fetching = fetching,
        _appendingItem = appendingItem,
        _prependingItem = prependingItem,
        _removingItem = removingItem,
        _resolved = resolved,
        _deleting = deleting,
        _denied = denied,
        _notFound = notFound {
    var found = false;
    if (fetching != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (appendingItem != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (prependingItem != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (removingItem != null) {
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

  final AppendingItem<T> _appendingItem;

  final PrependingItem<T> _prependingItem;

  final RemovingItem<T> _removingItem;

  final Items<T> _resolved;

  final Items<T> _deleting;

  final Reference _denied;

  final Reference _notFound;

  String get path {
    return when(
      fetching: (fetching) => fetching.path,
      appendingItem: (appendingItem) => appendingItem.path,
      prependingItem: (prependingItem) => prependingItem.path,
      removingItem: (removingItem) => removingItem.path,
      resolved: (resolved) => resolved.path,
      deleting: (deleting) => deleting.path,
      denied: (denied) => denied.path,
      notFound: (notFound) => notFound.path,
    );
  }

  String get id {
    return when(
      fetching: (fetching) => fetching.id,
      appendingItem: (appendingItem) => appendingItem.id,
      prependingItem: (prependingItem) => prependingItem.id,
      removingItem: (removingItem) => removingItem.id,
      resolved: (resolved) => resolved.id,
      deleting: (deleting) => deleting.id,
      denied: (denied) => denied.id,
      notFound: (notFound) => notFound.id,
    );
  }

  Reference get fetching {
    if (_fetching != null) return _fetching;
    throw Exception('TODO name htis');
  }

  AppendingItem<T> get appendingItem {
    if (_appendingItem != null) return _appendingItem;
    throw Exception('TODO name htis');
  }

  PrependingItem<T> get prependingItem {
    if (_prependingItem != null) return _prependingItem;
    throw Exception('TODO name htis');
  }

  RemovingItem<T> get removingItem {
    if (_removingItem != null) return _removingItem;
    throw Exception('TODO name htis');
  }

  Items<T> get resolved {
    if (_resolved != null) return _resolved;
    throw Exception('TODO name htis');
  }

  Items<T> get deleting {
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

  bool get isAppendingItem {
    return _appendingItem != null;
  }

  bool get isPrependingItem {
    return _prependingItem != null;
  }

  bool get isRemovingItem {
    return _removingItem != null;
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

  void whenAppendingItem(void Function(AppendingItem<T>) handler) {
    if (_appendingItem != null) handler(_appendingItem);
  }

  void whenPrependingItem(void Function(PrependingItem<T>) handler) {
    if (_prependingItem != null) handler(_prependingItem);
  }

  void whenRemovingItem(void Function(RemovingItem<T>) handler) {
    if (_removingItem != null) handler(_removingItem);
  }

  void whenResolved(void Function(Items<T>) handler) {
    if (_resolved != null) handler(_resolved);
  }

  void whenDeleting(void Function(Items<T>) handler) {
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
      WHEN Function(AppendingItem<T>) appendingItem,
      WHEN Function(PrependingItem<T>) prependingItem,
      WHEN Function(RemovingItem<T>) removingItem,
      WHEN Function(Items<T>) resolved,
      WHEN Function(Items<T>) deleting,
      WHEN Function(Reference) denied,
      WHEN Function(Reference) notFound}) {
    if (_fetching != null) {
      return fetching(_fetching);
    }
    if (_appendingItem != null) {
      return appendingItem(_appendingItem);
    }
    if (_prependingItem != null) {
      return prependingItem(_prependingItem);
    }
    if (_removingItem != null) {
      return removingItem(_removingItem);
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
      WHENO Function(AppendingItem<T>) appendingItem,
      WHENO Function(PrependingItem<T>) prependingItem,
      WHENO Function(RemovingItem<T>) removingItem,
      WHENO Function(Items<T>) resolved,
      WHENO Function(Items<T>) deleting,
      WHENO Function(Reference) denied,
      WHENO Function(Reference) notFound}) {
    if (_fetching != null) {
      if (fetching != null)
        return fetching(_fetching);
      else
        return otherwise();
    }
    if (_appendingItem != null) {
      if (appendingItem != null)
        return appendingItem(_appendingItem);
      else
        return otherwise();
    }
    if (_prependingItem != null) {
      if (prependingItem != null)
        return prependingItem(_prependingItem);
      else
        return otherwise();
    }
    if (_removingItem != null) {
      if (removingItem != null)
        return removingItem(_removingItem);
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
                    $jc(
                        $jc(
                            $jc($jc(0, _fetching.hashCode),
                                _appendingItem.hashCode),
                            _prependingItem.hashCode),
                        _removingItem.hashCode),
                    _resolved.hashCode),
                _deleting.hashCode),
            _denied.hashCode),
        _notFound.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CollectionResolution) return false;
    return _fetching == other._fetching &&
        _appendingItem == other._appendingItem &&
        _prependingItem == other._prependingItem &&
        _removingItem == other._removingItem &&
        _resolved == other._resolved &&
        _deleting == other._deleting &&
        _denied == other._denied &&
        _notFound == other._notFound;
  }

  String toString() {
    final value = when(
      fetching: (fetching) => 'fetching $fetching',
      appendingItem: (appendingItem) => 'appendingItem $appendingItem',
      prependingItem: (prependingItem) => 'prependingItem $prependingItem',
      removingItem: (removingItem) => 'removingItem $removingItem',
      resolved: (resolved) => 'resolved $resolved',
      deleting: (deleting) => 'deleting $deleting',
      denied: (denied) => 'denied $denied',
      notFound: (notFound) => 'notFound $notFound',
    );
    return 'CollectionResolution( $value )';
  }
}

class Items<T extends Path> extends $Items<T> {
  Items({BuiltList<T> items, Option<T> nextStart, String path, String id})
      : _items = items,
        assert(items != null),
        _nextStart = nextStart,
        assert(nextStart != null),
        _path = path,
        assert(path != null),
        _id = id,
        assert(id != null);

  final BuiltList<T> _items;

  final Option<T> _nextStart;

  final String _path;

  final String _id;

  Items<T> clone(
      {BuiltList<T> items, Option<T> nextStart, String path, String id}) {
    return Items(
      items: items ?? _items,
      nextStart: nextStart ?? _nextStart,
      path: path ?? _path,
      id: id ?? _id,
    );
  }

  BuiltList<T> get items {
    return _items;
  }

  Option<T> get nextStart {
    return _nextStart;
  }

  String get path {
    return _path;
  }

  String get id {
    return _id;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, items.hashCode), nextStart.hashCode), path.hashCode),
        id.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Items) return false;
    return items == other.items &&
        nextStart == other.nextStart &&
        path == other.path &&
        id == other.id;
  }

  String toString() {
    return "Items (items: $items, nextStart: $nextStart, path: $path, id: $id)";
  }
}

class AppendingItem<T extends Path> extends $AppendingItem<T> {
  AppendingItem(
      {T appending,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id})
      : _appending = appending,
        assert(appending != null),
        _items = items,
        assert(items != null),
        _nextStart = nextStart,
        assert(nextStart != null),
        _path = path,
        assert(path != null),
        _id = id,
        assert(id != null);

  final T _appending;

  final BuiltList<T> _items;

  final Option<T> _nextStart;

  final String _path;

  final String _id;

  AppendingItem<T> clone(
      {T appending,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id}) {
    return AppendingItem(
      appending: appending ?? _appending,
      items: items ?? _items,
      nextStart: nextStart ?? _nextStart,
      path: path ?? _path,
      id: id ?? _id,
    );
  }

  T get appending {
    return _appending;
  }

  BuiltList<T> get items {
    return _items;
  }

  Option<T> get nextStart {
    return _nextStart;
  }

  String get path {
    return _path;
  }

  String get id {
    return _id;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, appending.hashCode), items.hashCode),
                nextStart.hashCode),
            path.hashCode),
        id.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppendingItem) return false;
    return appending == other.appending &&
        items == other.items &&
        nextStart == other.nextStart &&
        path == other.path &&
        id == other.id;
  }

  String toString() {
    return "AppendingItem (appending: $appending, items: $items, nextStart: $nextStart, path: $path, id: $id)";
  }
}

class PrependingItem<T extends Path> extends $PrependingItem<T> {
  PrependingItem(
      {T prepending,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id})
      : _prepending = prepending,
        assert(prepending != null),
        _items = items,
        assert(items != null),
        _nextStart = nextStart,
        assert(nextStart != null),
        _path = path,
        assert(path != null),
        _id = id,
        assert(id != null);

  final T _prepending;

  final BuiltList<T> _items;

  final Option<T> _nextStart;

  final String _path;

  final String _id;

  PrependingItem<T> clone(
      {T prepending,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id}) {
    return PrependingItem(
      prepending: prepending ?? _prepending,
      items: items ?? _items,
      nextStart: nextStart ?? _nextStart,
      path: path ?? _path,
      id: id ?? _id,
    );
  }

  T get prepending {
    return _prepending;
  }

  BuiltList<T> get items {
    return _items;
  }

  Option<T> get nextStart {
    return _nextStart;
  }

  String get path {
    return _path;
  }

  String get id {
    return _id;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, prepending.hashCode), items.hashCode),
                nextStart.hashCode),
            path.hashCode),
        id.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PrependingItem) return false;
    return prepending == other.prepending &&
        items == other.items &&
        nextStart == other.nextStart &&
        path == other.path &&
        id == other.id;
  }

  String toString() {
    return "PrependingItem (prepending: $prepending, items: $items, nextStart: $nextStart, path: $path, id: $id)";
  }
}

class RemovingItem<T extends Path> extends $RemovingItem<T> {
  RemovingItem(
      {T removing,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id})
      : _removing = removing,
        assert(removing != null),
        _items = items,
        assert(items != null),
        _nextStart = nextStart,
        assert(nextStart != null),
        _path = path,
        assert(path != null),
        _id = id,
        assert(id != null);

  final T _removing;

  final BuiltList<T> _items;

  final Option<T> _nextStart;

  final String _path;

  final String _id;

  RemovingItem<T> clone(
      {T removing,
      BuiltList<T> items,
      Option<T> nextStart,
      String path,
      String id}) {
    return RemovingItem(
      removing: removing ?? _removing,
      items: items ?? _items,
      nextStart: nextStart ?? _nextStart,
      path: path ?? _path,
      id: id ?? _id,
    );
  }

  T get removing {
    return _removing;
  }

  BuiltList<T> get items {
    return _items;
  }

  Option<T> get nextStart {
    return _nextStart;
  }

  String get path {
    return _path;
  }

  String get id {
    return _id;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, removing.hashCode), items.hashCode),
                nextStart.hashCode),
            path.hashCode),
        id.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! RemovingItem) return false;
    return removing == other.removing &&
        items == other.items &&
        nextStart == other.nextStart &&
        path == other.path &&
        id == other.id;
  }

  String toString() {
    return "RemovingItem (removing: $removing, items: $items, nextStart: $nextStart, path: $path, id: $id)";
  }
}

class Receipt<T extends Path> extends $Receipt<T> {
  Receipt({int subscriptionId, T resolution})
      : _subscriptionId = subscriptionId,
        assert(subscriptionId != null),
        _resolution = resolution,
        assert(resolution != null);

  final int _subscriptionId;

  final T _resolution;

  Receipt<T> clone({int subscriptionId, T resolution}) {
    return Receipt(
      subscriptionId: subscriptionId ?? _subscriptionId,
      resolution: resolution ?? _resolution,
    );
  }

  int get subscriptionId {
    return _subscriptionId;
  }

  T get resolution {
    return _resolution;
  }

  int get hashCode {
    return $jf($jc($jc(0, subscriptionId.hashCode), resolution.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Receipt) return false;
    return subscriptionId == other.subscriptionId &&
        resolution == other.resolution;
  }

  String toString() {
    return "Receipt (subscriptionId: $subscriptionId, resolution: $resolution)";
  }
}
