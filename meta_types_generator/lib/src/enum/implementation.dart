import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart' show Enum, EnumField, DataField;
import '../common/code_builder_utils.dart';
import 'common.dart';
import 'interface_methods.dart';

Class generateEnum(Enum<EnumField, DataField> enumeration) => Class(
      (b) => b
        ..abstract = false
        ..types.addAll([
          Reference(enumGenericName),
          ...typeParameterReferences(enumeration.typeParameters),
        ])
        ..constructors.add(
          _defaultConstructor(enumeration),
        )
        ..name = enumeration.name
        ..extend = templateExtension(
          enumeration.name,
          enumeration.typeParameters,
        )
        ..fields.addAll([
          _valueField(enumeration),
          ...computedFields(enumeration.computedFields),
          ..._initializers(enumeration),
          _values(enumeration),
        ])
        ..methods.addAll(
          [
            valueGetter(),
            ordinalGetter(),
            ...dataInterfaceFields(
              enumeration.nonComputedFields,
              enumeration.dataFields,
            ),
            ...computedFieldMethods(enumeration.computedFields),
            ...enumIsSetMethods(enumeration.nonComputedFields),
            ...enumeration.nonComputedFields.map(
              (field) => whenField(
                field,
                enumWhenFieldGenerator(enumeration, field),
              ),
            ),
            whenFields(
              enumeration.fields,
              enumWhenConditionGenerator(enumeration),
            ),
            whenFields(
              enumeration.fields,
              enumWhenoConditionGenerator(enumeration),
              wheno: true,
            ),
            hashCode(
                '\$jf(\$jc(_value.hashCode, \'${enumeration.name}\'.hashCode))'),
            equality(enumeration.name, '_value == other._value'),
            toString(enumeration.name, '\$_value'),
          ],
        ),
    );

Constructor _defaultConstructor(Enum<EnumField, DataField> enumeration) =>
    new Constructor(
      (b) => b
        ..name = '_'
        ..constant = true
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..named = false
              ..name = '_value'
              ..toThis = true,
          ),
        )
        ..initializers.add(
          Code('assert(_value != null)'),
        ),
    );

Field _valueField(Enum<EnumField, DataField> enumeration) => Field(
      (b) => b
        ..name = '_value'
        ..modifier = FieldModifier.final$
        ..type = Reference(enumGenericName),
    );

Field _values(Enum<EnumField, DataField> enumeration) => Field((b) => b
  ..static = true
  ..modifier = FieldModifier.constant
  ..name = 'values'
  ..assignment = Code('<${enumeration.name}>[${_valuesEntries(enumeration)}]'));

String _valuesEntries(Enum<EnumField, DataField> enumeration) =>
    enumeration.fields
        .map((field) => '${enumeration.name}.${field.name}')
        .join(',');

Iterable<Field> _initializers(Enum<EnumField, DataField> enumeration) =>
    enumeration.nonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.constant
          ..static = true
          ..name = '${field.name}'
          ..assignment =
              Code('${enumeration.name}._(\$${enumeration.name}.${field.name})')
          ..type =
              Reference('${enumeration.name}<${field.returnType.typeStr}>'),
      ),
    );
