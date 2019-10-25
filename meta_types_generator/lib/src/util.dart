import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta_types/meta_types.dart' show computed;
import 'package:build/build.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, Option, Generic;
import 'meta_class_cache.dart';

bool isComputed(List<ElementAnnotation> metadata) => metadata
    .any((meta) => meta.computeConstantValue().toStringValue() == computed);

Iterable<InterfaceType> calcSupertypes(ClassElement e) =>
    e.type.name == 'Object'
        ? []
        : [e.type, ...calcSupertypes(e.supertype.element)];

String classGenerics(Iterable<Generic> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.type).join(",")}>';
}

String resolveFieldReturnTypeName(
    MetaClassCache cache, PropertyAccessorElement a) {
  // f this right here
  final beforeField = a.source.contents.data
      .replaceRange(a.nameOffset - 5, a.source.contents.data.length, '');
  return beforeField
      .replaceRange(0, beforeField.lastIndexOf('\n') + 1, '')
      .trim();
}

String resolveFieldExtensionName(Element a) {
  // f this right here
  final beforeField = a.source.contents.data.replaceRange(0, a.nameOffset, '');

  final afterExtends =
      beforeField.replaceRange(0, beforeField.indexOf('extends') + 7, '');

  var lowest = 3920840928349203;
  var indexOfComma = afterExtends.indexOf(',');
  if (indexOfComma != -1 && indexOfComma < lowest) lowest = indexOfComma;

  final indexOfBracketSpace = afterExtends.indexOf('> ');
  if (indexOfBracketSpace != -1 && indexOfBracketSpace < lowest)
    lowest = indexOfBracketSpace;
  final indexOfBracketNewLine = afterExtends.indexOf('>\n');
  if (indexOfBracketNewLine != -1 && indexOfBracketNewLine < lowest)
    lowest = indexOfBracketNewLine;

  String x;
  try {
    x = afterExtends.replaceRange(lowest, afterExtends.length, '').trim();
  } catch (e, s) {
    log.severe('ame $afterExtends', e, s);
  }
  // log.severe(
  //     '$x $indexOfComma $indexOfBracketSpace $indexOfBracketNewLine $lowest');
  return x;
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

Iterable<String> parseMixins(
  ClassElement element,
  String metaType,
) =>
    element.metadata
        .map((m) => m.computeConstantValue())
        .where((c) => c.type.element is ClassElement)
        .where((c) => (c.type.element as ClassElement).allSupertypes.any(
            (s) => s.name == 'MetaTypeMixin' || s.name == '${metaType}Mixin'))
        .map((c) => element.name);
