import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';
import 'meta_class.dart' show TemplateException;
import 'package:meta_types/meta_types_models.dart';
import 'meta_class_cache.dart';
import 'util.dart';

Sealed<SealedField, DataField> sealedFromClassElement(
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
      isPrivate: accessor.name.startsWith('_'),
      returnType: resolveFieldReturnTypeFromPropertyAccessorElement(accessor),
      isComputed: isComputed(accessor.metadata),
      serialableField: getSerializableField(element.metadata),
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
            return buildMetaInterface<DataField, Data<DataField>>(
              data,
              e.typeArguments,
            );
          },
          otherwise: () {
            throw TemplateException(
                'interfaces must be data classes. see ${element.name}');
          },
        );
      },
    );
  });

  // if (element.name == '\$MetaSeal')
  //   throw Exception(interfaces.first.parametarizedFields
  //       .where((f) => f.name == 'fields')
  //       .toString());

  return Sealed<SealedField, DataField>(
    name: element.name.replaceFirst('\$', ''),
    isPrivate: element.isPrivate,
    typeParameters: resolveTypeParameterDeclaration(element.typeParameters),
    methods: element.methods.map(methodElementToMethod),
    isConst: isConst(element),
    dataInterfaces: interfaces,
    fields: fields,
    serializable: isSerializable(element.metadata),
    implementsBase: implementsBase(element),
  );
}
