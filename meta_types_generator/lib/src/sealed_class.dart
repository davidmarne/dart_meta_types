import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'util.dart';

class SealedClassField {
  final String returnTypeName;
  final String propertyName;
  final bool isComputedField;

  SealedClassField({
    this.propertyName,
    this.returnTypeName,
    this.isComputedField,
  });
}

class SealedClass implements MetaClass {
  final MetaClassReference metaClassReference;
  final bool isFinal;
  final bool isInterface;
  final bool isConst;
  final Iterable<SealedClass> allInterfaces;
  final Iterable<SealedClassField> fields;
  final Iterable<SealedClassField> computedFields;
  final Iterable<SealedClassField> nonComputedFields;
  final Iterable<SealedClassField> allNonComputedFields;
  final Iterable<String> mixins;

  SealedClass._({
    this.metaClassReference,
    this.isFinal,
    this.isInterface,
    this.isConst,
    this.allInterfaces,
    this.fields,
    this.computedFields,
    this.nonComputedFields,
    this.allNonComputedFields,
    this.mixins,
  });

  factory SealedClass.fromClassElement(
    ClassElement element,
    DartObject annotation,
    MetaClassCache cache,
  ) {
    final metaClassReference = MetaClassReference(
      element.name.replaceAll('\$', ''),
      element.source.uri.toString(),
      generics: element.typeParameters.map(
        (p) => MetaClassReference(p.name, ''),
      ),
    );

    if (element.accessors.isNotEmpty &&
        element.fields.every((f) => !f.isSynthetic)) {
      // isSynthetic?
      throw new TemplateException(
          'sealed class should have no fields. see ${metaClassReference.symbol}');
    }

    final fields = element.accessors.map((accessor) {
      if (!accessor.isGetter) {
        throw new TemplateException(
            'sealed class accessors should be getters. see ${accessor.name} on class ${metaClassReference.symbol}');
      }

      return SealedClassField(
        propertyName: accessor.name,
        returnTypeName: resolveFieldReturnTypeName(cache, accessor), // TODO:
        isComputedField: isComputed(accessor.metadata),
      );
    });

    if (element.supertype.name != 'Object') {
      throw TemplateException(
          'sealed classes cannot have super types. see ${element.name}');
    }

    final interfaces = element.interfaces.map((e) {
      return cache.find(e.name).when(
        none: () {
          throw TemplateException(
              'interfaces must be sealed classes. see ${e.name}');
        },
        some: (interface) {
          return interface.whenDef(
            sealed: (sealed) {
              if (sealed.isFinal) {
                throw TemplateException(
                    'interfaces cannot be final. see: ${interface.metaClassReference.symbol}');
              }
              return sealed;
            },
            def: () {
              throw TemplateException(
                  'interfaces must be sealed classes. see ${interface.metaClassReference.symbol}');
            },
          );
        },
      );
    });

    final mixins = parseMixins(element, 'SealedClass');

    final computedFields = fields.where((f) => f.isComputedField);

    final nonComputedFields = fields.where((f) => !f.isComputedField);

    final allNonComputedFields = nonComputedFields.toList()
      ..addAll(interfaces.expand((i) => i.allNonComputedFields));

    return SealedClass._(
      metaClassReference: metaClassReference,
      isFinal: false, //annotation.getField('isFinal').toBoolValue(),
      isInterface: false, //annotation.getField('isInterface').toBoolValue(),
      isConst:
          element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
      allInterfaces: interfaces,
      fields: fields,
      computedFields: computedFields,
      nonComputedFields: nonComputedFields,
      allNonComputedFields: allNonComputedFields,
      mixins: mixins,
    );
  }
}
