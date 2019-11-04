import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart' hide Path;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:built_value/serializer.dart' show StructuredSerializer;

import 'client.dart';

DocumentResolution<T> useFirebaseDocument<T extends Path>(
    Reference ref, StructuredSerializer serializer) {
  return useFirebaseDocuments<T>([ref], serializer)[ref];
}

Resolutions<DocumentResolution<T>> useFirebaseDocuments<T extends Path>(
    Iterable<Reference> refs, StructuredSerializer serializer) {
  return Hook.use(_FirebaseDocumentHook(refs: refs, serializer: serializer));
}

class _FirebaseDocumentHook<T extends Path>
    extends Hook<Resolutions<DocumentResolution<T>>> {
  final Iterable<Reference> refs;
  final StructuredSerializer serializer;

  const _FirebaseDocumentHook({this.refs, this.serializer});

  @override
  _FirebaseDocumentHookState<T> createState() => _FirebaseDocumentHookState();
}

class _FirebaseDocumentHookState<T extends Path> extends HookState<
    Resolutions<DocumentResolution<T>>, _FirebaseDocumentHook<T>> {
  Resolutions<DocumentResolution<T>> _state;
  Map<Reference, int> _subs;
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

  Resolutions<DocumentResolution<T>> _checkoutDocuments() => Resolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            final receipt = _client.checkoutDocument(ref, hook.serializer);
            b[ref] = receipt.resolution;
            _subs[ref] = receipt.subscriptionId;
          });
        }),
      );

  Resolutions<DocumentResolution<T>> _recalculateState() => Resolutions(
        data: BuiltMap.build((b) {
          hook.refs.forEach((ref) {
            b[ref] = _client.readDocument(_subs[ref]);
          });
        }),
      );
}
