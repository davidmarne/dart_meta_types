import 'dart:async';
import 'package:meta/meta.dart';
import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'meta_types_firebase_flutter_hook.g.dart';

const creating = "creating";

typedef Deserialize = T Function<T>(Object);

@DataClass()
abstract class $Reference implements DocReference {}

@DataClass(isInterface: true)
abstract class DocReference {
  String get path;
}

@SealedClass()
abstract class $Resolution<T extends DocReference> implements DocReference {
  Reference get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  T get deleting;
  Reference get denied;
  Reference get notFound;
}

@DataClass()
abstract class $Subscription {
  int get id;
  Reference get ref;
}

abstract class FirebaseClient {
  Future<void> create<T extends DocReference>(T data);
  Future<void> update<T extends DocReference>(T data);
  Future<void> delete<T extends DocReference>(T data);
  factory FirebaseClient(Firestore store) => new _FirebaseClient(store);
}

class _FirebaseClient implements FirebaseClient {
  Firestore _store;
  final _deserializers = <Reference, Deserialize>{};
  final _subs = <Reference, List<Subscription>>{};
  final _data = <Reference, Object>{};
  final _snapshots = <Reference, StreamSubscription>{};
  final _changeController = StreamController<void>.broadcast();

  var _nextId = 0;

  _FirebaseClient(this._store);

  Subscription checkout<T extends DocReference>(
      Reference ref, Deserialize deserializer) {
    final sub = Subscription(id: _nextId++, ref: ref);
    _deserializers[ref] = deserializer;
    if (_subs.containsKey(ref)) {
      _subs[ref].add(sub);
    } else {
      _data[ref] = Resolution.fetching(ref);
      _subs[ref] = [sub];
      _snapshots[ref] =
          _store.document(ref.path).snapshots().listen(_onDoc(ref));
      _store
          .document(ref.path)
          .get()
          .then(_onNewDoc(ref))
          .catchError(_onDocFail(ref));
    }
    return sub;
  }

  void Function(DocumentSnapshot) _onNewDoc(Reference ref) =>
      (DocumentSnapshot snapshot) {
        if (!_data.containsKey(ref)) {
          _setData(ref, _deserializers[ref](snapshot.data));
        }
      };

  void Function(DocumentSnapshot) _onDoc(Reference ref) =>
      (DocumentSnapshot snapshot) {
        _setData(ref, _deserializers[ref](snapshot.data));
      };

  void Function(Object error) _onDocFail(Reference ref) => (Object error) {
        return _data[ref] = Resolution.notFound(ref);
      };

  Resolution<T> read<T extends DocReference>(Subscription subscription) {
    return _data[subscription.ref];
  }

  void checkin<T extends DocReference>(Subscription subscription) {
    _subs[subscription.ref].remove(subscription);
    if (_subs[subscription.ref].isEmpty) {
      _subs.remove(subscription.ref);
      _data.remove(subscription.ref);
    }
  }

  Future<void> create<T extends DocReference>(T data) {
    _setData(Reference(path: data.path), Resolution.creating(data));
    return _store.document(data.path).setData(toJson(data));
  }

  Future<void> update<T extends DocReference>(T data) {
    _setData(Reference(path: data.path), Resolution.dirty(data));
    return _store.document(data.path).updateData(toJson(data));
  }

  Future<void> delete<T extends DocReference>(T data) {
    _setData(Reference(path: data.path), Resolution.deleting(data));
    return _store.document(data.path).delete();
  }

  void _setData(Reference ref, Resolution resolution) {
    _data[ref] = resolution;
    _changeController.add(null);
  }

  Stream<void> get change => _changeController.stream;

  void dispose() {
    _changeController.close();
  }
}

@DataClass()
abstract class $FirebaseHookData<T extends DocReference> {
  BuiltMap<Reference, Resolution<T>> get _data;
  Resolution<T> operator [](Reference ref) => _data[ref];
  Iterable<Resolution<T>> get datas => _data.values;
}

Resolution<T> useFirebaseDoc<T extends DocReference>(
    Reference ref, Deserialize deserializer) {
  return useFirebaseDocs<T>([ref], deserializer)[ref];
}

FirebaseHookData<T> useFirebaseDocs<T extends DocReference>(
    Iterable<Reference> refs, Deserialize deserializer) {
  return Hook.use(_FirebaseHook(refs: refs, deserializer: deserializer));
}

class _FirebaseHook<T extends DocReference> extends Hook<FirebaseHookData<T>> {
  final Iterable<Reference> refs;
  final Deserialize deserializer;

  const _FirebaseHook({this.refs, this.deserializer});

  @override
  _FirebaseHookState<T> createState() => _FirebaseHookState();
}

class _FirebaseHookState<T extends DocReference>
    extends HookState<FirebaseHookData<T>, _FirebaseHook<T>> {
  FirebaseHookData<T> _state;
  Map<Reference, Subscription> _subs;
  StreamSubscription _sub;
  _FirebaseClient _client;

  @override
  void initHook() {
    super.initHook();
    _state = _calcState();
    _sub = _client.change.listen((_) {
      final next = _calcState();
      if (_state != next) {
        _state = next;
        setState(() {});
      }
    });
  }

  @override
  void didUpdateHook(_FirebaseHook<T> old) {
    // unsub to old refs
    final subsToRemove = _subs.entries.where((e) => !hook.refs.contains(e.key));
    subsToRemove.forEach((e) {
      _client.checkin(e.value);
      _subs.remove(e.key);
    });

    // sub to new refs
    final subsToObtain = hook.refs.where((ref) => !_subs.containsKey(ref));
    subsToObtain.forEach((ref) {
      _subs[ref] = _client.checkout(ref, hook.deserializer);
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    _subs.values.forEach(_client.checkin);
  }

  @override
  build(BuildContext context) {
    return _state;
  }

  FirebaseHookData<T> _calcState() => FirebaseHookData(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            b[ref] = _client.read(_subs[ref]);
          });
        }),
      );
}

FirebaseClient useFirebaseClient() {
  return Hook.use(_FirebaseClientHook());
}

class _FirebaseClientHook extends Hook<FirebaseClient> {
  final Iterable<Reference> refs;
  final Deserialize deserializer;

  const _FirebaseClientHook({this.refs, this.deserializer});

  @override
  _FirebaseClientHookState createState() => _FirebaseClientHookState();
}

class _FirebaseClientHookState
    extends HookState<FirebaseClient, _FirebaseClientHook> {
  _FirebaseClient _client;

  @override
  void initHook() {}

  @override
  build(BuildContext context) {
    return _client;
  }
}
