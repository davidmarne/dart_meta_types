import 'package:meta_types/meta_types_models.dart';
import 'package:code_builder/code_builder.dart' as cb;

import '../common/code_builder_utils.dart';
import '../util.dart';

const enumGenericName = 'EGN';

String Function(EnumField) enumWhenConditionGenerator(
        Enum<EnumField, DataField> enumeration) =>
    (EnumField field) =>
        'if (this == ${enumeration.name}.${field.name}) { return ${field.name}(${_removeVoidPropertyNameSpaced(enumeration, field)}._value as ${field.returnType.typeStr}); }';

String Function(EnumField) enumWhenoConditionGenerator(
        Enum<EnumField, DataField> enumeration) =>
    (EnumField field) =>
        'if (this == ${enumeration.name}.${field.name}) { if (${field.name} != null) return ${field.name}(${_removeVoidPropertyNameSpaced(enumeration, field)}._value as ${field.returnType.typeStr}); else return otherwise(); }';

String enumWhenFieldGenerator(
        Enum<EnumField, DataField> enumeration, EnumField field) =>
    'if (${enumeration.name}.${field.name} == this) handler(${_removeVoidPropertyNameSpaced(enumeration, field)}._value as ${field.returnType.typeStr});';

String _removeVoidPropertyNameSpaced(
        Enum<EnumField, DataField> enumeration, EnumField field) =>
    isVoid(field) ? '' : '${enumeration.name}.' + field.name;

Iterable<cb.Method> enumIsSetMethods(
  Iterable<EnumField> fields, {
  bool isAbstract = false,
}) =>
    fields.map(
      (field) => cb.Method(
        (b) => b
          ..name = "is" + capitalize(field.name)
          ..type = cb.MethodType.getter
          ..returns = cb.Reference('bool')
          ..body = abstractBody(isAbstract, 'return ${field.name} == this;'),
      ),
    );
