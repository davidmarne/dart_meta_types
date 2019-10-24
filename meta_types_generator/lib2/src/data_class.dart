import 'package:analyzer/dart/element/element.dart';
import 'generator_util.dart';

final dataClassCache = <ClassElement, DataClass>{};

DataClass getDataClass(Element element) {
  if (element is! ClassElement) {
    throw new Exception('DataClass annotation should only be used on classes');
  }

  final classElement = element as ClassElement;
  final genClassName = classElement.name.replaceAll('\$', '');
  final genClassGenerics = classGenerics(classElement);

  // if the data class has already been computed return it
  if (dataClassCache[classElement] != null) return dataClassCache[classElement];

  if (classElement.accessors.any((a) => !a.isGetter || a.isPrivate)) {
    throw new Exception('All dataclass accessors should be public getters');
  }

  if (classElement.fields.any((f) => !f.isFinal)) {
    throw new Exception('All fields should be final');
  }

  if (classElement.methods.isNotEmpty) {
    throw new Exception('No methods should exist.');
  }

  DataClass supertype;
  try {
    if (classElement.supertype.name != 'Object') {
      supertype = getDataClass(classElement.supertype.element);
    }
  } catch (e) {
    throw new Exception(
        'Supertype must be Object or other DataClass.\n  Validating supertype raised $e');
  }

  if (supertype != null && supertype.isFinal) {
    throw new Exception('Supertype cannot be final.');
  }

  Iterable<DataClass> interfaces;
  try {
    interfaces = classElement.interfaces.map((i) => getDataClass(i.element));
  } catch (e) {
    throw new Exception(
        'Interfaces must be DataClasses. Validating interface raised $e');
  }

  if (interfaces.any((i) => !i.isInterface)) {
    throw new Exception('Interfaces must have isInterface set to true.');
  }

  final annotation =
      getElementMetaAnnotation(classElement).computeConstantValue();
  final isFinal = annotation.getField('isFinal').toBoolValue();
  final isInterface = annotation.getField('isInterface').toBoolValue();
  final isAbstract = annotation.getField('isAbstract').toBoolValue();

  final supertypes = <DataClass>[];
  var tmpSupertype = supertype;
  while (tmpSupertype != null) {
    supertypes.add(tmpSupertype);
    tmpSupertype = tmpSupertype.supertype;
  }

  final mixins = classElement.metadata
      .map((m) => m.computeConstantValue())
      .where((c) => c.type.element is ClassElement)
      .where((c) => (c.type.element as ClassElement)
          .allSupertypes
          .any((s) => s.name == 'MetaTypeMixin' || s.name == 'DataClassMixin'))
      .map((c) => new MetaMixin(c, '${genClassName}${c.type.element.name}',
          baseClassName(genClassName) + genClassGenerics));

  if (isInterface && mixins.isNotEmpty) {
    throw new Exception('Interfaces cannot include mixins');
  }

  if (isAbstract && isFinal) {
    throw new Exception('Abstract classes cannot be final.');
  }

  if (isInterface && isFinal) {
    throw new Exception('Interfaces cannot be final.');
  }

  final defaultedFields = _defaultedFields(classElement).toSet()
    ..addAll(interfaces.expand((st) => st.defaultedFields));

  final nonDefaultedFields = _nonDefaultedFields(classElement).toSet()
    ..addAll(interfaces.expand((st) => st.nonDefaultedFields));

  final computedFields = _computedFields(classElement).toSet()
    ..addAll(interfaces.expand((st) => st.computedFields));

  final nonComputedFields = _nonComputedFields(classElement).toSet()
    ..addAll(interfaces.expand((st) => st.nonComputedFields));

  if (isInterface && defaultedFields.isNotEmpty) {
    throw new Exception('Interfaces cannot have defaulted fields.');
  }

  if (isInterface && computedFields.isNotEmpty) {
    throw new Exception('Interfaces cannot have computed fields.');
  }

  final allFields = nonComputedFields.toSet()
    ..addAll(interfaces.expand((s) => s.nonComputedFields))
    ..addAll(supertypes.expand((s) => s.nonComputedFields));

  final dataClass = new DataClass(
    classElement,
    genClassName,
    classElement.name,
    baseClassName(genClassName),
    genClassGenerics,
    supertype,
    supertypes,
    interfaces,
    mixins,
    nonComputedFields,
    computedFields,
    nonDefaultedFields,
    defaultedFields,
    allFields,
    isFinal,
    isInterface,
    isAbstract,
  );

  dataClassCache[classElement] = dataClass;
  return dataClass;
}

class DataClass {
  final ClassElement element;
  final String generatedClassName;
  final String templateClassName;
  final String baseClassName;
  final String classGenerics;
  final DataClass supertype;
  final Iterable<DataClass> supertypes;
  final Iterable<DataClass> interfaces;
  final Iterable<MetaMixin> mixins;
  final Iterable<Field> nonComputedFields;
  final Iterable<Field> computedFields;
  final Iterable<Field> nonDefaultedFields;
  final Iterable<Field> defaultedFields;
  final Iterable<Field> allFields; // has super fields
  final bool isFinal;
  final bool isInterface;
  final bool isAbstract;

  DataClass(
    this.element,
    this.generatedClassName,
    this.templateClassName,
    this.baseClassName,
    this.classGenerics,
    this.supertype,
    this.supertypes,
    this.interfaces,
    this.mixins,
    this.nonComputedFields,
    this.computedFields,
    this.nonDefaultedFields,
    this.defaultedFields,
    this.allFields,
    this.isFinal,
    this.isInterface,
    this.isAbstract,
  );
}

Iterable<Field> _defaultedFields(ClassElement e) =>
    e.accessors.where((m) => !m.isAbstract && !isComputed(m)).map(_toField);

Iterable<Field> _nonDefaultedFields(ClassElement e) =>
    e.accessors.where((m) => m.isAbstract).map(_toField);

Iterable<Field> _computedFields(ClassElement e) =>
    e.accessors.where((m) => !m.isAbstract && isComputed(m)).map(_toField);

Iterable<Field> _nonComputedFields(ClassElement e) =>
    e.accessors.where((m) => !(!m.isAbstract && isComputed(m))).map(_toField);

Field _toField(PropertyAccessorElement element) => new Field(
      element.displayName,
      element.returnType,
    );
