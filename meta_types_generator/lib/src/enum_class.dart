import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';
import 'package:meta_types/meta_types_models.dart'
    show Enum, EnumField, Option, FieldType, MetaInterfaceType;
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'util.dart';

Enum enumFromClassElement(
  ClassElement element,
  DartObject annotation,
  MetaClassCache cache,
) {
  final fields = element.fields.where((f) => f.isSynthetic).map((field) {
    if (!field.isConst || !field.isStatic || field.initializer == null) {
      throw new TemplateException(
          'enum class fields should be initialized static const. see ${field.name} on ${element.name}');
    }

    return EnumField(
      name: field.name,
      returnType: resolveFieldReturnTypeFromFieldElement(field),
      isComputed: isComputed(field.metadata),
    );
  });

  if (element.supertype.name != 'Object') {
    throw TemplateException(
        'enum classes cannot have super types. see ${element.name}');
  }

  final interfaces = element.interfaces.map((e) {
    return cache.find(e.name).when(
      none: () {
        throw TemplateException(
            'interfaces must be data classes. see ${e.name}');
      },
      some: (interface) {
        return interface.wheno(
          data: (data) {
            if (data.isFinal) {
              throw TemplateException(
                  'interfaces cannot be final. see: ${element.name}');
            }
            return MetaInterfaceType(
                meta: data,
                generics:
                    e.typeArguments.map((a) => FieldType(type: a.displayName)));
          },
          otherwise: () {
            throw TemplateException(
                'interfaces must be data classes. see ${element.name}');
          },
        );
      },
    );
  });

  return Enum(
    name: element.name.replaceAll('\$', ''),
    type: '',
    isPrivate: false,
    fields: fields,
    generics: resolveTypeParameterDeclaration(element),
    dataInterfaces: interfaces,
  );
}
