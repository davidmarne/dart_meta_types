part of typed_wrappers;

class TypedQuery<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  final Query _query;
  final DR Function(DocumentReference) _toTypedDocumentReference;
  final DC Function(CollectionReference) _toTypedCollectionReference;
  // final List<dynamic> startAt;
  // final List<dynamic> stopAt;
  // final List<dynamic> startBefore;
  // final List<dynamic> stopBefore;

  TypedQuery._(
    Firestore firestore,
    String path,
    this._toTypedDocumentReference,
    this._toTypedCollectionReference,
  ) : _query = firestore.collection(path);
  // startAt = [],
  // stopAt = [],
  // startBefore = [],
  // stopBefore = [];

  TypedQuery._fromQuery(
    this._query,
    this._toTypedDocumentReference,
    this._toTypedCollectionReference,
  );

  /// Notifies of query results at this location
  Stream<TypedQuerySnapshot<D, U, DR, DC>> snapshots(
          {bool includeMetadataChanges = false}) =>
      _query.snapshots(includeMetadataChanges: includeMetadataChanges).map(
            (snapshot) => TypedQuerySnapshot._(
              snapshot,
              _toTypedDocumentReference,
            ),
          );

  /// Fetch the documents for this query
  Future<TypedQuerySnapshot<D, U, DR, DC>> getDocuments({
    Source source = Source.serverAndCache,
  }) =>
      _query.getDocuments(source: source).then(
            (snapshot) => TypedQuerySnapshot._(
              snapshot,
              _toTypedDocumentReference,
            ),
          );

  /// Obtains a CollectionReference corresponding to this query's location.
  DC reference() => _toTypedCollectionReference(_query.reference());

  /// Creates and returns a new [Query] with additional filter on specified
  /// [field]. [field] refers to a field in a document.
  ///
  /// The [field] may consist of a single field name (referring to a top level
  /// field in the document), or a series of field names seperated by dots '.'
  /// (referring to a nested field in the document).
  ///
  /// Only documents satisfying provided condition are included in the result
  /// set.
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> where(
    String field, {
    dynamic isEqualTo,
    dynamic isLessThan,
    dynamic isLessThanOrEqualTo,
    dynamic isGreaterThan,
    dynamic isGreaterThanOrEqualTo,
    dynamic arrayContains,
    bool isNull,
  }) =>
      TypedQuery._fromQuery(
        _query.where(
          field,
          isEqualTo: isEqualTo,
          isLessThan: isLessThan,
          isLessThanOrEqualTo: isLessThanOrEqualTo,
          isGreaterThan: isGreaterThan,
          isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
          arrayContains: arrayContains,
          isNull: isNull,
        ),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Creates and returns a new [Query] that's additionally sorted by the specified
  /// [field].
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> orderBy(
    String field, {
    bool descending = false,
    dynamic startAt,
    dynamic startAfter,
    dynamic stopAt,
    dynamic stopAfter,
  }) =>
      TypedQuery._fromQuery(
        _query.orderBy(field, descending: descending),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Creates and returns a new [Query] that starts after the provided document
  /// (exclusive). The starting position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// this query.
  ///
  /// Cannot be used in combination with [startAtDocument], [startAt], or
  /// [startAfter], but can be used in combination with [endAt],
  /// [endBefore], [endAtDocument] and [endBeforeDocument].
  ///
  /// See also:
  ///  * [endAfterDocument] for a query that ends after a document.
  ///  * [startAtDocument] for a query that starts at a document.
  ///  * [endAtDocument] for a query that ends at a document.
  TypedQuery<D, U, DR, DC> startAfterDocument(
    TypedDocumentSnapshot<D, U, DR, DC> documentSnapshot,
  ) =>
      TypedQuery._fromQuery(
        _query.startAfterDocument(documentSnapshot._snapshot),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  // /// Creates and returns a new [Query] that starts at the provided document
  // /// (inclusive). The starting position is relative to the order of the query.
  // /// The document must contain all of the fields provided in the orderBy of
  // /// this query.
  // ///
  // /// Cannot be used in combination with [startAfterDocument], [startAfter], or
  // /// [startAt], but can be used in combination with [endAt],
  // /// [endBefore], [endAtDocument] and [endBeforeDocument].
  // ///
  // /// See also:
  // ///  * [startAfterDocument] for a query that starts after a document.
  // ///  * [endAtDocument] for a query that ends at a document.
  // ///  * [endBeforeDocument] for a query that ends before a document.
  TypedQuery<D, U, DR, DC> startAtDocument(
    TypedDocumentSnapshot<D, U, DR, DC> documentSnapshot,
  ) =>
      TypedQuery._fromQuery(
        _query.startAtDocument(documentSnapshot._snapshot),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  // /// Takes a list of [values], creates and returns a new [Query] that starts
  // /// after the provided fields relative to the order of the query.
  // ///
  // /// The [values] must be in order of [orderBy] filters.
  // ///
  // /// Cannot be used in combination with [startAt], [startAfterDocument], or
  // /// [startAtDocument], but can be used in combination with [endAt],
  // /// [endBefore], [endAtDocument] and [endBeforeDocument].
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> startAfter(List<dynamic> values) =>
      TypedQuery._fromQuery(
        _query.startAfter(values),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Takes a list of [values], creates and returns a new [Query] that starts at
  /// the provided fields relative to the order of the query.
  ///
  /// The [values] must be in order of [orderBy] filters.
  ///
  /// Cannot be used in combination with [startAfter], [startAfterDocument],
  /// or [startAtDocument], but can be used in combination with [endAt],
  /// [endBefore], [endAtDocument] and [endBeforeDocument].
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> startAt(List<dynamic> values) =>
      TypedQuery._fromQuery(
        _query.startAt(values),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  // /// Creates and returns a new [Query] that ends at the provided document
  // /// (inclusive). The end position is relative to the order of the query.
  // /// The document must contain all of the fields provided in the orderBy of
  // /// this query.
  // ///
  // /// Cannot be used in combination with [endBefore], [endBeforeDocument], or
  // /// [endAt], but can be used in combination with [startAt],
  // /// [startAfter], [startAtDocument] and [startAfterDocument].
  // ///
  // /// See also:
  // ///  * [startAfterDocument] for a query that starts after a document.
  // ///  * [startAtDocument] for a query that starts at a document.
  // ///  * [endBeforeDocument] for a query that ends before a document.
  TypedQuery<D, U, DR, DC> endAtDocument(
    TypedDocumentSnapshot<D, U, DR, DC> documentSnapshot,
  ) =>
      TypedQuery._fromQuery(
        _query.endAtDocument(documentSnapshot._snapshot),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Takes a list of [values], creates and returns a new [Query] that ends at the
  /// provided fields relative to the order of the query.
  ///
  /// The [values] must be in order of [orderBy] filters.
  ///
  /// Cannot be used in combination with [endBefore], [endBeforeDocument], or
  /// [endAtDocument], but can be used in combination with [startAt],
  /// [startAfter], [startAtDocument] and [startAfterDocument].
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> endAt(List<dynamic> values) => TypedQuery._fromQuery(
        _query.endAt(values),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Creates and returns a new [Query] that ends before the provided document
  /// (exclusive). The end position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// this query.
  ///
  /// Cannot be used in combination with [endAt], [endBefore], or
  /// [endAtDocument], but can be used in combination with [startAt],
  /// [startAfter], [startAtDocument] and [startAfterDocument].
  ///
  /// See also:
  ///  * [startAfterDocument] for a query that starts after document.
  ///  * [startAtDocument] for a query that starts at a document.
  ///  * [endAtDocument] for a query that ends at a document.
  TypedQuery<D, U, DR, DC> endBeforeDocument(
    TypedDocumentSnapshot<D, U, DR, DC> documentSnapshot,
  ) =>
      TypedQuery._fromQuery(
        _query.endBeforeDocument(documentSnapshot._snapshot),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Takes a list of [values], creates and returns a new [Query] that ends before
  /// the provided fields relative to the order of the query.
  ///
  /// The [values] must be in order of [orderBy] filters.
  ///
  /// Cannot be used in combination with [endAt], [endBeforeDocument], or
  /// [endBeforeDocument], but can be used in combination with [startAt],
  /// [startAfter], [startAtDocument] and [startAfterDocument].
  ///
  /// protected, typed implementations will be generated
  @protected
  TypedQuery<D, U, DR, DC> endBefore(List<dynamic> values) =>
      TypedQuery._fromQuery(
        _query.endBefore(values),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );

  /// Creates and returns a new Query that's additionally limited to only return up
  /// to the specified number of documents.
  TypedQuery<D, U, DR, DC> limit(int length) => TypedQuery._fromQuery(
        _query.limit(length),
        _toTypedDocumentReference,
        _toTypedCollectionReference,
      );
}
