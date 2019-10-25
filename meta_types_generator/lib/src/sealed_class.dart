import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart' show TemplateException;
import 'package:meta_types/meta_types_models.dart'
    show Sealed, SealedField, Option, Generic, MetaUnion;
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
      returnType: resolveFieldReturnTypeName(cache, accessor), // TODO:
      isComputed: isComputed(accessor.metadata),
      returnTypeGenerics: Option<List<String>>.none(),
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
        return interface.wheno(
          sealed: (sealed) {
            if (sealed.isFinal) {
              throw TemplateException(
                  'interfaces cannot be final. see: ${element.name}');
            }
            return MetaUnion.sealed(sealed);
          },
          data: (data) {
            if (data.isFinal) {
              throw TemplateException(
                  'interfaces cannot be final. see: ${element.name}');
            }
            return MetaUnion.data(data);
          },
          otherwise: () {
            throw TemplateException(
                'interfaces must be sealed classes. see ${element.name}');
          },
        );
      },
    );
  });

  final sealedInterfaces =
      interfaces.where((i) => i.isSealed).map((u) => u.sealed);
  final dataInterfaces = interfaces.where((i) => i.isData).map((u) {
    fields.where((f) => !f.isComputed).forEach((f) {
      cache.find(f.returnType).when(some: (s) {
        if (!s.data.interfaces.any((ifc) => ifc == u.data)) {
          throw TemplateException('fields should implement ${u.data.name}');
        }
      }, none: () {
        throw TemplateException('fields should implement ${u.data.name}');
      });
    });
    return u.data;
  });

  return Sealed(
    name: element.name.replaceAll('\$', ''),
    generics: element.typeParameters.map(
      (p) => Generic(type: p.name, extension: Option.none()),
    ),
    isFinal: false, //annotation.getField('isFinal').toBoolValue(),
    isInterface: false, //annotation.getField('isInterface').toBoolValue(),
    // isConst:
    //     element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
    dataInterfaces: dataInterfaces,
    sealedInterfaces: sealedInterfaces,
    fields: fields,
  );
}
