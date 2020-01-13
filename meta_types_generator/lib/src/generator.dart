import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'meta_class_cache.dart';

import 'data/implementation.dart';
import 'data/serializer.dart';
import 'data/base.dart';

import 'enum/implementation.dart';
import 'enum/serializer.dart';
import 'enum/base.dart';

import 'sum/implementation.dart';
import 'sum/serializer.dart';
import 'sum/base.dart';

import 'seal/implementation.dart';
import 'seal/serializer.dart';
import 'seal/base.dart';

final emitter = DartEmitter();
final formatter = DartFormatter();

class MetaTypesGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    final cache = MetaClassCache(library);
    try {
      library.classes.map((c) => cache.find(c.name)).map((metaClassOption) {
        return metaClassOption.map(
          (metaClass) => metaClass.when(
            data: (d) => [
              if (!d.isInterface) generateData(d),
              if (!d.isInterface && d.serializable) generateDataSerializer(d),
              if (d.implementsBase) generateDataBase(d),
            ],
            sealed: (s) => [
              generateSealed(s),
              if (s.serializable) generateSealedSerializer(s),
              if (s.implementsBase) generateSealedBase(s),
            ],
            sum: (s) => [
              if (!s.isInterface) generateSum(s),
              if (!s.isInterface && s.serializable) generateSumSerializer(s),
              if (s.implementsBase) generateSumBase(s),
            ],
            enumeration: (e) => [
              generateEnum(e),
              if (e.serializable) generateEnumSerializer(e),
              if (e.implementsBase) generateEnumBase(e),
            ],
          ),
        );
      }).forEach((classesOption) {
        classesOption.whenSome((classes) {
          classes.forEach((cls) {
            result.write(
              formatter.format(
                cls.accept(DartEmitter()).toString(),
              ),
            );
          });
        });
      });
    } catch (e, s) {
      log.severe('META FAIL $e\n$s', e, s);
    }
    return result.toString();
  }
}
