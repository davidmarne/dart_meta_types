export 'src/client.dart';
export 'src/client_hook.dart';
export 'src/collection_hook.dart';
export 'src/document_hook.dart';

// import 'dart:async';
// import 'package:meta/meta.dart';
// import 'package:meta_types/meta_types.dart';
// import 'package:meta_types/meta_types_models.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:built_value/serializer.dart'
//     show StructuredSerializer, Serializers;

// part 'meta_types_firebase_flutter_hook.g.dart';

// @DataClass()
// abstract class $Reference implements Path {}

// @DataClass(isInterface: true)
// abstract class Path {
//   String get path;
// }

// @SealedClass()
// abstract class $DocumentResolution<T extends Path> implements Path {
//   Reference get fetching;
//   T get creating;
//   T get dirty;
//   T get resolved;
//   T get deleting;
//   Reference get denied;
//   Reference get notFound;
// }

// @SealedClass()
// abstract class $CollectionResolution<T extends Path> implements Path {
//   Reference get fetching;
//   AppendingItem<T> get appendingItem;
//   PrependingItem<T> get prependingItem;
//   RemovingItem<T> get removingItem;
//   Items<T> get resolved;
//   Items<T> get deleting;
//   Reference get denied;
//   Reference get notFound;
// }

// @DataClass()
// abstract class $Items<T extends Path> implements Path {
//   BuiltList<T> get items;
//   Option<T> get nextStart;
// }

// @DataClass()
// abstract class $AppendingItem<T extends Path> implements $Items<T> {
//   T get appending;
// }

// @DataClass()
// abstract class $PrependingItem<T extends Path> implements $Items<T> {
//   T get prepending;
// }

// @DataClass()
// abstract class $RemovingItem<T extends Path> implements $Items<T> {
//   T get removing;
// }

// @DataClass()
// abstract class $Receipt<T extends Path> {
//   int get subscriptionId;
//   T get resolution;
// }

// abstract class FirebaseClient {
//   // Future<void> create<T extends Path>(T data);
//   // Future<void> update<T extends Path>(T data);
//   // Future<void> delete<T extends Path>(T data);
//   factory FirebaseClient(Firestore store, Serializers serializers) =>
//       new _FirebaseClient(store, serializers);
// }

// class _FirebaseClient implements FirebaseClient {
//   final Firestore _store;
//   final Serializers _allSerializers;

//   final _serializers = <int, StructuredSerializer>{};

//   final _documentSubscriptionReferenceLookup = <int, Reference>{};
//   final _documentSubscriptions = <Reference, List<int>>{};
//   final _documentData = <Reference, DocumentResolution>{};
//   final _documentSnapshotStreamSubscriptions =
//       <Reference, StreamSubscription>{};

//   final _collectionData = <int, CollectionResolution>{};
//   final _collectionSnapshotStreamSubscriptions = <int, StreamSubscription>{};

//   var _nextId = 0;

//   final _changeController = StreamController<void>.broadcast();

//   _FirebaseClient(this._store, this._allSerializers);

//   Stream<void> get change => _changeController.stream;

//   DocumentResolution readDocument(int subscriptionId) {
//     return _documentData[_documentSnapshotStreamSubscriptions[subscriptionId]];
//   }

//   CollectionResolution readCollection(int subscriptionId) {
//     return _collectionData[
//         _collectionSnapshotStreamSubscriptions[subscriptionId]];
//   }

//   Receipt checkoutCollection<T extends Path>(
//       Reference ref, StructuredSerializer serializer) {
//     final subscriptionId = _nextId++;

//     // save the serializer
//     _serializers[subscriptionId] = serializer;

//     // cache the current resolution
//     final resolution = CollectionResolution.fetching(ref);
//     _collectionData[subscriptionId] = resolution;
//     _documentSubscriptionReferenceLookup[subscriptionId] = ref;

//     // subscribe to changes
//     _collectionSnapshotStreamSubscriptions[subscriptionId] = _store
//         .collection(ref.path)
//         .snapshots()
//         .listen(_onQuerySnapshot(ref, subscriptionId));

//     // fetch the data
//     _store
//         .collection(ref.path)
//         .getDocuments()
//         .then(_onNewQuerySnapshot(ref, subscriptionId))
//         .catchError(_onQueryFail(ref, subscriptionId));

