import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Sealed, SealedField, DataField;
import '../common/code_builder_utils.dart';

Class generateSealedBase(Sealed<SealedField, DataField> sealedClass) => Class(
      (b) => b
        ..abstract = true
        ..types.addAll(sealedClass.typeParameters.map((g) => Reference(g.type)))
        ..name = sealedClass.name + 'Base'
        ..methods.addAll([
          ...isSetMethods(sealedClass.nonComputedFields, isAbstract: true),
          ...sealedClass.nonComputedFields.map(
            (field) => whenField(
              field,
              whenFieldGenerator(field),
              isAbstract: true,
            ),
          ),
          whenFields(
            sealedClass.nonComputedFields,
            whenConditionGenerator,
            isAbstract: true,
          ),
          whenFields(
            sealedClass.nonComputedFields,
            whenOConditionGenerator,
            wheno: true,
            isAbstract: true,
          ),
        ]),
    );
