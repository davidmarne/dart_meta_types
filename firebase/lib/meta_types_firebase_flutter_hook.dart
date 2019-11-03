// import 'dart:async';
// import 'package:meta/meta.dart';
// import 'package:meta_types/meta_types.dart';
// import 'package:built_collection/built_collection.dart';
export 'src/m2.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// part 'meta_types_firebase_flutter_hook.g.dart';

// const creating = "creating";

// typedef Deserialize = T Function<T>(Object);

// @DataClass()
// abstract class $Doc {
//   String get id;
//   String get path;
// }

// @SealedClass()
// abstract class $Resolution<T extends Doc> implements Doc {
//   DocReference get fetching;
//   T get creating;
//   T get dirty;
//   T get resolved;
//   T get deleting;
//   DocReference get denied;
//   DocReference get notFound;
// }

// @DataClass()
// abstract class $DocReference implements Doc {}

// @DataClass()
// abstract class $Subscription<T extends Doc> {
//   int get id;
//   String get path;
// }

// class FirebaseClient {
//   Firestore _store;
//   final _deserializers = <String, Deserialize>{};
//   final _subs = <String, List<Subscription>>{};
//   final _data = <String, Object>{};
//   final _changeController = StreamController<void>.broadcast();

//   var _nextId = 0;

//   FirebaseClient();

//   Subscription<T> checkout<T extends Doc>(
//       String path, Deserialize deserializer) {
//     final sub = Subscription(id: _nextId++, path: path);
//     _deserializers[path] = deserializer;
//     if (_subs.containsKey(path)) {
//       _subs[path].add(sub);
//     } else {
//       _data[path] = Resolution.fetching();
//       _subs[path] = [sub];

//       _store.doc(path)
//         ..onSnapshot.listen(_onDoc)
//         ..get().then(_onDoc).catchError(_onDocFail);
//     }
//     return sub;
//   }

//   Future _onDoc(DocumentSnapshot snapshot) {
//     return _data[snapshot.ref.path] =
//         _deserializers[snapshot.ref.path](snapshot.data());
//   }

//   Future _onDocFail(String path) {
//     return _data[path] = Resolution.notFound();
//   }

//   Resolution<T> read<T extends Doc>(Subscription<T> subscription) {
//     return _data[subscription.path];
//   }

//   void checkin<T extends Doc>(Subscription<T> subscription) {
//     _subs[subscription.path].remove(subscription);
//     if (_subs[subscription.path].isEmpty) {
//       _subs.remove(subscription.path);
//       _data.remove(subscription.path);
//     }
//   }

//   void create<T extends Doc>(T data) {
//     _data[data.path] = Resolution.creating(data);
//   }

//   void update<T extends Doc>(T data) {
//     _data[data.path] = Resolution.dirty(data);
//   }

//   void delete<T extends Doc>(T data) {
//     _data[data.path] = Resolution.deleting(data);
//   }

//   Stream<void> get change => _changeController.stream;
//   void dispose() {
//     _changeController.close();
//   }
// }

// Resolution<T> useFirebaseDoc<T extends Doc>(
//     String path, Deserialize deserializer) {
//   return useFirebaseDocs<T>([path], deserializer)[path];
// }

// BuiltMap<String, Resolution<T>> useFirebaseDocs<T extends Doc>(
//     Iterable<String> paths, Deserialize deserializer) {
//   return Hook.use(_FirebaseHook(paths: paths, deserializer: deserializer));
// }

// class _FirebaseHook<T extends Doc>
//     extends Hook<BuiltMap<String, Resolution<T>>> {
//   final Iterable<String> paths;
//   final Deserialize deserializer;

//   const _FirebaseHook({this.paths, this.deserializer});

//   @override
//   _FirebaseHookState<T> createState() => _FirebaseHookState();
// }

// class _FirebaseHookState<T extends Doc>
//     extends HookState<BuiltMap<String, Resolution<T>>, _FirebaseHook<T>> {
//   BuiltMap<String, Resolution<T>> _state;
//   Map<String, Subscription<T>> _subs;
//   StreamSubscription _sub;
//   FirebaseClient _client;

//   @override
//   void initHook() {
//     super.initHook();
//     _state = _calcState();
//     _sub = _client.change.listen((_) {
//       final next = _calcState();
//       if (_state != next) {
//         _state = next;
//         setState(() {});
//       }
//     });
//   }

//   @override
//   void didUpdateHook(_FirebaseHook<T> old) {
//     // unsub to old paths
//     final subsToRemove =
//         _subs.entries.where((e) => !hook.paths.contains(e.key));
//     subsToRemove.forEach((e) {
//       _client.checkin(e.value);
//       _subs.remove(e.key);
//     });

//     // sub to new paths
//     final subsToObtain = hook.paths.where((p) => !_subs.containsKey(p));
//     subsToObtain.forEach((path) {
//       _subs[path] = _client.checkout(path, hook.deserializer);
//     });
//   }

//   @override
//   void dispose() {
//     _sub.cancel();
//     _subs.values.forEach(_client.checkin);
//   }

//   @override
//   build(BuildContext context) {
//     return _state;
//   }

//   BuiltMap<String, Resolution<T>> _calcState() => BuiltMap.build((b) {
//         hook.paths.forEach((p) {
//           b[p] = _client.read(_subs[p]);
//         });
//       });
// }
