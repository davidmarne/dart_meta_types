import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'generator_util.dart';

final enumClassCache = <ClassElement, EnumClass>{};

EnumClass getEnumClass(Element element) {
  if (element is! ClassElement) {
    throw Exception('EnumClass annotation should only be used on classes');
  }

  final classElement = element as ClassElement;
  final generatedClassName = classElement.name.replaceAll('\$', '');

  // if the enum class has already been computed return it
  if (enumClassCache[classElement] != null) return enumClassCache[classElement];

  if (classElement.accessors.any((a) => !a.isStatic)) {
    throw Exception('Enum class should only contain static fields');
  }

  final staticFields = classElement.fields.where((a) => a.isStatic);
  if (staticFields.isEmpty) {
    throw Exception('Enum class should contain at least one static field');
  }

  final enumType = getElementMetaAnnotation(classElement)
      .computeConstantValue()
      .getField('type')
      .toTypeValue();

  if (!staticFields.every((f) => f.type.isSubtypeOf(enumType))) {
    throw Exception('Enum class static fields should all be of the same type');
  }

  if (enumType.name != 'int' &&
      enumType.name != 'String' &&
      staticFields.any((f) => f.initializer == null)) {
    throw Exception(
        'Non int/String enum class fields should all be intialized');
  }

  final mixins = classElement.metadata
      .map((m) => m.computeConstantValue())
      .where((c) => c.type.element is ClassElement)
      .where((c) => (c.type.element as ClassElement).allSupertypes.any(
          (s) => s.name == 'MetaTypeMixin' || s.name == 'SealedClassMixin'))
      .map((c) => new MetaMixin(
          c,
          '${generatedClassName}${c.type.element.name}',
          baseClassName(generatedClassName)));

  return EnumClass(
    classElement,
    generatedClassName,
    classElement.name,
    baseClassName(generatedClassName),
    mixins,
    enumType,
    enumType.name.toString(),
    staticFields.map((f) => Field(f.name, f.type)),
  );
}

class EnumClass {
  final ClassElement element;
  final String generatedClassName;
  final String templateClassName;
  final String baseClassName;
  final Iterable<MetaMixin> mixins;
  final DartType type;
  final String typeString;
  final Iterable<Field> fields;

  EnumClass(
    this.element,
    this.generatedClassName,
    this.templateClassName,
    this.baseClassName,
    this.mixins,
    this.type,
    this.typeString,
    this.fields,
  );
}
