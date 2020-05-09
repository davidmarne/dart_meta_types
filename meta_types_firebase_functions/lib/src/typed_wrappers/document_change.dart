part of typed_wrappers;

class TypedDocumentChange<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final DocumentChange _change;

  TypedDocumentChange._(
    this._change,
    DR Function(DocumentReference) toTypedDocumentReference,
  ) : document = TypedDocumentSnapshot._(
          _change.document,
          toTypedDocumentReference,
        );

  /// The document affected by this change.
  final TypedDocumentSnapshot<D, U, DR, DC> document;

  /// The type of change that occurred (added, modified, or removed).
  DocumentChangeType get type => _change.type;

  /// The index of the changed document in the result set immediately prior to
  /// this [DocumentChange] (i.e. supposing that all prior DocumentChange objects
  /// have been applied).
  ///
  /// -1 for [DocumentChangeType.added] events.
  int get oldIndex => _change.oldIndex;

  /// The index of the changed document in the result set immediately after this
  /// DocumentChange (i.e. supposing that all prior [DocumentChange] objects
  /// and the current [DocumentChange] object have been applied).
  ///
  /// -1 for [DocumentChangeType.removed] events.
  int get newIndex => _change.newIndex;
}
