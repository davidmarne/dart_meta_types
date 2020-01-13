part of typed_wrappers;

class TypedDocumentSnapshot<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final DocumentSnapshot _snapshot;

  /// The reference that produced this snapshot
  final DR reference;

  /// Contains all the data of this snapshot
  D _data;

  TypedDocumentSnapshot._(
    this._snapshot,
    DR Function(DocumentReference) toTypedDocumentReference,
  ) : reference = toTypedDocumentReference(_snapshot.reference) {
    _data =
        _snapshot.data == null ? null : reference._deserialize(_snapshot.data);
  }

  D get data => _data;

  /// Metadata about this snapshot concerning its source and if it has local
  /// modifications.
  SnapshotMetadata get metadata => _snapshot.metadata;

  /// Returns the ID of the snapshot's document
  String get documentID => _snapshot.documentID;

  /// Returns `true` if the document exists.
  bool get exists => _snapshot.data != null;
}
