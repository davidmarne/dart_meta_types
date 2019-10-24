import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, Option, Generic;
import 'meta_class.dart' show TemplateException;
import 'meta_class_cache.dart';
import 'util.dart';

Data dataFromClassElement(
  ClassElement element,
  DartObject annotation,
  MetaClassCache cache,
) {
  if (element.fields.isNotEmpty &&
      element.fields.every((f) => !f.isSynthetic)) {
    throw new TemplateException(
        'data class should have no fields. see ${element.name}');
  }

  final fields = element.accessors.map((accessor) {
    if (!accessor.isGetter) {
      throw new TemplateException(
          'data class accessors should be getters. see ${accessor.name} on class ${element.name}');
    }

    return DataField(
      isComputed: isComputed(accessor.metadata),
      isAbstract: accessor.isAbstract,
      isDefaulted: !accessor.isAbstract && !isComputed(accessor.metadata),
      name: accessor.name,
      returnType: resolveFieldReturnTypeName(cache, accessor), // TODO:
      returnTypeGenerics: Option<List<String>>.none(),
    );
  });

  final interfaces = element.interfaces
      .map((e) {
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
                return data;
              },
              otherwise: () {
                throw TemplateException(
                    'interfaces must be data classes. see ${element.name}');
              },
            );
          },
        );
      })
      .expand((e) => [e, ...e.interfaces])
      .toSet();

  return Data(
    name: element.name.replaceAll('\$', ''),
    // isConst:
    //     element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
    isFinal: annotation.getField('isFinal').toBoolValue(),
    isInterface: annotation.getField('isInterface').toBoolValue(),
    interfaces: interfaces,
    fields: fields,
    generics: element.typeParameters.map(
      (p) => Generic(
          type: p.name,
          extension: p.bound == null
              ? Option.none()
              : Option.some(p.bound.toString())),
    ),
  );
}
