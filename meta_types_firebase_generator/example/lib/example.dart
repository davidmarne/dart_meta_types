import 'package:meta_types_firebase/meta_types_firebase.dart';
import 'package:meta_types/meta_types.dart';
import 'package:meta_types_firebase_flutter/meta_types_firebase_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_collection/built_collection.dart';

part 'example.g.dart';

@schema
const exampleSchema = [
  Collection<$User>(),
  Collection<$Room>(
    subcollections: [
      Collection<$Message>(),
    ],
  ),
  Collection<$TestStuff<int>>(),
];

@data
@serializable
abstract class $User {
  const $User();
  String get name;
}

@data
@serializable
abstract class $Room {
  const $Room();
  String get name;
}

@data
@serializable
abstract class $Message {
  const $Message();
  User get user;
  String get message;
  DateTime get stamp;
}

@data
@serializable
abstract class $TestStuff<T> {
  const $TestStuff();
  int get integer;
  double get dubley;
  DateTime get date;
  BuiltMap<String, int> get map;
  BuiltList<int> get list;
  NestedData get data;
  NestedSum get sum;
  T get generic;
}

@data
@serializable
abstract class $NestedData {
  const $NestedData();
  int get a;
  int get b;
}

@sum
@serializable
abstract class $NestedSum {
  const $NestedSum();
  int get a;
  String get b;
}
