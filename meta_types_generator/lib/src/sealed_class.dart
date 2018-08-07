import 'package:analyzer/dart/element/element.dart';
import 'generator_util.dart';

final sealedClassCache = <ClassElement, SealedClass>{};

SealedClass getSealedClass(Element element) {
  if (element is! ClassElement) {
    throw new Exception(
        'SealedClass annotation should only be used on classes');
  }

  final classElement = element as ClassElement;
  final genClassName = classElement.name.replaceAll('\$', '');
  final genClassGenerics = classGenerics(classElement);

  // if the data class has already been computed return it
  if (sealedClassCache[classElement] != null)
    return sealedClassCache[classElement];

  final mixins = classElement.metadata
      .map((m) => m.computeConstantValue())
      .where((c) => c.type.element is ClassElement)
      .where((c) => (c.type.element as ClassElement).allSupertypes.any(
          (s) => s.name == 'MetaTypeMixin' || s.name == 'SealedClassMixin'))
      .map((c) => new MetaMixin(c, '${genClassName}${c.type.element.name}',
          baseClassName(genClassName) + genClassGenerics));

  if (classElement.accessors
      .any((a) => !a.isGetter || !a.isAbstract || !a.isPublic)) {
    throw new Exception(
        'SealedClass accessors should all be public abstract getters');
  }

  if (classElement.supertype.name != 'Object') {
    throw new Exception(
        'SealedClasses cannot extend anything other than Object');
  }

  if (classElement.methods.isNotEmpty) {
    throw new Exception('No methods should exist.');
  }

  // raise if there are any interfaces for now
  // additional work is required in the template for interface support
  if (classElement.interfaces.isNotEmpty) {
    throw new Exception('Interfaces not supported for SealedClasses');
  }

  Iterable<SealedClass> interfaces;
  try {
    interfaces = classElement.interfaces.map((i) => getSealedClass(i.element));
  } catch (e) {
    throw new Exception(
        'Interfaces must be SealedClasses. Validating interface raised $e');
  }

  final sealedClass = new SealedClass(
    classElement,
    genClassName,
    classElement.name,
    baseClassName(genClassName),
    genClassGenerics,
    mixins,
    interfaces,
    _computedFields(classElement),
    _unionFields(classElement).toSet()
      ..addAll(interfaces.expand((i) => i.unionFields)),
  );

  sealedClassCache[classElement] = sealedClass;
  return sealedClass;
}

class SealedClass {
  final ClassElement element;
  final String generatedClassName;
  final String templateClassName;
  final String baseClassName;
  final String genClassGenerics;
  final Iterable<MetaMixin> mixins;
  final Iterable<SealedClass> interfaces;
  final Iterable<Field> computedFields;
  final Iterable<Field> unionFields;
  SealedClass(
    this.element,
    this.generatedClassName,
    this.templateClassName,
    this.baseClassName,
    this.genClassGenerics,
    this.mixins,
    this.interfaces,
    this.computedFields,
    this.unionFields,
  );
}

Iterable<Field> _unionFields(ClassElement e) =>
    e.accessors.where((m) => m.isAbstract && !isComputed(m)).map(_toField);

Iterable<Field> _computedFields(ClassElement e) =>
    e.accessors.where((m) => !m.isAbstract && isComputed(m)).map(_toField);

Field _toField(PropertyAccessorElement element) => new Field(
      element.displayName,
      element.returnType,
    );
