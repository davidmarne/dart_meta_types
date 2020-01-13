import 'package:code_builder/code_builder.dart';
import 'models.dart';

final _firestoreField = Field(
  (b) => b
    ..name = 'firestore'
    ..modifier = FieldModifier.final$
    ..type = Reference('Firestore'),
);

final _constructor = Constructor(
  (b) => b
    ..requiredParameters.add(
      Parameter(
        (b) => b
          ..name = 'firestore'
          ..toThis = true,
      ),
    ),
);

Class flutterClient(Context context) => Class((b) => b
  ..name = _capitalize(context.schema.name)
  ..constructors.add(_constructor)
  ..fields.add(_firestoreField)
  ..methods.addAll([..._collectionRefs(context)]));

Iterable<Method> _collectionRefs(Context context) =>
    context.schema.rootCollections.map(_collectionRef);

Method _collectionRef(Collection collection) => Method((b) => b
  ..name = collection.name.toLowerCase() + 's'
  ..returns = Reference('${collection.name}CollectionReference')
  ..type = MethodType.getter
  ..lambda = true
  ..body = Code(
      '${collection.name}CollectionReference._(firestore, \'${collection.name}\')'));

// TODO(util)
String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
