import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';

part 'resolutions.g.dart';

@data
abstract class $Document<T> {
  String get id;
  T get data;
}

@sum
abstract class $DocumentResolution<T> {
  const $DocumentResolution();

  void get fetching;
  Document<T> get dirty;
  Document<T> get resolved;
  void get deleting;
  void get denied;
  void get notFound;
}

@sum
abstract class $CollectionResolution<T> {
  const $CollectionResolution();

  void get fetching;
  BuiltList<DocumentResolution<T>> get resolved;
  BuiltList<DocumentResolution<T>> get dirty;
  void get deleting;
  void get denied;
  void get notFound;
}
