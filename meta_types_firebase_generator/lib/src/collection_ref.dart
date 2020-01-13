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

Class _collectionReference(Collection collection) => Class(
      (b) => b
        ..name = collection.name + 'CollectionReference'
        ..extend = Reference(
            'TypedCollectionReference<${collection.name}, ${collection.name}Updater, ${collection.name}DocumentReference, ${collection.name}CollectionReference>')
        ..constructors.add(_collectionConstructor(collection))
        ..fields.add(_firestoreField)
        ..methods.addAll([
          if (collection.parent.isSome) _parentDocument(collection),
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

Constructor _collectionConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(firestore, path, () => ${collection.name}Updater._(), (ref) => ${collection.name}DocumentReference._(firestore, ref.documentID), (ref) => ${collection.name}CollectionReference._(firestore, ref.path))'))
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
