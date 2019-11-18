import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:meta_types/meta_types_models.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'util.dart';

Enum<EnumField, DataField> enumFromClassElement(
  ClassElement element,
  DartObject annotation,
  MetaClassCache cache,
) {
  final fields = element.fields.map((field) {
    if (!field.isConst || !field.isStatic || field.initializer == null) {
      throw new TemplateException(
          'enum class fields should be initialized static const. see ${field.name} on ${element.name}');
    }

    return EnumField(
      name: field.name,
      isPrivate: field.name.startsWith('_'),
      serialableField: getSerializableField(element.metadata),
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

            return buildMetaInterface<DataField, Data<DataField>>(
              data,
              e.typeArguments,
            );
            // return MetaInterface(
            //   meta: data,
            //   parametarizedFields: data.fields, //TODO
            //   typeArguments: e.typeArguments.map(
            //     (a) => FieldType(
            //       type: a.displayName,
            //       generics: Option.none(),
            //     ),
            //   ),
            // );
          },
          otherwise: () {
            throw TemplateException(
                'interfaces must be data classes. see ${element.name}');
          },
        );
      },
    );
  });

  return Enum<EnumField, DataField>(
    name: element.name.replaceFirst('\$', ''),
    isPrivate: element.isPrivate,
    type: '',
    fields: fields,
    typeParameters: resolveTypeParameterDeclaration(element.typeParameters),
    methods: element.methods.map(methodElementToMethod),
    dataInterfaces: interfaces.map(
      (hack) => hack.copy(
        meta: hack.meta.copy(
          fields: hack.meta.fields.where(
            (f) => !f.name.startsWith('_'),
          ),
        ),
      ),
    ), // TODO: hack, private should be on field obj
    serializable: isSerializable(element.metadata),
    implementsBase: implementsBase(element),
  );
}
