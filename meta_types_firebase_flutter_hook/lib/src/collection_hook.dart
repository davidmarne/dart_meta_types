import 'dart:async';
import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart' hide Path;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_value/serializer.dart' show StructuredSerializer;

import 'client.dart';

part 'collection_hook.g.dart';

@DataClass()
abstract class $CollectionResolutions<T extends Path> {
  BuiltMap<CollectionReference, T> get _data;
  T operator [](CollectionReference ref) => _data[ref];

  @computed
  Iterable<T> get datas => _data.values;
}

CollectionResolution<T> useFirebaseCollection<T extends Path>(
    CollectionReference ref, StructuredSerializer serializer) {
  return useFirebaseCollections<T>([ref], serializer)[ref];
}

CollectionResolutions<CollectionResolution<T>>
    useFirebaseCollections<T extends Path>(
        Iterable<CollectionReference> refs, StructuredSerializer serializer) {
  return Hook.use(_FirebaseCollectionHook(refs: refs, serializer: serializer));
}

class _FirebaseCollectionHook<T extends Path>
    extends Hook<CollectionResolutions<CollectionResolution<T>>> {
  final Iterable<CollectionReference> refs;
  final StructuredSerializer serializer;

  const _FirebaseCollectionHook({this.refs, this.serializer});

  @override
  _FirebaseCollectionHookState<T> createState() =>
      _FirebaseCollectionHookState();
}

class _FirebaseCollectionHookState<T extends Path> extends HookState<
    CollectionResolutions<CollectionResolution<T>>,
    _FirebaseCollectionHook<T>> {
  CollectionResolutions<CollectionResolution<T>> _state;
  Map<CollectionReference, int> _subs;
  StreamSubscription _firebaseClientChangesSub;
  FirebaseClient _client;

  @override
  void initHook() {
    super.initHook();
    _state = _checkoutCollections();
    _firebaseClientChangesSub = _client.change.listen((_) {
      final next = _recalculateState();
      if (_state != next) {
        _state = next;
        setState(() {});
      }
    });
  }

  @override
  void didUpdateHook(_FirebaseCollectionHook<T> old) {
    // unsub to old refs
    final subsToRemove = _subs.entries.where((e) => !hook.refs.contains(e.key));
    subsToRemove.forEach((e) {
      _client.checkinCollection(e.value);
      _subs.remove(e.key);
    });

    // sub to new refs
    final subsToObtain = hook.refs.where((ref) => !_subs.containsKey(ref));
    subsToObtain.forEach((ref) {
      _subs[ref] =
          _client.checkoutCollection(ref, hook.serializer).subscriptionId;
    });
  }

  @override
  void dispose() {
    _firebaseClientChangesSub.cancel();
    _subs.values.forEach(_client.checkinCollection);
  }

  @override
  build(BuildContext context) {
    return _state;
  }

  CollectionResolutions<CollectionResolution<T>> _checkoutCollections() =>
      CollectionResolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            final receipt = _client.checkoutCollection(ref, hook.serializer);
            b[ref] = receipt.resolution;
            _subs[ref] = receipt.subscriptionId;
          });
        }),
      );

  CollectionResolutions<CollectionResolution<T>> _recalculateState() =>
      CollectionResolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            b[ref] = _client.readCollection(_subs[ref]);
          });
        }),
      );
}
