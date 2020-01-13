import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';

part 'meta_types_firebase.g.dart';

class Schema {
  const Schema._();
}

const schema = Schema._();

class DocumentField {
  final bool isService;
  const DocumentField._(this.isService);
}

/// if service field has default value it will
/// be ommited from creator and updater
///
/// if service field has no default value it will
/// only be ommited by the updater
const serviceField = DocumentField._(true);

@sum
abstract class $DocumentResolution<T> {
  const $DocumentResolution();

  void get fetching;
  T get dirty;
  T get resolved;
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

class Collection<T> {
  final String name;
  final Iterable<Collection> subcollections;
  const Collection({this.name = '', this.subcollections = const []});
}
