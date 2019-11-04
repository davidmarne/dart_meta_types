import 'dart:async';
import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart' hide Path;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_value/serializer.dart' show StructuredSerializer;

import 'client.dart';

part 'document_hook.g.dart';

@DataClass()
abstract class $DocumentResolutions<T extends Path> {
  BuiltMap<DocumentReference, T> get _data;
  T operator [](DocumentReference ref) => _data[ref];

  @computed
  Iterable<T> get datas => _data.values;
}

DocumentResolution<T> useFirebaseDocument<T extends Path>(
    DocumentReference ref, StructuredSerializer serializer) {
  return useFirebaseDocuments<T>([ref], serializer)[ref];
}

DocumentResolutions<DocumentResolution<T>> useFirebaseDocuments<T extends Path>(
    Iterable<DocumentReference> refs, StructuredSerializer serializer) {
  return Hook.use(_FirebaseDocumentHook(refs: refs, serializer: serializer));
}

class _FirebaseDocumentHook<T extends Path>
    extends Hook<DocumentResolutions<DocumentResolution<T>>> {
  final Iterable<DocumentReference> refs;
  final StructuredSerializer serializer;

  const _FirebaseDocumentHook({this.refs, this.serializer});

  @override
  _FirebaseDocumentHookState<T> createState() => _FirebaseDocumentHookState();
}

class _FirebaseDocumentHookState<T extends Path> extends HookState<
    DocumentResolutions<DocumentResolution<T>>, _FirebaseDocumentHook<T>> {
  DocumentResolutions<DocumentResolution<T>> _state;
  Map<DocumentReference, int> _subs;
  StreamSubscription _firebaseClientChangesSub;
  FirebaseClient _client;

  @override
  void initHook() {
    super.initHook();
    _state = _checkoutDocuments();
    _firebaseClientChangesSub = _client.change.listen((_) {
      final next = _recalculateState();
      if (_state != next) {
        _state = next;
        setState(() {});
      }
    });
  }

  @override
  void didUpdateHook(_FirebaseDocumentHook<T> old) {
    // unsub to old refs
    final subsToRemove = _subs.entries.where((e) => !hook.refs.contains(e.key));
    subsToRemove.forEach((e) {
      _client.checkinDocument(e.value);
      _subs.remove(e.key);
    });

    // sub to new refs
    final subsToObtain = hook.refs.where((ref) => !_subs.containsKey(ref));
    subsToObtain.forEach((ref) {
      _subs[ref] =
          _client.checkoutDocument(ref, hook.serializer).subscriptionId;
    });
  }

  @override
  void dispose() {
    _firebaseClientChangesSub.cancel();
    _subs.values.forEach(_client.checkinDocument);
  }

  @override
  build(BuildContext context) {
    return _state;
  }

  DocumentResolutions<DocumentResolution<T>> _checkoutDocuments() =>
      DocumentResolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            final receipt = _client.checkoutDocument(ref, hook.serializer);
            b[ref] = receipt.resolution;
            _subs[ref] = receipt.subscriptionId;
          });
        }),
      );

  DocumentResolutions<DocumentResolution<T>> _recalculateState() =>
      DocumentResolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            b[ref] = _client.readDocument(_subs[ref]);
          });
        }),
      );
}
