import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart' show InterfaceType;
import 'package:meta_types/meta_types_models.dart' show Data, DataField, Option;
import 'meta_class.dart' show TemplateException;
import 'meta_class_cache.dart';
// import 'option.dart';
import 'util.dart';

// class DataClassField {
//   final String returnTypeName;
//   final String propertyName;
//   final bool isComputedField;
//   final bool isAbstractField;
//   final bool isDefaultedField;

//   DataClassField({
//     this.propertyName,
//     this.returnTypeName,
//     this.isComputedField,
//     this.isAbstractField,
//   }) : isDefaultedField = !isComputedField && !isAbstractField;
// }

// class DataClass implements MetaClass {
//   final MetaClassReference metaClassReference;
//   final bool isConst;
//   final bool isFinal;
//   final bool isInterface;
//   final Option<DataClass> supertype;
//   final Iterable<DataClass> allSupertypes;
//   final Iterable<DataClass> allInterfaces;
//   final Iterable<DataClassField> fields;
//   final Iterable<DataClassField> computedFields;
//   final Iterable<DataClassField> nonComputedFields;
//   final Iterable<DataClassField> allNonComputedFields;
//   final Iterable<DataClassField> nonDefaultedFields;
//   final Iterable<DataClassField> allNonDefaultedFields;
//   final Iterable<DataClassField> defaultedFields;
//   final Iterable<DataClassField> allDefaultedFields;
//   final Iterable<String> mixins;

//   DataClass._({
//     this.metaClassReference,
//     this.isConst,
//     this.isFinal,
//     this.isInterface,
//     this.supertype,
//     this.allSupertypes,
//     this.allInterfaces,
//     this.fields,
//     this.computedFields,
//     this.nonComputedFields,
//     this.allNonComputedFields,
//     this.nonDefaultedFields,
//     this.allNonDefaultedFields,
//     this.defaultedFields,
//     this.allDefaultedFields,
//     this.mixins,
//   });

  Data fromClassElement(
    ClassElement element,
    DartObject annotation,
    MetaClassCache cache,
  ) {
    // final metaClassReference = MetaClassReference(
    //   element.name.replaceAll('\$', ''),
    //   element.source.uri.toString(),
    //   generics: element.typeParameters.map(
    //     (p) => MetaClassReference(p.name, ''),
    //   ),
    // );

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
        name: accessor.name,
        returnType: resolveFieldReturnTypeName(cache, accessor), // TODO:
        returnTypeGenerics: Option<List<String>>.none(),
      );
    });

    // final supertypeMetaClassOption = cache.find(element.supertype.name);
    // if (supertypeMetaClassOption.isAbsent &&
    //     element.supertype.name != 'Object') {
    //   throw TemplateException('supertypes must be data classes');
    // }

    // final supertypeOption = supertypeMetaClassOption.when(
    //   none: () {
    //     if (element.supertype.name != 'Object') {
    //       throw TemplateException('supertypes must be data classes');
    //     }
    //     return Option<DataClass>.none();
    //   },
    //   some: (supertype) {
    //     return supertype.whenDef(
    //       data: (data) {
    //         if (data.isFinal) {
    //           throw TemplateException(
    //               'supertype cannot be final. see: ${supertype.metaClassReference.symbol}');
    //         }
    //         if (data.isInterface) {
    //           throw TemplateException(
    //               'supertype cannot be an interface. see: ${supertype.metaClassReference.symbol}');
    //         }
    //         return Option.some(data);
    //       },
    //       def: () {
    //         throw TemplateException(
    //             'interfaces must be data classes. see ${supertype.metaClassReference.symbol}');
    //       },
    //     );
    //   },
    // );

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
              return data;
            },
            otherwise: () {
              throw TemplateException(
                  'interfaces must be data classes. see ${element.name}');
            },
          );
        },
      );
    }).expand((e) => [e, ...e.allInterfaces]);

    // final supertypes = calcSupertypes(element.supertype.element).map((e) {
    //   return cache.find(e.name).when(
    //     none: () {
    //       throw TemplateException(
    //           'supertypes must be data classes. see ${e.name}');
    //     },
    //     some: (supertype) {
    //       return supertype.whenDef(
    //         data: (data) {
    //           if (data.isFinal) {
    //             throw TemplateException(
    //                 'supertypes cannot be final. see: ${element.name} ${supertype.metaClassReference.symbol}');
    //           }

    //           if (data.isInterface) {
    //             throw TemplateException(
    //                 'supertypes cannot be interfaces. see: ${element.name}  ${supertype.metaClassReference.symbol}');
    //           }
    //           return data;
    //         },
    //         def: () {
    //           throw TemplateException(
    //               'supertypes must be data classes. see ${supertype.metaClassReference.symbol}');
    //         },
    //       );
    //     },
    //   );
    // });


    return Data(
      name: element.name.replaceAll('\$', ''),
      // isConst:
      //     element.constructors.any((c) => c.isDefaultConstructor && c.isConst),
      isFinal: annotation.getField('isFinal').toBoolValue(),
      isInterface: annotation.getField('isInterface').toBoolValue(),
      interfaces: interfaces,
      fields: fields,
    );
  }
}
