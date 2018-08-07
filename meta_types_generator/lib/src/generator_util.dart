import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:meta_types/meta_types.dart'
    hide SealedClass, DataClass, EnumClass;
import 'package:analyzer/dart/element/type.dart';

enum MetaTypes {
  dataClass,
  sealedClass,
  enumClass,
  invalid,
}

bool elementHasMetaAnnotation(Element e) =>
    e.metadata.any(isMetaTypesAnnotation);

ElementAnnotation getElementMetaAnnotation(Element e) =>
    e.metadata.firstWhere(isMetaTypesAnnotation);

bool isMetaTypesAnnotation(ElementAnnotation a) {
  switch (metaToMetaType(a)) {
    case MetaTypes.dataClass:
    case MetaTypes.sealedClass:
    case MetaTypes.enumClass:
      return true;
    default:
      return false;
  }
}

bool isValidElementName(Element element) =>
    element.name.startsWith('_\$') || element.name.startsWith('\$');

MetaTypes elementMetaType(Element element) =>
    metaToMetaType(getElementMetaAnnotation(element));

MetaTypes metaToMetaType(ElementAnnotation annotation) {
  final val = annotation.computeConstantValue();
  switch (val.type.name.toString()) {
    case 'DataClass':
      return MetaTypes.dataClass;
    case 'SealedClass':
      return MetaTypes.sealedClass;
    case 'EnumClass':
      return MetaTypes.enumClass;
    default:
      return MetaTypes.invalid;
  }
}

String className(ClassElement element) {
  final entities = element.computeNode().childEntities.where((e) {
    final str = e.toString();
    return !str.startsWith('@') && str != 'class' && str != 'abstract';
  });

  if (entities.elementAt(1).toString().startsWith('<'))
    return entities.elementAt(0).toString() + entities.elementAt(1).toString();

  return entities.first.toString();
}

String stripGeneratorTokens(String name) {
  if (name.startsWith('_\$')) return name.substring(2);
  if (name.startsWith('\$')) return name.substring(1);
  return name;
}

String capd(String name) => name[0].toUpperCase() + name.substring(1);

bool isComputed(PropertyAccessorElement method) => method.metadata
    .any((meta) => meta.computeConstantValue().toStringValue() == computed);

class Field {
  final DartType dartType;
  final String name;
  Field(this.name, this.dartType);

  String _typeString;
  String get typeString =>
      _typeString ??= _computeFieldName().replaceAll('\$', '');

  String _computeFieldName() {
    if (dartType is InterfaceType &&
        (dartType as InterfaceType).typeArguments.isNotEmpty)
      return dartType.name +
          '<${(dartType as InterfaceType).typeArguments.map((p) => p.name).join(",")}>';
    return dartType.name;
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Field) return false;
    return typeString == other.typeString &&
        name == other.name &&
        dartType == other.dartType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), typeString.hashCode));
  }
}

class MetaMixin {
  final DartObject constValue;
  final String generatedName;
  final String baseClassName;
  MetaMixin(this.constValue, this.generatedName, this.baseClassName);
}

String baseClassName(String name) {
  if (!name.startsWith('_')) name = '_$name';
  return '${name}Base';
}

String classGenerics(ClassElement e) {
  return e.typeParameters.isEmpty
      ? ''
      : '<${e.typeParameters.map((p) => p.name).join(",")}>';
}
