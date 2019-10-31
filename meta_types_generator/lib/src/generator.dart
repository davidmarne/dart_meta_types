import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'meta_class_cache.dart';
import 'data_class_generator.dart';
import 'sealed_class_generator.dart';
import 'sum_class_generator.dart';
import 'enum_class_generator.dart';

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
            data: (d) => d.isInterface ? <Class>[] : [generateData(d)],
            sealed: (d) => [generateSealed(d), generateSealedBase(d)],
            sum: (d) => d.isInterface
                ? <Class>[]
                : [generateSum(d), generateSumBase(d)],
            enumeration: (e) => <Class>[generateEnum(e)],
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
