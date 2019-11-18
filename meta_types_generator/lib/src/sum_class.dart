import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'meta_class.dart' show TemplateException;
import 'package:meta_types/meta_types_models.dart';
import 'meta_class_cache.dart';
import 'util.dart';

Sum<SumField> sumFromClassElement(
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
      isPrivate: accessor.name.startsWith('_'),
      returnType: resolveFieldReturnTypeFromPropertyAccessorElement(accessor),
      isComputed: isComputed(accessor.metadata),
      serialableField: getSerializableField(element.metadata),
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

            return buildMetaInterface<SumField, Sum<SumField>>(
              sum,
              e.typeArguments,
            );
            // return MetaInterface(
            //   meta: sum,
            //   parametarizedFields: sum.fields, // TODO
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
                'interfaces must be sum classes. see ${element.name}');
          },
        );
      },
    );
  });

  return Sum<SumField>(
    name: element.name.replaceFirst('\$', ''),
    isPrivate: element.isPrivate,
    typeParameters: resolveTypeParameterDeclaration(element.typeParameters),
    methods: element.methods.map(methodElementToMethod),
    isFinal: false, //annotation.getField('isFinal').toBoolValue(),
    isInterface: false, //annotation.getField('isInterface').toBoolValue(),
    isConst: isConst(element),
    interfaces: interfaces,
    fields: fields,
    serializable: isSerializable(element.metadata),
    implementsBase: implementsBase(element),
  );
}
