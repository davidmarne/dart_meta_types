import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'util.dart';

class EnumClassField {
  final String returnTypeName;
  final String propertyName;
  final bool isComputedField;

  EnumClassField({
    this.propertyName,
    this.returnTypeName,
    this.isComputedField,
  });
}

class EnumClass implements MetaClass {
  final MetaClassReference metaClassReference;
  final MetaClassReference enumMetaClassReference;
  final Iterable<EnumClassField> fields;
  final Iterable<EnumClassField> computedFields;

  EnumClass._({
    this.metaClassReference,
    this.enumMetaClassReference,
    this.fields,
    this.computedFields,
  });

  factory EnumClass.fromClassElement(
    ClassElement element,
    DartObject annotation,
    MetaClassCache cache,
  ) {
    final metaClassReference = MetaClassReference(
        element.name.replaceAll('\$', ''), element.source.uri.toString());

    final fields = element.fields.map((field) {
      if (!field.isConst || !field.isStatic || field.initializer == null) {
        throw new TemplateException(
            'enum class fields should be initialized static const. see ${field.name} on class ${metaClassReference.symbol}');
      }

      return EnumClassField(
        propertyName: field.name,
        returnTypeName: field.type.displayName, // TODO:
        isComputedField: isComputed(field.metadata),
      );
    });

    if (element.supertype.name != 'Object' || element.interfaces.isNotEmpty) {
      throw TemplateException(
          'enum classes cannot have super type or implement interfaces. see ${element.name}');
    }

    // final DartType enumType = null; //annotation.getField('type').toTypeValue();
    final computedFields = fields.where((f) => f.isComputedField); //

    return EnumClass._(
      metaClassReference: metaClassReference,
      enumMetaClassReference: MetaClassReference('', ''),
      fields: fields,
      computedFields: computedFields,
    );
  }
}
