import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart' show TemplateException;
import 'package:meta_types/meta_types_models.dart'
    show Sum, SumField, MetaInterfaceType, FieldType;
import 'meta_class_cache.dart';
import 'util.dart';

Sum sumFromClassElement(
  ClassElement element,
  DartObject annotation,
  MetaClassCache cache,
) {
  if (element.accessors.isNotEmpty &&
      element.fields.every((f) => !f.isSynthetic)) {
    throw new TemplateException(
        'sum class should have no fields. see ${element.name}');
  }

  final fields = element.accessors.map((accessor) {
    if (!accessor.isGetter) {
      throw new TemplateException(
          'sum class accessors should be getters. see ${accessor.name} on class ${element.name}');
    }

    return SumField(
      name: accessor.name,
      returnType: resolveFieldReturnTypeFromPropertyAccessorElement(accessor),
      isComputed: isComputed(accessor.metadata),
    );
  });

  if (element.supertype.name != 'Object') {
    throw TemplateException(
        'sum classes cannot have super types. see ${element.name}');
  }

  final interfaces = element.interfaces.map((e) {
    return cache.find(e.name).when(
      none: () {
        throw TemplateException(
            'interfaces must be sum classes. see ${e.name}');
      },
      some: (interface) {
        return interface.wheno(
          sum: (sum) {
            if (sum.isFinal) {
              throw TemplateException(
                  'interfaces cannot be final. see: ${element.name}');
            }
            return MetaInterfaceType(
              meta: sum,
              generics: e.typeArguments.map(
                (a) => FieldType(type: a.displayName),
              ),
            );
          },
          otherwise: () {
            throw TemplateException(
                'interfaces must be sum classes. see ${element.name}');
          },
        );
      },
    );
  });

  return Sum(
    name: element.name.replaceAll('\$', ''),
    generics: resolveTypeParameterDeclaration(element),
    isFinal: false, //annotation.getField('isFinal').toBoolValue(),
    isInterface: false, //annotation.getField('isInterface').toBoolValue(),
    // isConst:
    //     element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
    interfaces: interfaces,
    fields: fields,
  );
}
