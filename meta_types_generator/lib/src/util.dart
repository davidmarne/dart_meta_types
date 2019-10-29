import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta_types/meta_types.dart' show computed;
import 'package:build/build.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, Option, Generic, FieldType, TypeParameterDeclaration;
import 'meta_class_cache.dart';

bool isComputed(List<ElementAnnotation> metadata) => metadata
    .any((meta) => meta.computeConstantValue().toStringValue() == computed);

Iterable<InterfaceType> calcSupertypes(ClassElement e) =>
    e.type.name == 'Object'
        ? []
        : [e.type, ...calcSupertypes(e.supertype.element)];

String classGenerics(Iterable<TypeParameterDeclaration> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.typeParameterStr).join(",")}>';
}

String extendedClassGenerics(
    Iterable<TypeParameterDeclaration> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.type).join(",")}>';
}

Iterable<TypeParameterDeclaration> resolveTypeParameterDeclaration(
        ClassElement element) =>
    element.typeParameters.map(
      (p) => TypeParameterDeclaration(
        type: p.name,
        extension: p.bound == null
            ? Option.none()
            : p.bound.toString() == 'dynamic'
                ? Option.some(resolveFieldExtensionName(p))
                : Option.some(
                    resolveFieldReturnType(
                      p.bound.toString(),
                    ),
                  ),
      ),
    );

FieldType resolveFieldReturnTypeFromPropertyAccessorElement(
    PropertyAccessorElement a) {
  // f this right here
  final beforeField = a.source.contents.data
      .replaceRange(a.nameOffset - 5, a.source.contents.data.length, '');
  final returnTypeStr =
      beforeField.replaceRange(0, beforeField.lastIndexOf('\n') + 1, '').trim();
  return resolveFieldReturnType(returnTypeStr);
}

FieldType resolveFieldReturnType(String returnTypeStr) {
  // f this right here
  final indexOfCaret = returnTypeStr.indexOf('<');
  if (indexOfCaret == -1) {
    return FieldType(type: returnTypeStr, generics: Option.none());
  }
  final generics = returnTypeStr
      .substring(indexOfCaret + 1, returnTypeStr.length - 1)
      .split(',')
      .map(resolveFieldReturnType);

  return FieldType(
      type: returnTypeStr.substring(0, indexOfCaret),
      generics: Option.some(generics));
}

FieldType resolveFieldExtensionName(Element a) {
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
  return resolveFieldReturnType(x);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

// Iterable<String> parseMixins(
//   ClassElement element,
//   String metaType,
// ) =>
//     element.metadata
//         .map((m) => m.computeConstantValue())
//         .where((c) => c.type.element is ClassElement)
//         .where((c) => (c.type.element as ClassElement).allSupertypes.any(
//             (s) => s.name == 'MetaTypeMixin' || s.name == '${metaType}Mixin'))
//         .map((c) => element.name);