//     return Receipt(
//       resolution: resolution,
//       subscriptionId: subscriptionId,
//     );
//   }

//   void checkinCollection(int subscriptionId) {
//     _collectionData.remove(subscriptionId);
//     _collectionSnapshotStreamSubscriptions.remove(subscriptionId).cancel();
//     _serializers.remove(subscriptionId);
//   }

//   Receipt checkoutDocument<T extends Path>(
//       Reference ref, StructuredSerializer serializer) {
//     final subscriptionId = _nextId++;
//     // save the serializer
//     _serializers[subscriptionId] = serializer;

//     // if this doc is already subscribed to save
//     // off the new subscription and return the cached value.
//     if (_documentSubscriptions.containsKey(ref)) {
//       _documentSubscriptions[ref].add(subscriptionId);
//       return Receipt(
//         resolution: _documentData[ref],
//         subscriptionId: subscriptionId,
//       );
//     }

//     // save the subscription id
//     _documentSubscriptions[ref] = [subscriptionId];

//     // cache the current resolution
//     final resolution = DocumentResolution.fetching(ref);
//     _documentData[ref] = resolution;

//     // subscribe to changes
//     _documentSnapshotStreamSubscriptions[ref] = _store
//         .document(ref.path)
//         .snapshots()
//         .listen(_onDocumentSnapshot(ref, subscriptionId));

//     // fetch the data
//     _store
//         .document(ref.path)
//         .get()
//         .then(_onNewDocumentSnapshot(ref, subscriptionId))
//         .catchError(_onDocumentFail(ref));

//     return Receipt(
//       resolution: resolution,
//       subscriptionId: subscriptionId,
//     );
//   }

//   void checkinDocument<T extends Path>(int subscriptionId) {
//     final ref = _documentSubscriptionReferenceLookup.remove(subscriptionId);
//     _documentSubscriptions[ref].remove(subscriptionId);
//     if (_documentSubscriptions[ref].isEmpty) {
//       _documentSubscriptions.remove(ref);
//       _documentSnapshotStreamSubscriptions.remove(ref).cancel();
//       _documentData.remove(ref);
//     }
//   }

//   Future<void> create<T extends Path>(T data, StructuredSerializer serializer) {
//     _setDocumentData(
//         Reference(path: data.path), DocumentResolution.creating(data));
//     return _store
//         .document(data.path)
//         .setData(_allSerializers.serializeWith(serializer, data));
//   }

//   Future<void> update<T extends Path>(T data, StructuredSerializer serializer) {
//     _setDocumentData(
//         Reference(path: data.path), DocumentResolution.dirty(data));
//     return _store
//         .document(data.path)
//         .updateData(_allSerializers.serializeWith(serializer, data));
//   }

//   Future<void> delete<T extends Path>(T data) {
//     _setDocumentData(
//         Reference(path: data.path), DocumentResolution.deleting(data));
//     return _store.document(data.path).delete();
//   }

//   void _setDocumentData(Reference ref, DocumentResolution resolution) {
//     _documentData[ref] = resolution;
//     _changeController.add(null);
//   }

//   void _setCollectionData(int subscriptionId, CollectionResolution resolution) {
//     _collectionData[subscriptionId] = resolution;
//     _changeController.add(null);
//   }

//   void dispose() {
//     _changeController.close();
//   }

//   void Function(DocumentSnapshot) _onNewDocumentSnapshot(
//           Reference ref, int subscriptionId) =>
//       (DocumentSnapshot snapshot) {
//         if (!_documentData.containsKey(ref)) {
//           _setDocumentData(
//             ref,
//             _allSerializers.serializeWith(
//                 _serializers[subscriptionId], snapshot.data),
//           );
//         }
//       };

//   void Function(DocumentSnapshot) _onDocumentSnapshot(
//           Reference ref, int subscriptionId) =>
//       (DocumentSnapshot snapshot) {
//         _setDocumentData(
//           ref,
//           _allSerializers.serializeWith(
//               _serializers[subscriptionId], snapshot.data),
//         );
//       };

