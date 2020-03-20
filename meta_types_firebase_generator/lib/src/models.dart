import 'package:analyzer/dart/element/type.dart';
import 'package:meta_types/core.dart';
import 'package:meta_types/meta_types.dart';
import 'package:meta_types_generator/api.dart';

part 'models.g.dart';

@data
abstract class $Collection {
  ParameterizedType get type;
  MetaSeal get documentMetaType;
  String get name;
  Iterable<Collection> get subcollections;
  Option<String> get parent => const Option.none();
}

@data
abstract class $Schema {
  String get name;
  Iterable<Collection> get rootCollections;
  Iterable<Collection> get collections;
  Iterable<MetaSeal> get documentMetaTypes;
}

@data
abstract class $Context {
  Schema get schema;
  MetaClassCache get metaCache;
}