import 'dart:async';
import 'package:meta/meta.dart';
import 'package:meta_types/meta_types.dart';
import 'package:meta_types_redux/meta_types_redux.dart';
import 'package:meta_types_firebase_redux/meta_types_firebase_redux.dart';
import 'package:firebase/firestore.dart';

part 'subscriber.g.dart';

@DataClass()
abstract class $SubscriptionRequest<T extends $Doc> {
  $Path get path;
  // FromJson<T> get fromJson;
}

@DataClass()
abstract class $Subscription<T extends $Doc> {
  $Path get path;
  // FromJson<T> get fromJson;

}


// void foo(FirebaseClient c) => z

typedef Iterable<SubscriptionRequest> Populate<T>(T model);
typedef T FromJson<T>(Map<String, dynamic> model);

abstract class Subscriber {
  Future<int> subscribe<T>({
    @required SubscriptionRequest req,
  });

  Future<Iterable<int>> subscribeAll({
    @required Iterable<SubscriptionRequest> req,
  });

  Future<void> unsubscribe({
    @required int subscription,
  });

  Future<void> unsubscribeAll({
    @required Iterable<int> subscriptions,
  });
}

abstract class FirebaseClient {
  final Firestore _firestore;
  final _subscriptions = <Path, StreamSubscription>{};
  final _subscriptionCounts = <Path, int>{};
  final _cache = <Path, Resolution>{};
  final _streamController = StreamController<void>.broadcast();

  FirebaseClient(this._firestore);

  Stream<void> get data => _streamController.stream;

  Resolution<T> read<T>({@required Path path}) {
    if (_cache.containsKey(path.path))
      return _cache[path.path] as Resolution<T>;
    return Resolution.unknownFactory(null);
  }

  Resolution<T> update<T>({
    @required T value,
    @required Path path,
  }) {
    final snapshot =
        await _firestore.doc('req.path').get().catchError(req.error);

    _streamController.add(null);
    return Resolution.dirtyFactory(value);
  }

  Resolution<T> create<T>({
    @required T value,
    @required Path path,
  }) async {
    req.creating(null);
    final snapshot =
        await _firestore.doc('req.path').get().catchError(req.error);

    _streamController.add(null);
    return Resolution.creatingFactory(value);
  }

  Future<Iterable<Subscription>> subscribe<T>({
    @required $SubscriptionRequest<T> req,
    Populate populate,
  }) async {
    req.fetching(null);
    final snapshot =
        await _firestore.doc('req.path').get().catchError(req.error);

    req.resolved(req.fromJson(snapshot.data()));
  }

  Future<Iterable<Subscription>> subscribeAll({
    @required Iterable<SubscriptionRequest> req,
    Populate populate,
  });

  Future<void> unsubscribe({
    @required Subscription subscription,
  });

  Future<void> unsubscribeAll({
    @required Iterable<Subscription> subscriptions,
  });
}
