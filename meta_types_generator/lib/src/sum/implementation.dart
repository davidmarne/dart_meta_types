import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart' show Sum, SumField;
import '../common/code_builder_utils.dart';

Class generateSum(Sum<SumField> sumClass) => Class(
      (b) => b
        ..abstract = false
        ..name = sumClass.name
        ..types.addAll(
          typeParameterReferences(sumClass.typeParameters),
        )
        ..constructors.addAll(
          restrictedFieldConstructors(
              sumClass.isConst, sumClass.nonComputedFields),
        )
        ..extend = templateExtension(
          sumClass.name,
          sumClass.typeParameters,
        )
        ..fields.addAll([
          ...computedFields(sumClass.computedFields),
          ...restrictedFieldInitializerr(sumClass.nonComputedFields),
        ])
        ..methods.addAll([
          ...computedFieldMethods(sumClass.computedFields),
          ...restrictedFieldAccessor('sum', sumClass.nonComputedFields),
          ...isSetMethods(sumClass.nonComputedFields),
          ...sumClass.nonComputedFields.map(
            (field) => whenField(
              field,
              whenFieldGenerator(field),
            ),
          ),
          whenFields(
            sumClass.nonComputedFields,
            whenConditionGenerator,
          ),
          whenFields(
            sumClass.nonComputedFields,
            whenOConditionGenerator,
            wheno: true,
          ),
          hashCode(
            hashBodyForFields(sumClass.nonComputedFields),
          ),
          equality(
            sumClass.name,
            restrictedAccessorEqualityFold(sumClass.nonComputedFields),
          ),
          toString(
            sumClass.name,
            '\${when(${restrictedAccessorToStringWhen(sumClass.nonComputedFields)})})',
          ),
        ]),
    );