//   void Function(Object error) _onDocumentFail(Reference ref) => (Object error) {
//         _documentData[ref] = DocumentResolution.notFound(ref);
//       };

//   void Function(QuerySnapshot) _onNewQuerySnapshot(
//           Reference ref, int subscriptionId) =>
//       (QuerySnapshot snapshot) {
//         if (!_collectionData.containsKey(ref)) {
//           final datas = snapshot.documents.map(
//             (d) => _allSerializers.deserializeWith(
//                 _serializers[subscriptionId], d),
//           );

//           _setCollectionData(
//             subscriptionId,
//             CollectionResolution.resolved(
//               Items(
//                 items: datas,
//                 path: ref.path,
//                 nextStart: Option.some(datas.last),
//               ),
//             ),
//           );
//         }
//       };

//   void Function(QuerySnapshot) _onQuerySnapshot(
//           Reference ref, int subscriptionId) =>
//       (QuerySnapshot snapshot) {
//         final datas = snapshot.documents.map(
//           (d) =>
//               _allSerializers.deserializeWith(_serializers[subscriptionId], d),
//         );

//         _setCollectionData(
//           subscriptionId,
//           CollectionResolution.resolved(
//             Items(
//               items: datas,
//               path: ref.path,
//               nextStart: Option.some(datas.last),
//             ),
//           ),
//         );
//       };

//   void Function(Object error) _onQueryFail(Reference ref, int subscriptionId) =>
//       (Object error) {
//         _collectionData[subscriptionId] = CollectionResolution.notFound(ref);
//       };
// }

// @DataClass()
// abstract class $Resolutions<T extends Path> {
//   BuiltMap<Reference, T> get _data;
//   T operator [](Reference ref) => _data[ref];

//   @computed
//   Iterable<T> get datas => _data.values;
// }

// DocumentResolution<T> useFirebaseDocument<T extends Path>(
//     Reference ref, StructuredSerializer serializer) {
//   return useFirebaseDocuments<T>([ref], serializer)[ref];
// }

// Resolutions<DocumentResolution<T>> useFirebaseDocuments<T extends Path>(
//     Iterable<Reference> refs, StructuredSerializer serializer) {
//   return Hook.use(_FirebaseDocumentHook(refs: refs, serializer: serializer));
// }

// class _FirebaseDocumentHook<T extends Path>
//     extends Hook<Resolutions<DocumentResolution<T>>> {
//   final Iterable<Reference> refs;
//   final StructuredSerializer serializer;

//   const _FirebaseDocumentHook({this.refs, this.serializer});

//   @override
//   _FirebaseDocumentHookState<T> createState() => _FirebaseDocumentHookState();
// }

// class _FirebaseDocumentHookState<T extends Path> extends HookState<
//     Resolutions<DocumentResolution<T>>, _FirebaseDocumentHook<T>> {
//   Resolutions<DocumentResolution<T>> _state;
//   Map<Reference, int> _subs;
//   StreamSubscription _firebaseClientChangesSub;
//   _FirebaseClient _client;

//   @override
//   void initHook() {
//     super.initHook();
//     _state = _checkoutDocuments();
//     _firebaseClientChangesSub = _client.change.listen((_) {
//       final next = _recalculateState();
//       if (_state != next) {
//         _state = next;
//         setState(() {});
//       }
//     });
//   }

//   @override
//   void didUpdateHook(_FirebaseDocumentHook<T> old) {
//     // unsub to old refs
//     final subsToRemove = _subs.entries.where((e) => !hook.refs.contains(e.key));
//     subsToRemove.forEach((e) {
//       _client.checkinDocument(e.value);
//       _subs.remove(e.key);
//     });

//     // sub to new refs
//     final subsToObtain = hook.refs.where((ref) => !_subs.containsKey(ref));
//     subsToObtain.forEach((ref) {
//       _subs[ref] =
//           _client.checkoutDocument(ref, hook.serializer).subscriptionId;
//     });
//   }

//   @override
//   void dispose() {
//     _firebaseClientChangesSub.cancel();
//     _subs.values.forEach(_client.checkinDocument);
//   }

//   @override
//   build(BuildContext context) {
//     return _state;
//   }

