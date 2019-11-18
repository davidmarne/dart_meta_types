import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';
import 'package:meta_types/meta_types_models.dart';
import 'meta_class.dart' show TemplateException;
import 'meta_class_cache.dart';
import 'util.dart';

Data<DataField> dataFromClassElement(
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
      isPrivate: accessor.name.startsWith('_'),
      isComputed: isComputed(accessor.metadata),
      isAbstract: accessor.isAbstract,
      isDefaulted: !accessor.isAbstract && !isComputed(accessor.metadata),
      name: accessor.name,
      returnType: resolveFieldReturnTypeFromPropertyAccessorElement(accessor),
      serialableField: getSerializableField(element.metadata),
    );
  });

  final interfaces = element.interfaces
      .map((e) {
        return cache.find(e.name).when(
          none: () {
            throw TemplateException(
                'interfaces must be data classes. see ${e.name} on ${element.name}');
          },
          some: (interface) {
            return interface.wheno(
              data: (data) {
                if (data.isFinal) {
                  throw TemplateException(
                      'interfaces cannot be final. see: ${element.name}');
                }

                return buildMetaInterface<DataField, Data<DataField>>(
                  data,
                  e.typeArguments,
                );
                // if (element.name == '\$MetaSeal') {
                //   log.severe('hi');
                //   e.typeArguments.forEach(
                //       (a) => log.severe('${a.name} ${a.resolveToBound(a)} '));
                // }
                // return MetaInterface(
                //   meta: data,
                //   parametarizedFields: data.fields.map((f) {
                //     final arg = e.typeArguments.firstWhere(
                //       (a) {
                //         // log.severe('${a.name} ${a} ${f.returnType}');
                //         return a.name == f.returnType.type;
                //       },
                //       orElse: null,
                //     );
                //     return arg == null
                //         ? f
                //         : f.copy(
                //             returnType: FieldType(
                //               type: arg.displayName,
                //               generics: Option.none(), // TODO?
                //             ),
                //           );
                //   }), //TODO
                //   typeArguments: e.typeArguments.map(
                //     (a) => FieldType(
                //       type: a.displayName,
                //       generics: Option.none(), // TODO?
                //     ),
                //   ),
                // );
              },
              otherwise: () {
                throw TemplateException(
                    'interfaces must be data classes. see ${element.name} ${e.name} ${cache.find(e.name)}');
              },
            );
          },
        );
      })
      .expand((e) => [e, ...e.meta.interfaces])
      .toSet();

  return Data<DataField>(
    name: element.name.replaceFirst('\$', ''),
    isPrivate: element.isPrivate,
    isConst: isConst(element),
    isFinal: annotation.getField('isFinal').toBoolValue(),
    isInterface: annotation.getField('isInterface').toBoolValue(),
    interfaces: interfaces,
    fields: fields,
    typeParameters: resolveTypeParameterDeclaration(element.typeParameters),
    methods: element.methods.map(methodElementToMethod),
    serializable: isSerializable(element.metadata),
    implementsBase: implementsBase(element),
  );
}
