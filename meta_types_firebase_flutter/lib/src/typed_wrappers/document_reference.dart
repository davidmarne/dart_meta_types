part of typed_wrappers;

abstract class TypedDocumentReference<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final DocumentReference _ref;
  final U Function() _updaterFactory;
  final D Function(Map<String, dynamic>) _deserialize;
  final DR Function(DocumentReference) _toTypedDocumentReference;

  TypedDocumentReference(
    Firestore firestore,
    String path,
    this._updaterFactory,
    this._deserialize,
    this._toTypedDocumentReference,
  ) : _ref = firestore.document(path);

  @protected
  DocumentReference get ref => _ref;

  @override
  bool operator ==(dynamic o) =>
      o is TypedDocumentReference<D, U, DR, DC> && o._ref == _ref;

  @override
  int get hashCode => _ref.hashCode;

  // to be generated
  DC get parent;

  String get path => _ref.path;

  String get documentID => _ref.documentID;

  Future<void> setData(
    void Function(U) updater, {
    bool merge = false,
  }) {
    if (merge) {
      return updateData(updater);
    }

    final u = _updaterFactory();
    updater(u);
    return _ref.setData(u.update);
  }

  Future<void> updateData(void Function(U) updater) {
    final u = _updaterFactory();
    updater(u);
    return _ref.updateData(u.update);
  }

  Future<TypedDocumentSnapshot<D, U, DR, DC>> get({
    Source source = Source.serverAndCache,
  }) {
    return _ref.get().then(_toTypedSnapshot);
  }

  /// Deletes the document referred to this [DocumentReference].
  Future<void> delete() {
    return _ref.delete();
  }

  Stream<TypedDocumentSnapshot<D, U, DR, DC>> snapshots({
    bool includeMetadataChanges,
  }) =>
      _ref
          .snapshots(includeMetadataChanges: includeMetadataChanges)
          .map(_toTypedSnapshot);

  TypedDocumentSnapshot<D, U, DR, DC> _toTypedSnapshot(
    DocumentSnapshot snapshot,
  ) =>
      TypedDocumentSnapshot._(
        snapshot,
        _toTypedDocumentReference,
      );
}
