import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart' show TemplateException;
import 'package:meta_types/meta_types_models.dart'
    show Sealed, SealedField, MetaInterfaceType, FieldType;
import 'meta_class_cache.dart';
import 'util.dart';

Sealed sealedFromClassElement(
  ClassElement element,
  DartObject annotation,
  MetaClassCache cache,
) {
  if (element.accessors.isNotEmpty &&
      element.fields.every((f) => !f.isSynthetic)) {
    throw new TemplateException(
        'sealed class should have no fields. see ${element.name}');
  }

  final fields = element.accessors.map((accessor) {
    if (!accessor.isGetter) {
      throw new TemplateException(
          'sealed class accessors should be getters. see ${accessor.name} on class ${element.name}');
    }

    return SealedField(
      name: accessor.name,
      returnType: resolveFieldReturnTypeFromPropertyAccessorElement(accessor),
      isComputed: isComputed(accessor.metadata),
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

  return Sealed(
    name: element.name.replaceAll('\$', ''),
    generics: resolveTypeParameterDeclaration(element),
    // isConst:
    //     element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
    dataInterfaces: interfaces,
    fields: fields,
  );
}
