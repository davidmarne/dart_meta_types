import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'data_class_template.dart';
import 'enum_class_template.dart';
import 'sealed_class_template.dart';
import 'generator_util.dart';

class MetaTypesGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    for (final element in library.allElements) {
      try {
        if (elementHasMetaAnnotation(element)) {
          result.write(_generateElement(element));
        }
      } catch (e, s) {
        log.severe('failed to generate class for ${element.name}. $s', e, s);
      }
    }

    return result.toString();
  }

  String _generateElement(Element e) {
    switch (elementMetaType(e)) {
      case MetaTypes.dataClass:
        return generateDataClass(e);
        break;
      case MetaTypes.sealedClass:
        return generateSealedClass(e);
        break;
      case MetaTypes.enumClass:
        return generateEnumClass(e);
        break;
      default:
        throw Exception('_generateElement default case hit');
    }
  }
}
