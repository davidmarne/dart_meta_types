import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'resolution_wrappers/document_snapshot.dart';
import 'typed_wrappers.dart';
import 'document_updater.dart';
import 'resolutions.dart';

CollectionResolution<D> useFirebaseCollection<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>(
    TypedQuery<D, U, DR, DC> ref) {
  return Hook.use(_FirebaseCollectionHook<D, U, DR, DC>(ref: ref));
}

class _FirebaseCollectionHook<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends Hook<CollectionResolution<D>> {
  final TypedQuery<D, U, DR, DC> ref;
  const _FirebaseCollectionHook({this.ref});

  @override
  _FirebaseCollectionHookState<D, U, DR, DC> createState() =>
      _FirebaseCollectionHookState();
}

class _FirebaseCollectionHookState<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends HookState<CollectionResolution<D>,
        _FirebaseCollectionHook<D, U, DR, DC>> {
  CollectionResolution<D> _state = CollectionResolution.fetching();
  StreamSubscription<CollectionResolution<D>> _sub;

  @override
  void initHook() {
    super.initHook();
    _setupSub();
  }

  @override
  void didUpdateHook(old) {
    if (old.ref != hook.ref) _setupSub();
  }

  void _setupSub() {
    _sub?.cancel();
    _state = CollectionResolution.fetching();
    print("a ");
    _sub =
        CollectionResolver<D, U, DR, DC>(hook.ref).resolutions.listen((next) {
      print("B $next");
      _state = next;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _sub.cancel();
  }

  @override
  CollectionResolution<D> build(BuildContext context) {
    return _state;
  }
}
