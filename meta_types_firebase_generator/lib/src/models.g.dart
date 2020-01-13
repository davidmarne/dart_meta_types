// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Collection extends $Collection {
  Collection(
      {@required ParameterizedType type,
      @required MetaSeal documentMetaType,
      @required String name,
      @required Iterable<Collection> subcollections,
      Option<String> parent})
      : _type = type,
        assert(type != null),
        _documentMetaType = documentMetaType,
        assert(documentMetaType != null),
        _name = name,
        assert(name != null),
        _subcollections = subcollections,
        assert(subcollections != null),
        _parent = parent,
        assert(parent != null);

  final ParameterizedType _type;

  final MetaSeal _documentMetaType;

  final String _name;

  final Iterable<Collection> _subcollections;

  final Option<String> _parent;

  ParameterizedType get type {
    return _type;
  }

  MetaSeal get documentMetaType {
    return _documentMetaType;
  }

  String get name {
    return _name;
  }

  Iterable<Collection> get subcollections {
    return _subcollections;
  }

  Option<String> get parent {
    return _parent ?? super.parent;
  }

  Collection copy(
      {ParameterizedType type,
      MetaSeal documentMetaType,
      String name,
      Iterable<Collection> subcollections,
      Option<String> parent}) {
    return Collection(
      type: type ?? _type,
      documentMetaType: documentMetaType ?? _documentMetaType,
      name: name ?? _name,
      subcollections: subcollections ?? _subcollections,
      parent: parent ?? _parent,
    );
  }

  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _type.hashCode), _documentMetaType.hashCode),
              _name.hashCode),
          _subcollections.hashCode),
      _parent.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Collection) return false;
    return type == other.type &&
        documentMetaType == other.documentMetaType &&
        name == other.name &&
        subcollections == other.subcollections &&
        parent == other.parent;
  }

  String toString() {
    return "Collection (type: $type, documentMetaType: $documentMetaType, name: $name, subcollections: $subcollections, parent: $parent)";
  }
}

class Schema extends $Schema {
  Schema(
      {@required String name,
      @required Iterable<Collection> rootCollections,
      @required Iterable<Collection> collections,
      @required Iterable<MetaSeal> documentMetaTypes})
      : _name = name,
        assert(name != null),
        _rootCollections = rootCollections,
        assert(rootCollections != null),
        _collections = collections,
        assert(collections != null),
        _documentMetaTypes = documentMetaTypes,
        assert(documentMetaTypes != null);

  final String _name;

  final Iterable<Collection> _rootCollections;

  final Iterable<Collection> _collections;

  final Iterable<MetaSeal> _documentMetaTypes;

  String get name {
    return _name;
  }

  Iterable<Collection> get rootCollections {
    return _rootCollections;
  }

  Iterable<Collection> get collections {
    return _collections;
  }

  Iterable<MetaSeal> get documentMetaTypes {
    return _documentMetaTypes;
  }

  Schema copy(
      {String name,
      Iterable<Collection> rootCollections,
      Iterable<Collection> collections,
      Iterable<MetaSeal> documentMetaTypes}) {
    return Schema(
      name: name ?? _name,
      rootCollections: rootCollections ?? _rootCollections,
      collections: collections ?? _collections,
      documentMetaTypes: documentMetaTypes ?? _documentMetaTypes,
    );
  }

  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _name.hashCode), _rootCollections.hashCode),
          _collections.hashCode),
      _documentMetaTypes.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Schema) return false;
    return name == other.name &&
        rootCollections == other.rootCollections &&
        collections == other.collections &&
        documentMetaTypes == other.documentMetaTypes;
  }

  String toString() {
    return "Schema (name: $name, rootCollections: $rootCollections, collections: $collections, documentMetaTypes: $documentMetaTypes)";
  }
}

class Context extends $Context {
  Context({@required Schema schema, @required MetaClassCache metaCache})
      : _schema = schema,
        assert(schema != null),
        _metaCache = metaCache,
        assert(metaCache != null);

  final Schema _schema;

  final MetaClassCache _metaCache;

  Schema get schema {
    return _schema;
  }

  MetaClassCache get metaCache {
    return _metaCache;
  }

  Context copy({Schema schema, MetaClassCache metaCache}) {
    return Context(
      schema: schema ?? _schema,
      metaCache: metaCache ?? _metaCache,
    );
  }

  int get hashCode => $jf($jc($jc(0, _schema.hashCode), _metaCache.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Context) return false;
    return schema == other.schema && metaCache == other.metaCache;
  }

  String toString() {
    return "Context (schema: $schema, metaCache: $metaCache)";
  }
}
