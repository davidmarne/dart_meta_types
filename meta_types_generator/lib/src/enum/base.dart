import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart' show Enum, EnumField, DataField;
import 'package:meta_types_generator/src/enum/interface_methods.dart';
import '../common/code_builder_utils.dart';
import 'common.dart';

Class generateEnumBase(Enum<EnumField, DataField> enumeration) => Class(
      (b) => b
        ..abstract = true
        ..types.addAll(enumeration.typeParameters.map((g) => Reference(g.type)))
        ..name = enumeration.name + 'Base'
        ..methods.addAll([
          ordinalGetter(isAbstract: true),
          valueGetter(isAbstract: true),
          ...enumIsSetMethods(
            enumeration.nonComputedFields,
            isAbstract: true,
          ),
          ...enumeration.nonComputedFields.map(
            (field) => whenField(
              field,
              enumWhenFieldGenerator(enumeration, field),
              isAbstract: true,
            ),
          ),
          whenFields(
            enumeration.fields,
            enumWhenConditionGenerator(enumeration),
            isAbstract: true,
          ),
          whenFields(
            enumeration.fields,
            enumWhenoConditionGenerator(enumeration),
            wheno: true,
            isAbstract: true,
          ),
        ]),
    );