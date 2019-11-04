import 'dart:async';
import 'package:meta_types/meta_types.dart';
import 'package:meta_types/meta_types_models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_value/serializer.dart'
    show StructuredSerializer, Serializers;

part 'client.g.dart';

@DataClass()
abstract class $Reference implements Path {}

@DataClass(isInterface: true)
abstract class Path {
  String get path;
}

@SealedClass()
abstract class $DocumentResolution<T extends Path> implements Path {
  Reference get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  T get deleting;
  Reference get denied;
  Reference get notFound;
}

@SealedClass()
abstract class $CollectionResolution<T extends Path> implements Path {
  Reference get fetching;
  AppendingItem<T> get appendingItem;
  PrependingItem<T> get prependingItem;
  RemovingItem<T> get removingItem;
  Items<T> get resolved;
  Items<T> get deleting;
  Reference get denied;
  Reference get notFound;
}

@DataClass()
abstract class $Items<T extends Path> implements Path {
  BuiltList<T> get items;
  Option<T> get nextStart;
}

@DataClass()
abstract class $AppendingItem<T extends Path> implements $Items<T> {
  T get appending;
}

@DataClass()
abstract class $PrependingItem<T extends Path> implements $Items<T> {
  T get prepending;
}

@DataClass()
abstract class $RemovingItem<T extends Path> implements $Items<T> {
  T get removing;
}

@DataClass()
abstract class $Receipt<T extends Path> {
  int get subscriptionId;
  T get resolution;
}

class FirebaseClient {
  final Firestore _store;
  final Serializers _allSerializers;

  final _serializers = <int, StructuredSerializer>{};

  final _documentSubscriptionReferenceLookup = <int, Reference>{};
  final _documentSubscriptions = <Reference, List<int>>{};
  final _documentData = <Reference, DocumentResolution>{};
  final _documentSnapshotStreamSubscriptions =
      <Reference, StreamSubscription>{};

  final _collectionData = <int, CollectionResolution>{};
  final _collectionSnapshotStreamSubscriptions = <int, StreamSubscription>{};

  var _nextId = 0;

  final _changeController = StreamController<void>.broadcast();

  FirebaseClient(this._store, this._allSerializers);

  Stream<void> get change => _changeController.stream;

  DocumentResolution readDocument(int subscriptionId) {
    return _documentData[_documentSnapshotStreamSubscriptions[subscriptionId]];
  }

  CollectionResolution readCollection(int subscriptionId) {
    return _collectionData[
        _collectionSnapshotStreamSubscriptions[subscriptionId]];
  }

  Receipt checkoutCollection<T extends Path>(
      CollectionReference collectionRef, StructuredSerializer serializer) {
    final subscriptionId = _nextId++;
    final ref = Reference(path: collectionRef.path);

    // save the serializer
    _serializers[subscriptionId] = serializer;

    // cache the current resolution
    final resolution = CollectionResolution.fetching(ref);
    _collectionData[subscriptionId] = resolution;
    _documentSubscriptionReferenceLookup[subscriptionId] = ref;

    // subscribe to changes
    _collectionSnapshotStreamSubscriptions[subscriptionId] = _store
        .collection(ref.path)
        .snapshots()
        .listen(_onQuerySnapshot(ref, subscriptionId));

    // fetch the data
    collectionRef
        .getDocuments()
        .then(_onNewQuerySnapshot(ref, subscriptionId))
        .catchError(_onQueryFail(ref, subscriptionId));

    return Receipt(
      resolution: resolution,
      subscriptionId: subscriptionId,
    );
  }

  void checkinCollection(int subscriptionId) {
    _collectionData.remove(subscriptionId);
    _collectionSnapshotStreamSubscriptions.remove(subscriptionId).cancel();
    _serializers.remove(subscriptionId);
  }

