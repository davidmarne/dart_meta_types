import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart'
    show Sealed, SealedField, Data, DataField;
import '../common/code_builder_utils.dart';

Class generateSealed(Sealed<SealedField, DataField> sealedClass) => Class(
      (b) => b
        ..abstract = false
        ..name = sealedClass.name
        ..types.addAll(
          typeParameterReferences(sealedClass.typeParameters),
        )
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
          ...sealedClass.dataInterfaces
              .where((i) => i.meta.implementsBase)
              .map((i) => _copyInterface(sealedClass, i.meta)),
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

// for dataInterfaces TODO for enum
Method _copyInterface(
  Sealed<SealedField, DataField> sealedClass,
  Data<DataField> dataClass,
) =>
    Method(
      (b) => b
        ..name = 'copy${dataClass.name}'
        ..returns = classNameWithTypeArguments(
          sealedClass.name,
          sealedClass.typeParameters,
        )
        ..optionalParameters.addAll(
          _copyMethodParameters(dataClass.nonComputedFields),
        )
        ..body = Code(
            'return when(${_whenInvocationParameters(sealedClass, dataClass)});'),
    );

Iterable<Parameter> _copyMethodParameters(Iterable<DataField> fields) =>
    fields.map(
      (f) => Parameter(
        (b) => b
          ..named = true
          ..name = fieldParameterName(f)
          ..type = Reference(f.returnType.typeStr),
      ),
    );

String _whenInvocationParameters(
  Sealed<SealedField, DataField> sealedClass,
  Data<DataField> dataClass,
) =>
    sealedClass.nonComputedFields.fold(
        '',
        (comb, field) =>
            '$comb${field.name}: (${field.name}) => ${sealedClass.name}.${field.name}(${field.name}.copy${dataClass.name}(${_copyInvocationParameters(dataClass)}),),');

String _copyInvocationParameters(Data<DataField> dataClass) =>
    dataClass.nonComputedFields.fold(
        '',
        (comb, field) =>
            '$comb${fieldParameterName(field)}: ${fieldParameterName(field)},');
