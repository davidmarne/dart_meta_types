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

Class _documentRef(Collection collection) => Class(
      (b) => b
        ..name = collection.name + 'DocumentReference'
        ..extend = Reference(
            'TypedDocumentReference<${collection.name}, ${collection.name}Updater, ${collection.name}DocumentReference, ${collection.name}CollectionReference>')
        ..constructors.add(_documentConstructor(collection))
        ..fields.add(_firestoreField)
        ..methods.addAll([
          _parentCollection(collection),
          ..._subCollections(collection),
        ]),
    );

Constructor _documentConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(firestore, path, () => ${collection.name}Updater._(), (data) => serializers.deserializeWith(${collection.name}Serializer(), data), (ref) => ${collection.name}DocumentReference._(firestore, ref.path))'))
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
