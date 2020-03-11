import 'dart:async';
import 'package:meta_types/meta_types.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'resolutions.dart';
import 'resolution_wrappers/document_snapshot.dart';
import 'typed_wrappers.dart';
import 'document_updater.dart';

part 'document_hook.g.dart';

@data
abstract class $DocumentResolutions<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  Map<String, DocumentResolution<D>> get _data;
  DocumentResolution<D> operator [](String id) => _data[id];

  @computed
  Iterable<DocumentResolution<D>> get datas => _data.values;
}

DocumentResolution<D> useFirebaseDocument<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>(
    TypedDocumentReference<D, U, DR, DC> ref) {
  return useFirebaseDocuments<D, U, DR, DC>([ref])[ref.documentID];
}

DocumentResolutions<D, U, DR, DC> useFirebaseDocuments<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>>(Iterable<DR> refs) {
  return Hook.use(_FirebaseDocumentHook<D, U, DR, DC>(refs: refs));
}

class _FirebaseDocumentHook<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends Hook<DocumentResolutions<D, U, DR, DC>> {
  final Iterable<DR> refs;

  const _FirebaseDocumentHook({this.refs});

  @override
  _FirebaseDocumentHookState<D, U, DR, DC> createState() =>
      _FirebaseDocumentHookState();
}

class _FirebaseDocumentHookState<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends HookState<DocumentResolutions<D, U, DR, DC>,
        _FirebaseDocumentHook<D, U, DR, DC>> {
  DocumentResolutions<D, U, DR, DC> _state = DocumentResolutions($_data: {});
  Map<String, StreamSubscription> _subs = {};

  @override
  void initHook() {
    super.initHook();
    _checkoutDocuments(hook.refs);
  }

  @override
  void didUpdateHook(old) {
    final oldSet = old.refs.toSet();
    final newSet = hook.refs.toSet();
    final toAdd = newSet.difference(oldSet);
    final toRemove = oldSet.difference(newSet);
    _checkoutDocuments(toAdd);
    _checkinDocuments(toRemove);

    if (toAdd.isNotEmpty || toRemove.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _subs.values.forEach((s) => s.cancel());
  }

  @override
  build(BuildContext context) {
    return _state;
  }

  void _checkoutDocuments(Iterable<DR> toAdd) {
    for (final ref in toAdd) {
      _state._data[ref.documentID] = DocumentResolution.fetching();
      _subs[ref.documentID] =
          DocumentResolver<D, U, DR, DC>(ref).resolutions.listen((r) {
        _state._data[ref.documentID] = r;
        setState(() {});
      });
      ref.get().then((d) {
        if (_state._data[ref.documentID].isFetching) {
          _state._data[ref.documentID] = DocumentResolution.resolved(
              Document(id: d.documentID, data: d.data));
          setState(() {});
        }
      }).catchError((e) {
        _state._data[ref.documentID] = DocumentResolution.denied();
        setState(() {});
      });
    }
  }

  void _checkinDocuments(Iterable<DR> toRemove) {
    for (final ref in toRemove) {
      _state._data.remove(ref.documentID);
      _subs.remove(ref.documentID).cancel();
    }
  }
}
