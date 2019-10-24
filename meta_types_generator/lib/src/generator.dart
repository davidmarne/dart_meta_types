import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'option.dart';
import 'data_class_generator.dart';
import 'sealed_class_generator.dart';

final emitter = DartEmitter();
final formatter = DartFormatter();

class MetaTypesGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    // log.severe("DAVE START");
    final cache = MetaClassCache(library);
    try {
      library.classes.map((c) => cache.find(c.name)).map((metaClassOption) {
        // log.severe("DAVE metaClassOption $metaClassOption");
        return metaClassOption.map(
          (metaClass) => metaClass.whenDef(
            data: (d) => d.isInterface ? <Class>[] : [generateDataClass(d)],
            sealed: (d) => d.isInterface
                ? <Class>[]
                : [generateSealedClass(d), generateSealedClassBase(d)],
            def: () => <Class>[],
          ),
        );
      }).forEach((classesOption) {
        classesOption.whenPresent((classes) {
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
      log.severe('DAVE FAIL $e\n$s', e, s);
    }
    // log.severe('DAVE DONE ${result.toString()}');
    return result.toString();
  }
}
