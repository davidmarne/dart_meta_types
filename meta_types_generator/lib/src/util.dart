import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta_types/meta_types.dart' show computed;
import 'meta_class.dart';
import 'meta_class_cache.dart';

bool isComputed(List<ElementAnnotation> metadata) => metadata
    .any((meta) => meta.computeConstantValue().toStringValue() == computed);

Iterable<InterfaceType> calcSupertypes(ClassElement e) =>
    e.type.name == 'Object'
        ? []
        : [e.type, ...calcSupertypes(e.supertype.element)];

String classGenerics(Iterable<MetaClassReference> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.symbol).join(",")}>';
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
