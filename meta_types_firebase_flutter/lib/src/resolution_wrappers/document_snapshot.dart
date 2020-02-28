import 'dart:async';
import 'package:meta_types_firebase/meta_types_firebase.dart';
import 'package:built_collection/built_collection.dart';

import '../typed_wrappers.dart';
import '../document_updater.dart';

class DocumentResolver<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final DR _ref;
  final _controller = StreamController<DocumentResolution<D>>();
  StreamSubscription<TypedDocumentSnapshot<D, U, DR, DC>> _subscription;

  DocumentResolver(this._ref) {
    // subscribe to snapshots
    _subscription = _ref.snapshots(includeMetadataChanges: true).listen((d) {
      _controller.add(
        _snapshotToResolution(d),
      );
    }, onError: (e) {
      // notfiy the client the data does not exist or is not accessable
      _controller.add(DocumentResolution.denied());
    });
  }

  Stream<DocumentResolution<D>> get resolutions => _controller.stream;

  void close() {
    _subscription.cancel();
    _controller.close();
  }
}

DocumentResolution<D> _snapshotToResolution<
            D,
            U extends DocumentUpdater<D>,
            DR extends TypedDocumentReference<D, U, DR, DC>,
            DC extends TypedCollectionReference<D, U, DR, DC>>(
        TypedDocumentSnapshot<D, U, DR, DC> d) =>
    !d.exists
        ? d.metadata.hasPendingWrites
            ? DocumentResolution.deleting()
            : DocumentResolution.notFound()
        : d.metadata.isFromCache || d.metadata.hasPendingWrites
            ? DocumentResolution.dirty(Document(id: d.documentID, data: d.data))
            : DocumentResolution.resolved(
                Document(id: d.documentID, data: d.data));

class CollectionResolver<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final TypedQuery<D, U, DR, DC> _ref;
  final _controller = StreamController<CollectionResolution<D>>();
  StreamSubscription<TypedQuerySnapshot<D, U, DR, DC>> _subscription;

  CollectionResolver(this._ref) {
    // subscribe to snapshots
    _subscription = _ref.snapshots(includeMetadataChanges: true).listen((c) {
      if (c.documents.isEmpty) {
        _controller.add(
          c.metadata.hasPendingWrites
              ? CollectionResolution.deleting()
              : CollectionResolution.notFound(),
        );
      } else {
        _controller.add(
          c.metadata.isFromCache || c.metadata.hasPendingWrites
              ? CollectionResolution.dirty(
                  BuiltList<DocumentResolution<D>>(
                    c.documents.map(_snapshotToResolution),
                  ),
                )
              : CollectionResolution.resolved(
                  BuiltList<DocumentResolution<D>>(
                    c.documents.map(_snapshotToResolution),
                  ),
                ),
        );
      }
    }, onError: (e) {
      // notfiy the client the data does not exist or is not accessable
      _controller.add(
        CollectionResolution.denied(),
      );
    });
  }

  Stream<CollectionResolution<D>> get resolutions => _controller.stream;

  void close() {
    _subscription.cancel();
    _controller.close();
  }
}
