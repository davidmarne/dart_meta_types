part of typed_wrappers;

/// A QuerySnapshot contains zero or more DocumentSnapshot objects.
class TypedQuerySnapshot<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final QuerySnapshot _snapshot;

  TypedQuerySnapshot._(
    this._snapshot,
    DR Function(DocumentReference) toTypedDocumentReference,
  )   : documents = _snapshot.documents
            .map(
              (snapshot) => TypedDocumentSnapshot<D, U, DR, DC>._(
                snapshot,
                toTypedDocumentReference,
              ),
            )
            .toList(),
        documentChanges = _snapshot.documentChanges
            .map(
              (change) => TypedDocumentChange<D, U, DR, DC>._(
                change,
                toTypedDocumentReference,
              ),
            )
            .toList();

  /// Gets a list of all the documents included in this snapshot
  final List<TypedDocumentSnapshot<D, U, DR, DC>> documents;

  /// An array of the documents that changed since the last snapshot. If this
  /// is the first snapshot, all documents will be in the list as Added changes.
  final List<TypedDocumentChange<D, U, DR, DC>> documentChanges;

  SnapshotMetadata get metadata => _snapshot.metadata;
}
