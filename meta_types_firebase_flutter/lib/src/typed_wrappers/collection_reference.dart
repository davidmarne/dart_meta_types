part of typed_wrappers;

abstract class TypedCollectionReference<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends TypedQuery<D, U, DR, DC> {
  final CollectionReference _ref;
  final Map<String, dynamic> Function(D) _serialize;
  final U Function() _updaterFactory;

  TypedCollectionReference(
    Firestore firestore,
    String path,
    this._updaterFactory,
    this._serialize,
    DR Function(DocumentReference) toTypedDocumentReference,
    DC Function(CollectionReference) toTypedCollectionReference,
  )   : _ref = firestore.collection(path),
        super._(
          firestore,
          path,
          toTypedDocumentReference,
          toTypedCollectionReference,
        );

  // parent will be generated if exists

  @protected
  CollectionReference get ref => _ref;

  /// ID of the referenced collection.
  String get id => _ref.id;

  /// For subcollections, parent returns the containing [DocumentReference].
  ///
  /// For root collections, null is returned.
  // TypedDocumentReference parent();

  /// A string containing the slash-separated path to this  CollectionReference
  /// (relative to the root of the database).
  String get path => _ref.path;

  /// Returns a `DocumentReference` with the provided path.
  ///
  /// If no [path] is provided, an auto-generated ID is used.
  ///
  /// The unique key generated is prefixed with a client-generated timestamp
  /// so that the resulting list will be chronologically-sorted.
  DR document([String path]) {
    return _toTypedDocumentReference(_ref.document(path));
  }

  /// Returns a `DocumentReference` with an auto-generated ID, after
  /// populating it with provided [data].
  ///
  /// The unique key generated is prefixed with a client-generated timestamp
  /// so that the resulting list will be chronologically-sorted.
  Future<DR> add(D value) async {
    return _toTypedDocumentReference(
      await _ref.add(_serialize(value)),
    );
  }
}
