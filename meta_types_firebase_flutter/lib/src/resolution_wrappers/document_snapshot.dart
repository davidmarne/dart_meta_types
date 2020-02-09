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
    print("DAVE EF PASS ${_ref.path}");
    _subscription = _ref.snapshots(includeMetadataChanges: true).listen((d) {
      print("DAVE GOTdHER");
      _controller.add(
        _snapshotToResolution(d),
      );
    }, onError: (e) {
      print("DAVE ya here");
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
            ? DocumentResolution.dirty(d.data)
            : DocumentResolution.resolved(d.data);

class CollectionResolver<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final DC _ref;
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
              ? CollectionResolution.resolved(
                  BuiltList<DocumentResolution<D>>(
                    c.documents.map(_snapshotToResolution),
                  ),
                )
              : CollectionResolution.dirty(
                  BuiltList<DocumentResolution<D>>(
                    c.documents.map(_snapshotToResolution),
                  ),
                ),
        );
      }
    }, onError: (e) {
      print("DAVE failed ${e.runtimeType} $e");
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
