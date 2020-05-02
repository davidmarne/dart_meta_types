import 'package:code_builder/code_builder.dart';
import 'models.dart';

final _firestoreField = Field(
  (b) => b
    ..modifier = FieldModifier.final$
    ..name = 'firestore'
    ..type = Reference('Firestore'),
);

Iterable<Class> flutterDocumentRefs(Context context) =>
    context.schema.collections.map(_documentRef);

Iterable<Class> flutterAbstractDocumentRefs(Context context) =>
    context.schema.collections.where((c) => c.isRenamed).fmap((coll) sync* {
      final added = <String>{};
      for (final c in coll) {
        if (!added.contains(c.documentMetaType.name)) {
          added.add(c.documentMetaType.name);
          yield c;
        }
      }
    }).map(_abstractDocumentRef);

extension I<A> on Iterable<A> {
  Iterable<B> fmap<B>(Iterable<B> Function(Iterable<A>) func) => func(this);
}

Class _documentRef(Collection collection) => Class(
      (b) => b
        ..name = collection.name + 'DocumentReference'
        ..extend = Reference(
            'TypedDocumentReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, ${collection.name}DocumentReference, ${collection.name}CollectionReference>')
        ..constructors.add(_documentConstructor(collection))
        ..fields.add(_firestoreField)
        ..methods.addAll([
          _parentCollection(collection),
          ..._subCollections(collection),
        ]),
    );

Class _abstractDocumentRef(Collection collection) => Class(
      (b) => b
        ..abstract = true
        ..types.addAll([
          Reference(
              'DR extends TypedDocumentReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>'),
          Reference(
              'CR extends TypedCollectionReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>'),
        ])
        ..name = collection.documentMetaType.name + 'DocumentReference'
        ..extend = Reference(
            'TypedDocumentReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>')
        ..constructors.add(_abstractDocumentConstructor(collection)),
    );

Constructor _abstractDocumentConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(firestore, path, updaterFactory, serialize, deserialize, toTypedDocumentReference,)'))
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'firestore'
              ..type = Reference('Firestore'),
          ),
          Parameter(
            (b) => b
              ..name = 'path'
              ..type = Reference('String'),
          ),
          Parameter(
            (b) => b
              ..name = 'updaterFactory'
              ..type = Reference(
                  '${collection.documentMetaType.name}Updater Function()'),
          ),
          Parameter(
            (b) => b
              ..name = 'serialize'
              ..type = Reference(
                  'Map<String, dynamic> Function(${collection.documentMetaType.name})'),
          ),
          Parameter(
            (b) => b
              ..name = 'deserialize'
              ..type = Reference(
                  '${collection.documentMetaType.name} Function(Map<String, dynamic>)'),
          ),
          Parameter(
            (b) => b
              ..name = 'toTypedDocumentReference'
              ..type = Reference('DR Function(DocumentReference)'),
          ),
        ]),
    );

Constructor _documentConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(firestore, path, () => ${collection.documentMetaType.name}Updater._(), (data) => serializers.serializeWith(${collection.documentMetaType.name}Serializer(), data), (data) => serializers.deserializeWith(${collection.documentMetaType.name}Serializer(), data), (ref) => ${collection.name}DocumentReference._(firestore, ref.path))'))
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'firestore'
              ..toThis = true,
          ),
          Parameter(
            (b) => b
              ..name = 'path'
              ..type = Reference('String'),
          )
        ]),
    );

Method _parentCollection(Collection collection) => Method(
      (b) => b
        ..annotations.add(Reference('override'))
        ..name = 'parent'
        ..returns = Reference('${collection.name}CollectionReference')
        ..lambda = true
        ..type = MethodType.getter
        ..body =
            Code('${collection.name}CollectionReference._(firestore, path)'),
    );

Iterable<Method> _subCollections(Collection collection) =>
    collection.subcollections.map(
      (sub) => Method(
        (b) => b
          ..name = sub.name.toLowerCase()
          ..returns = Reference('${sub.name}CollectionReference')
          ..lambda = true
          ..type = MethodType.getter
          ..body = Code(
              '${sub.name}CollectionReference._(firestore, \'\$path/${sub.name}\')'),
      ),
    );
