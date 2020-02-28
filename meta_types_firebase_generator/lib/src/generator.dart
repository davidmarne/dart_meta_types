import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta_types_generator/api.dart';
import 'package:meta_types/meta_types_models.dart';

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
      writeEach(flutterCollectionRefs);
      writeEach(updatersContext);
      result.write(serializers(metaCache, library));
    } catch (e, s) {
      log.severe('META FIREBASE FAIL $s', e, s);
      return null;
    }

    return result.isEmpty ? null : result.toString();
  }
}

String serializers(MetaClassCache cache, LibraryReader reader) =>
    'final serializers = (Serializers().toBuilder()..addPlugin(StandardJsonPlugin())..addAll([${_serializersParams(cache, reader)}])).build();';

String _serializersParams(MetaClassCache cache, LibraryReader reader) =>
    reader.classes
        .map((c) => cache.find(c.name))
        .whereIsSome
        .where((a) => a.serializable)
        .fold('', (comb, next) => '$comb${next.name}Serializer(),');