  Receipt checkoutDocument<T extends Path>(
      DocumentReference documentRef, StructuredSerializer serializer) {
    final subscriptionId = _nextId++;
    final ref = Reference(path: documentRef.path);

    // save the serializer
    _serializers[subscriptionId] = serializer;

    // if this doc is already subscribed to save
    // off the new subscription and return the cached value.
    if (_documentSubscriptions.containsKey(ref)) {
      _documentSubscriptions[ref].add(subscriptionId);
      return Receipt(
        resolution: _documentData[ref],
        subscriptionId: subscriptionId,
      );
    }

    // save the subscription id
    _documentSubscriptions[ref] = [subscriptionId];

    // cache the current resolution
    final resolution = DocumentResolution.fetching(ref);
    _documentData[ref] = resolution;

    // subscribe to changes
    _documentSnapshotStreamSubscriptions[ref] = _store
        .document(ref.path)
        .snapshots()
        .listen(_onDocumentSnapshot(ref, subscriptionId));

    // fetch the data
    documentRef
        .get()
        .then(_onNewDocumentSnapshot(ref, subscriptionId))
        .catchError(_onDocumentFail(ref));

    return Receipt(
      resolution: resolution,
      subscriptionId: subscriptionId,
    );
  }

  void checkinDocument<T extends Path>(int subscriptionId) {
    final ref = _documentSubscriptionReferenceLookup.remove(subscriptionId);
    _documentSubscriptions[ref].remove(subscriptionId);
    if (_documentSubscriptions[ref].isEmpty) {
      _documentSubscriptions.remove(ref);
      _documentSnapshotStreamSubscriptions.remove(ref).cancel();
      _documentData.remove(ref);
    }
  }

  Future<void> create<T extends Path>(T data, StructuredSerializer serializer) {
    _setDocumentData(
        Reference(path: data.path), DocumentResolution.creating(data));
    return _store
        .document(data.path)
        .setData(_allSerializers.serializeWith(serializer, data));
  }

  Future<void> update<T extends Path>(T data, StructuredSerializer serializer) {
    _setDocumentData(
        Reference(path: data.path), DocumentResolution.dirty(data));
    return _store
        .document(data.path)
        .updateData(_allSerializers.serializeWith(serializer, data));
  }

  Future<void> delete<T extends Path>(T data) {
    _setDocumentData(
        Reference(path: data.path), DocumentResolution.deleting(data));
    return _store.document(data.path).delete();
  }

  void _setDocumentData(Reference ref, DocumentResolution resolution) {
    _documentData[ref] = resolution;
    _changeController.add(null);
  }

  void _setCollectionData(int subscriptionId, CollectionResolution resolution) {
    _collectionData[subscriptionId] = resolution;
    _changeController.add(null);
  }

  void dispose() {
    _changeController.close();
  }

  void Function(DocumentSnapshot) _onNewDocumentSnapshot(
          Reference ref, int subscriptionId) =>
      (DocumentSnapshot snapshot) {
        if (!_documentData.containsKey(ref)) {
          _setDocumentData(
            ref,
            _allSerializers.serializeWith(
                _serializers[subscriptionId], snapshot.data),
          );
        }
      };

  void Function(DocumentSnapshot) _onDocumentSnapshot(
          Reference ref, int subscriptionId) =>
      (DocumentSnapshot snapshot) {
        _setDocumentData(
          ref,
          _allSerializers.serializeWith(
              _serializers[subscriptionId], snapshot.data),
        );
      };

  void Function(Object error) _onDocumentFail(Reference ref) => (Object error) {
        _documentData[ref] = DocumentResolution.notFound(ref);
      };

  void Function(QuerySnapshot) _onNewQuerySnapshot(
          Reference ref, int subscriptionId) =>
      (QuerySnapshot snapshot) {
        if (!_collectionData.containsKey(ref)) {
          final datas = snapshot.documents.map(
            (d) => _allSerializers.deserializeWith(
                _serializers[subscriptionId], d),
          );

          _setCollectionData(
            subscriptionId,
            CollectionResolution.resolved(
              Items(
                items: datas,
                path: ref.path,
                nextStart: Option.some(datas.last),
              ),
            ),
          );
        }
      };

  void Function(QuerySnapshot) _onQuerySnapshot(
          Reference ref, int subscriptionId) =>
      (QuerySnapshot snapshot) {
        final datas = snapshot.documents.map(
          (d) =>
              _allSerializers.deserializeWith(_serializers[subscriptionId], d),
        );

        _setCollectionData(
          subscriptionId,
          CollectionResolution.resolved(
            Items(
              items: datas,
              path: ref.path,
              nextStart: Option.some(datas.last),
            ),
          ),
        );
      };

  void Function(Object error) _onQueryFail(Reference ref, int subscriptionId) =>
      (Object error) {
        _collectionData[subscriptionId] = CollectionResolution.notFound(ref);
      };
}