//   Resolutions<DocumentResolution<T>> _checkoutDocuments() => Resolutions(
//         data: BuiltMap.build((b) {
//           hook.refs.forEach((ref) {
//             final receipt = _client.checkoutDocument(ref, hook.serializer);
//             b[ref] = receipt.resolution;
//             _subs[ref] = receipt.subscriptionId;
//           });
//         }),
//       );

//   Resolutions<DocumentResolution<T>> _recalculateState() => Resolutions(
//         data: BuiltMap.build((b) {
//           hook.refs.forEach((ref) {
//             b[ref] = _client.readDocument(_subs[ref]);
//           });
//         }),
//       );
// }

// FirebaseClient useFirebaseClient() {
//   return Hook.use(_FirebaseClientHook());
// }

// class _FirebaseClientHook extends Hook<FirebaseClient> {
//   final Iterable<Reference> refs;
//   final StructuredSerializer serializer;

//   const _FirebaseClientHook({this.refs, this.serializer});

//   @override
//   _FirebaseClientHookState createState() => _FirebaseClientHookState();
// }

// class _FirebaseClientHookState
//     extends HookState<FirebaseClient, _FirebaseClientHook> {
//   @override
//   build(BuildContext context) {
//     return null; // TODO from context
//   }
// }

// CollectionResolution<T> useFirebaseCollection<T extends Path>(
//     Reference ref, StructuredSerializer serializer) {
//   return useFirebaseCollections<T>([ref], serializer)[ref];
// }

// Resolutions<CollectionResolution<T>> useFirebaseCollections<T extends Path>(
//     Iterable<Reference> refs, StructuredSerializer serializer) {
//   return Hook.use(_FirebaseCollectionHook(refs: refs, serializer: serializer));
// }

// class _FirebaseCollectionHook<T extends Path>
//     extends Hook<Resolutions<CollectionResolution<T>>> {
//   final Iterable<Reference> refs;
//   final StructuredSerializer serializer;

//   const _FirebaseCollectionHook({this.refs, this.serializer});

//   @override
//   _FirebaseCollectionHookState<T> createState() =>
//       _FirebaseCollectionHookState();
// }

// class _FirebaseCollectionHookState<T extends Path> extends HookState<
//     Resolutions<CollectionResolution<T>>, _FirebaseCollectionHook<T>> {
//   Resolutions<CollectionResolution<T>> _state;
//   Map<Reference, int> _subs;
//   StreamSubscription _firebaseClientChangesSub;
//   _FirebaseClient _client;

//   @override
//   void initHook() {
//     super.initHook();
//     _state = _checkoutCollections();
//     _firebaseClientChangesSub = _client.change.listen((_) {
//       final next = _recalculateState();
//       if (_state != next) {
//         _state = next;
//         setState(() {});
//       }
//     });
//   }

//   @override
//   void didUpdateHook(_FirebaseCollectionHook<T> old) {
//     // unsub to old refs
//     final subsToRemove = _subs.entries.where((e) => !hook.refs.contains(e.key));
//     subsToRemove.forEach((e) {
//       _client.checkinCollection(e.value);
//       _subs.remove(e.key);
//     });

//     // sub to new refs
//     final subsToObtain = hook.refs.where((ref) => !_subs.containsKey(ref));
//     subsToObtain.forEach((ref) {
//       _subs[ref] =
//           _client.checkoutCollection(ref, hook.serializer).subscriptionId;
//     });
//   }

//   @override
//   void dispose() {
//     _firebaseClientChangesSub.cancel();
//     _subs.values.forEach(_client.checkinCollection);
//   }

//   @override
//   build(BuildContext context) {
//     return _state;
//   }

//   Resolutions<CollectionResolution<T>> _checkoutCollections() => Resolutions(
//         data: BuiltMap.build((b) {
//           hook.refs.forEach((ref) {
//             final receipt = _client.checkoutCollection(ref, hook.serializer);
//             b[ref] = receipt.resolution;
//             _subs[ref] = receipt.subscriptionId;
//           });
//         }),
//       );

//   Resolutions<CollectionResolution<T>> _recalculateState() => Resolutions(
//         data: BuiltMap.build((b) {
//           hook.refs.forEach((ref) {
//             b[ref] = _client.readCollection(_subs[ref]);
//           });
//         }),
//       );
// }
