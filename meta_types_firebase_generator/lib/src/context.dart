import 'package:source_gen/source_gen.dart';
import 'package:meta_types_generator/api.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:meta_types/core.dart';
import 'package:meta_types/meta_types.dart';

import 'models.dart';

// TODO: hack
bool isFlutter = false;

Iterable<Context> readContexts(MetaClassCache metaCache, LibraryReader reader) {
  isFlutter =
      reader.element.importedLibraries.any((l) => l.name == 'cloud_firestore');
  return _loadSchemas(reader, metaCache).map(
    (schema) => Context(
      schema: schema,
      metaCache: metaCache,
      environment: reader.element.importedLibraries
              .any((l) => l.name == 'cloud_firestore')
          ? Environment.flutter
          : Environment.cloudFunctions,
    ),
  );
}

Iterable<Schema> _loadSchemas(LibraryReader reader, MetaClassCache metaCache) =>
    reader.allElements
        .where((c) =>
            c.metadata.any(_isSchema) &&
            c.kind == ElementKind.TOP_LEVEL_VARIABLE)
        .cast<TopLevelVariableElement>()
        .map((element) => _loadSchema(element, metaCache));

Schema _loadSchema(TopLevelVariableElement element, MetaClassCache metaCache) {
  final rootCollections = element.computeConstantValue().toListValue().map(
        (dartObject) => _loadCollection(
          dartObject,
          metaCache,
        ),
      );

  final collections = rootCollections.expand(_collections);

  return Schema(
    name: element.name,
    rootCollections: rootCollections,
    collections: collections,
    documentMetaTypes: _documentMetaTypes(metaCache, collections),
  );
}

Iterable<Collection> _collections(Collection collection) => [
      collection,
      ...collection.subcollections.map(_collections).expand((c) => c)
    ];

Iterable<MetaSeal> _documentMetaTypes(
        MetaClassCache metaCache, Iterable<Collection> collections) =>
    collections
        .map(
          (c) => _documentMetaTypesForCollection(metaCache, c.documentMetaType),
        )
        .expand((a) => a)
        .toSet();

Iterable<MetaSeal> _documentMetaTypesForCollection(
        MetaClassCache metaCache, MetaSeal meta) =>
    [
      meta,
      ..._nestedDocumentMetaTypes(metaCache, meta),
    ];

Iterable<MetaSeal> _nestedDocumentMetaTypes(
        MetaClassCache metaCache, MetaSeal meta) =>
    meta
        .when(
          data: (d) => d.nonComputedFields,
          sealed: (s) => s.nonComputedFields,
          sum: (s) => s.nonComputedFields,
          enumeration: (e) => e.nonComputedFields,
        )
        .map((f) => metaCache.find(f.returnType.type))
        .where((m) => m.isSome)
        .map((m) => [m.some, ..._nestedDocumentMetaTypes(metaCache, m.some)])
        .expand((a) => a);

bool _isSchema(ElementAnnotation elementAnnotation) =>
    elementAnnotation.computeConstantValue().type.name == 'Schema';

Collection _loadCollection(
  DartObject dartObject,
  MetaClassCache metaCache, {
  String parentName,
}) {
  final name = _calcName(dartObject);
  return Collection(
    name: name,
    isRenamed: dartObject.getField('name').toStringValue().isNotEmpty,
    type: dartObject.type,
    parent: parentName == null || parentName.isEmpty
        ? const Option.none()
        : Option.some(parentName),
    documentMetaType: metaCache.find(_documentMetaTypName(dartObject)).some,
    subcollections: dartObject.getField('subcollections').toListValue().map(
          (dartObject) => _loadCollection(
            dartObject,
            metaCache,
            parentName: name,
          ),
        ),
  );
}

// TODO: generics
String _documentMetaTypName(DartObject dartObject) =>
    dartObject.type.typeArguments
        .map(
          (a) => a.element.source.contents.data.substring(
            a.element.nameOffset,
            a.element.nameOffset + a.element.nameLength,
          ),
        )
        .first;

String _calcName(DartObject dartObject) {
  final name = dartObject.getField('name').toStringValue();
  return name != ''
      ? name
      : dartObject.type.typeArguments
          .map(
            (a) => a.element.source.contents.data
                .substring(
                  a.element.nameOffset,
                  a.element.nameOffset + a.element.nameLength,
                )
                .replaceFirst('\$', '')
                .replaceAll('<', '--')
                .replaceAll('>', '--'),
          )
          .first;
}
