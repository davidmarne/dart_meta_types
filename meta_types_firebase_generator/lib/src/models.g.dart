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
      @required bool isRenamed,
      Option<String> parent})
      : _type = type,
        assert(type != null),
        _documentMetaType = documentMetaType,
        assert(documentMetaType != null),
        _name = name,
        assert(name != null),
        _subcollections = subcollections,
        assert(subcollections != null),
        _isRenamed = isRenamed,
        assert(isRenamed != null),
        _parent = parent;

  final ParameterizedType _type;

  final MetaSeal _documentMetaType;

  final String _name;

  final Iterable<Collection> _subcollections;

  final bool _isRenamed;

  final Option<String> _parent;

  @override
  ParameterizedType get type {
    return _type;
  }

  @override
  MetaSeal get documentMetaType {
    return _documentMetaType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  Iterable<Collection> get subcollections {
    return _subcollections;
  }

  @override
  bool get isRenamed {
    return _isRenamed;
  }

  @override
  Option<String> get parent {
    return _parent ?? super.parent;
  }

  Collection copy(
      {ParameterizedType type,
      MetaSeal documentMetaType,
      String name,
      Iterable<Collection> subcollections,
      bool isRenamed,
      Option<String> parent}) {
    return Collection(
      type: type ?? _type,
      documentMetaType: documentMetaType ?? _documentMetaType,
      name: name ?? _name,
      subcollections: subcollections ?? _subcollections,
      isRenamed: isRenamed ?? _isRenamed,
      parent: parent ?? _parent,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _type.hashCode), _documentMetaType.hashCode),
                  _name.hashCode),
              _subcollections.hashCode),
          _isRenamed.hashCode),
      parent.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Collection) return false;
    return type == other.type &&
        documentMetaType == other.documentMetaType &&
        name == other.name &&
        subcollections == other.subcollections &&
        isRenamed == other.isRenamed &&
        parent == other.parent;
  }

  @override
  String toString() {
    return 'Collection (type: $type, documentMetaType: $documentMetaType, name: $name, subcollections: $subcollections, isRenamed: $isRenamed, parent: $parent)';
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

  @override
  String get name {
    return _name;
  }

  @override
  Iterable<Collection> get rootCollections {
    return _rootCollections;
  }

  @override
  Iterable<Collection> get collections {
    return _collections;
  }

  @override
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

  @override
  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _name.hashCode), _rootCollections.hashCode),
          _collections.hashCode),
      _documentMetaTypes.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Schema) return false;
    return name == other.name &&
        rootCollections == other.rootCollections &&
        collections == other.collections &&
        documentMetaTypes == other.documentMetaTypes;
  }

  @override
  String toString() {
    return 'Schema (name: $name, rootCollections: $rootCollections, collections: $collections, documentMetaTypes: $documentMetaTypes)';
  }
}

class Context extends $Context {
  Context(
      {@required Environment environment,
      @required Schema schema,
      @required MetaClassCache metaCache})
      : _environment = environment,
        assert(environment != null),
        _schema = schema,
        assert(schema != null),
        _metaCache = metaCache,
        assert(metaCache != null);

  final Environment _environment;

  final Schema _schema;

  final MetaClassCache _metaCache;

  @override
  Environment get environment {
    return _environment;
  }

  @override
  Schema get schema {
    return _schema;
  }

  @override
  MetaClassCache get metaCache {
    return _metaCache;
  }

  Context copy(
      {Environment environment, Schema schema, MetaClassCache metaCache}) {
    return Context(
      environment: environment ?? _environment,
      schema: schema ?? _schema,
      metaCache: metaCache ?? _metaCache,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc(0, _environment.hashCode), _schema.hashCode),
      _metaCache.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Context) return false;
    return environment == other.environment &&
        schema == other.schema &&
        metaCache == other.metaCache;
  }

  @override
  String toString() {
    return 'Context (environment: $environment, schema: $schema, metaCache: $metaCache)';
  }
}

class Environment<EGN> extends $Environment {
  const Environment._(this._value) : assert(_value != null);

  final EGN _value;

  static const Environment<String> flutter =
      Environment._($Environment.flutter);

  static const Environment<String> cloudFunctions =
      Environment._($Environment.cloudFunctions);

  static const values = <Environment>[
    Environment.flutter,
    Environment.cloudFunctions
  ];

  EGN get value => _value;
  int get ordinal => values.indexOf(this);
  bool get isFlutter {
    return flutter == this;
  }

  bool get isCloudFunctions {
    return cloudFunctions == this;
  }

  void whenFlutter(void Function(String) handler) {
    if (Environment.flutter == this) {
      handler(Environment.flutter._value);
    }
  }

  void whenCloudFunctions(void Function(String) handler) {
    if (Environment.cloudFunctions == this) {
      handler(Environment.cloudFunctions._value);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(String) flutter,
      @required WHEN Function(String) cloudFunctions}) {
    if (this == Environment.flutter) {
      return flutter(Environment.flutter._value);
    }
    if (this == Environment.cloudFunctions) {
      return cloudFunctions(Environment.cloudFunctions._value);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(String) flutter,
      WHEN Function(String) cloudFunctions}) {
    if (this == Environment.flutter) {
      if (flutter != null) {
        return flutter(Environment.flutter._value);
      } else {
        return otherwise();
      }
    }
    if (this == Environment.cloudFunctions) {
      if (cloudFunctions != null) {
        return cloudFunctions(Environment.cloudFunctions._value);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc(_value.hashCode, 'Environment'.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Environment) return false;
    return _value == other._value;
  }

  @override
  String toString() {
    return 'Environment ($_value)';
  }
}
