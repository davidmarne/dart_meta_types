import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Sealed, SealedField, DataField;
import '../common/code_builder_utils.dart';

Class generateSealed(Sealed<SealedField, DataField> sealedClass) => Class(
      (b) => b
        ..abstract = false
        ..name = sealedClass.name
        ..types.addAll(sealedClass.typeParameters.map((g) => Reference(g.type)))
        ..constructors.addAll(
          restrictedFieldConstructors(
              sealedClass.isConst, sealedClass.nonComputedFields),
        )
        ..extend = templateExtension(
          sealedClass.name,
          sealedClass.typeParameters,
        )
        ..fields.addAll([
          ...computedFields(sealedClass.computedFields),
          ...restrictedFieldInitializerr(sealedClass.nonComputedFields),
        ])
        ..methods.addAll([
          ...dataInterfaceFields(
            sealedClass.nonComputedFields,
            sealedClass.dataFields,
          ),
          ...computedFieldMethods(sealedClass.computedFields),
          ...restrictedFieldAccessor('sealed', sealedClass.nonComputedFields),
          ...isSetMethods(sealedClass.nonComputedFields),
          ...sealedClass.nonComputedFields.map(
            (field) => whenField(
              field,
              whenFieldGenerator(field),
            ),
          ),
          whenFields(
            sealedClass.nonComputedFields,
            whenConditionGenerator,
          ),
          whenFields(
            sealedClass.nonComputedFields,
            whenOConditionGenerator,
            wheno: true,
          ),
          hashCode(
            hashBodyForFields(sealedClass.nonComputedFields),
          ),
          equality(
            sealedClass.name,
            restrictedAccessorEqualityFold(sealedClass.nonComputedFields),
          ),
          toString(
            sealedClass.name,
            '\${when(${restrictedAccessorToStringWhen(sealedClass.nonComputedFields)})})',
          ),
        ]),
    );
