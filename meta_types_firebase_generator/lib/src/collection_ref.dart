import 'package:code_builder/code_builder.dart';
import 'models.dart';

// TODO(generalize)
final _firestoreField = Field(
  (b) => b
    ..modifier = FieldModifier.final$
    ..name = 'firestore'
    ..type = Reference('Firestore'),
);

Iterable<Class> flutterCollectionRefs(Context context) =>
    context.schema.collections.map(_collectionReference);

Iterable<Class> flutterAbstractCollectionRefs(Context context) =>
    context.schema.collections.where((c) => c.isRenamed).fmap((coll) sync* {
      final added = <String>{};
      for (final c in coll) {
        if (!added.contains(c.documentMetaType.name)) {
          added.add(c.documentMetaType.name);
          yield c;
        }
      }
    }).map(_abstractCollectionReference);

extension I<A> on Iterable<A> {
  Iterable<B> fmap<B>(Iterable<B> Function(Iterable<A>) func) => func(this);
}

Class _collectionReference(Collection collection) => Class(
      (b) => b
        ..name = collection.name + 'CollectionReference'
        ..extend = collection.isRenamed
            ? Reference(
                '${collection.documentMetaType.name}CollectionReference<${collection.name}DocumentReference, ${collection.name}CollectionReference>')
            : Reference(
                'TypedCollectionReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, ${collection.name}DocumentReference, ${collection.name}CollectionReference>')
        ..constructors.add(_collectionConstructor(collection))
        ..fields.add(_firestoreField)
        ..methods.addAll([
          if (collection.parent.isSome) _parentDocument(collection),
          // _whereClauses(collection),
          // _orderClauses(collection),
        ]),
    );

Class _abstractCollectionReference(Collection collection) => Class(
      (b) => b
        ..abstract = true
        ..types.addAll([
          Reference(
              'DR extends TypedDocumentReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>'),
          Reference(
              'CR extends TypedCollectionReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>'),
        ])
        ..name = collection.documentMetaType.name + 'CollectionReference'
        ..constructors.add(_abstractCollectionConstructor(collection))
        ..extend = Reference(
            'TypedCollectionReference<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, DR, CR>')
        ..methods.addAll([
          // _whereClauses(collection),
          // _orderClauses(collection),
        ]),
    );

Method _parentDocument(Collection collection) => Method(
      (b) => b
        ..name = 'parent'
        ..returns = Reference('${collection.parent.some}DocumentReference')
        ..lambda = true
        ..type = MethodType.getter
        ..body = Code(
            '${collection.parent.some}DocumentReference._(firestore, ref.parent().path)'),
    );

Constructor _abstractCollectionConstructor(Collection collection) =>
    Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(firestore, path, updaterFactory, serialize, toTypedDocumentReference, toTypedCollectionReference,)'))
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
              ..name = 'toTypedDocumentReference'
              ..type = Reference('DR Function(DocumentReference)'),
          ),
          Parameter(
            (b) => b
              ..name = 'toTypedCollectionReference'
              ..type = Reference('CR Function(CollectionReference)'),
          ),
        ]),
    );

Constructor _collectionConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            '${collection.isRenamed ? 'super._' : 'super'}(firestore, path, () => ${collection.documentMetaType.name}Updater._(), (data) => serializers.serializeWith(${collection.documentMetaType.name}Serializer(), data), (ref) => ${collection.name}DocumentReference._(firestore, ref.path), (ref) => ${collection.name}CollectionReference._(firestore, ref.path))'))
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
          ),
        ]),
    );
