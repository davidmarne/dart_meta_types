library typed_wrappers;

import 'dart:async';
import 'package:firebase_functions_interop/firebase_functions_interop.dart';
import 'package:meta/meta.dart';
import 'document_updater.dart';

part 'typed_wrappers/collection_reference.dart';
part 'typed_wrappers/document_change.dart';
part 'typed_wrappers/document_reference.dart';
part 'typed_wrappers/document_snapshot.dart';
part 'typed_wrappers/query_snapshot.dart';
part 'typed_wrappers/query.dart';

abstract class TypedDocumentBuilder<
    D,
    U extends DocumentUpdater<D>,
    DR extends TypedDocumentReference<D, U, DR, DC>,
    DC extends TypedCollectionReference<D, U, DR, DC>> {
  @protected
  final DocumentBuilder nativeInstance;
  final DR Function(DocumentReference) _toTypedDocumentReference;

  TypedDocumentBuilder(this.nativeInstance, this._toTypedDocumentReference);

  /// Event handler that fires every time new data is created in Cloud Firestore.
  CloudFunction onCreate(
          DataEventHandler<TypedDocumentSnapshot<D, U, DR, DC>> handler) =>
      nativeInstance.onCreate(
        (d, e) => handler(
          TypedDocumentSnapshot<D, U, DR, DC>._(d, _toTypedDocumentReference),
          e,
        ),
      );

  /// Event handler that fires every time data is deleted from Cloud Firestore.
  CloudFunction onDelete(
          DataEventHandler<TypedDocumentSnapshot<D, U, DR, DC>> handler) =>
      nativeInstance.onDelete(
        (d, e) => handler(
          TypedDocumentSnapshot<D, U, DR, DC>._(d, _toTypedDocumentReference),
          e,
        ),
      );

  /// Event handler that fires every time data is updated in Cloud Firestore.
  CloudFunction onUpdate(
          ChangeEventHandler<TypedDocumentSnapshot<D, U, DR, DC>> handler) =>
      nativeInstance.onUpdate(
        (d, e) => handler(
            Change(
              TypedDocumentSnapshot<D, U, DR, DC>._(
                  d.after, _toTypedDocumentReference),
              TypedDocumentSnapshot<D, U, DR, DC>._(
                  d.before, _toTypedDocumentReference),
            ),
            e),
      );

  /// Event handler that fires every time a Cloud Firestore write of any
  /// kind (creation, update, or delete) occurs.
  CloudFunction onWrite(
          ChangeEventHandler<TypedDocumentSnapshot<D, U, DR, DC>> handler) =>
      nativeInstance.onWrite(
        (d, e) => handler(
          Change(
            TypedDocumentSnapshot<D, U, DR, DC>._(
                d.after, _toTypedDocumentReference),
            TypedDocumentSnapshot<D, U, DR, DC>._(
                d.before, _toTypedDocumentReference),
          ),
          e,
        ),
      );
}
