import 'dart:async';
import 'package:build/build.dart';
import 'package:meta_types/meta_types.dart' hide Method, Field;
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta_types_generator/api.dart';
import 'package:meta_types/core.dart';

import 'context.dart';
import 'models.dart';
import 'flutter_client.dart';
import 'doc_ref.dart';
import 'collection_ref.dart';
import 'updater.dart';

class MetaTypesFirebaseGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = StringBuffer();
    final emitter = DartEmitter();
    final formatter = DartFormatter();
    final metaCache = MetaClassCache(library);
    try {
      final contexts = readContexts(metaCache, library);
      void writeEach(Iterable<Class> Function(Context) classFactory) =>
          contexts.map(classFactory).expand((c) => c).forEach(
                (cls) => result.write(
                  formatter.format(
                    cls.accept(emitter).toString(),
                  ),
                ),
              );

      writeEach((c) => [flutterClient(c)]);
      writeEach(flutterDocumentRefs);
      writeEach(flutterAbstractDocumentRefs);
      writeEach(flutterCollectionRefs);
      writeEach(flutterAbstractCollectionRefs);
      writeEach(updatersContext);
      result.write(serializers(contexts, metaCache));
      if (!isFlutter) {
        writeEach(triggers);
        writeEach((c) => [triggersClient(c)]);
        result.write(
            'extension TypedSchema on App {CloudFunctionsSchema get schema => CloudFunctionsSchema(firestore());}');
      }
    } catch (e, s) {
      log.severe('META FIREBASE FAIL $s', e, s);
      return null;
    }

    return result.isEmpty ? null : result.toString();
  }
}

String serializers(Iterable<Context> contexts, MetaClassCache cache) =>
    'final serializers = (Serializers().toBuilder()..addPlugin(StandardJsonPlugin())..addAll([${isFlutter ? 'Flutter' : 'Functions'}TimestampSerializer(),${_serializersParams(contexts, cache)}])).build();';

String _serializersParams(Iterable<Context> contexts, MetaClassCache cache) =>
    contexts
        .map((c) => c.schema.collections.map((c) => c.documentMetaType))
        .expand((e) => e)
        .map((s) => _findMetas(s, cache))
        .expand((e) => e)
        .where((a) => a.serializable)
        .fold('', (comb, next) => '$comb${next.name}Serializer(),');

Iterable<MetaSeal> _findMetas(MetaSeal seal, MetaClassCache cache) => [
      seal,
      ...seal.fields
          .map((f) => cache.find(f.returnType.type))
          .whereIsSome
          .map((m) => _findMetas(m, cache))
          .expand((e) => e)
    ];

Iterable<Class> triggers(Context context) =>
    context.schema.collections.map(_trigger);

Class _trigger(Collection collection) => Class(
      (b) => b
        ..extend = Reference(
            'TypedDocumentBuilder<${collection.documentMetaType.name}, ${collection.documentMetaType.name}Updater, ${collection.name}DocumentReference, ${collection.name}CollectionReference>')
        ..name = collection.name + 'DocumentBuilder'
        ..constructors.add(_documentBuilderConstructor(collection))
        ..fields.addAll([
          Field((fb) => fb
            ..name = '_path'
            ..modifier = FieldModifier.final$
            ..type = Reference('String')),
          Field((b) => b
            ..name = 'firestore'
            ..type = Reference('Firestore')
            ..modifier = FieldModifier.final$)
        ])
        ..methods.addAll([
          ..._subCollectionBuilders(collection),
        ]),
    );
Constructor _documentBuilderConstructor(Collection collection) => Constructor(
      (b) => b
        ..name = '_'
        ..initializers.add(Code(
            'super(functions.firestore.document(_path), (ref) => ${collection.name}DocumentReference._(firestore, _path),)'))
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'firestore'
              ..toThis = true,
          ),
          Parameter(
            (b) => b
              ..name = '_path'
              ..toThis = true,
          )
        ]),
    );

Iterable<Method> _subCollectionBuilders(Collection collection) =>
    collection.subcollections.map(
      (sub) => Method(
        (b) => b
          ..name = sub.name.toLowerCase()
          ..type = MethodType.getter
          ..returns = Reference('${sub.name}DocumentBuilder')
          ..lambda = true
          ..body = Code(
              '${sub.name}DocumentBuilder._(firestore, \'\$_path/${sub.name}/{${sub.name}Id}\')'),
      ),
    );

Class triggersClient(Context context) => Class((b) => b
  ..name = _capitalize(context.schema.name + 'Triggers')
  ..constructors.add(_constructor)
  ..fields.addAll([
    Field((b) => b
      ..name = 'firestore'
      ..type = Reference('Firestore')
      ..modifier = FieldModifier.final$)
  ])
  ..methods.addAll([..._triggersCollectionRefs(context)]));

Iterable<Method> _triggersCollectionRefs(Context context) =>
    context.schema.rootCollections.map(_triggersCollectionRef);

Method _triggersCollectionRef(Collection collection) => Method((b) => b
  ..name = collection.name.toLowerCase() + 's'
  ..returns = Reference('${collection.name}DocumentBuilder')
  ..type = MethodType.getter
  ..lambda = true
  ..body = Code(
      '${collection.name}DocumentBuilder._(firestore, \'${collection.name}/{${collection.name}Id}\')'));

// TODO(util)
String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

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
