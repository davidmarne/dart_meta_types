import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Enum, EnumField, DataField, Generic;
import 'util.dart';

//// TODO: mixin
// TODO: fix $story
// Fix field type generics
Class generateEnum(Enum enumClass) => Class((b) => b
  ..abstract = false
  ..types.addAll(enumClass.generics.map((g) => Reference(g.type)))
  ..constructors.add(_defaultConstructor(enumClass))
  ..name = enumClass.name
  ..extend = Reference(
    '\$${enumClass.name}' + extendedClassGenerics(enumClass.generics),
    '',
  )
  ..fields.addAll([
    Field((b) => b
      ..name = '_value'
      ..modifier = FieldModifier.final$
      ..type = Reference('Object')),
    ..._genComputedFields(enumClass),
    ..._genNonComputedFields(enumClass),
    _values(enumClass),
  ])
  ..methods.addAll([
    ..._genDataInterfaceFields(enumClass),
    ..._genComputedFieldsGetter(enumClass),
    ..._genNonCumputedFieldsCheck(enumClass),
    ..._genNonCumputedFieldsWhen(enumClass),
    _when(enumClass),
    _wheno(enumClass),
    _hashCode(enumClass),
    _equality(enumClass),
    _toString(enumClass),
  ]));

Class generateEnumBase(Enum enumClass) => Class((b) => b
  ..abstract = true
  ..types.addAll(enumClass.generics.map((g) => Reference(g.type)))
  ..name = 'I' + enumClass.name
  // ..extend = Reference('Enum')
  ..methods.addAll([
    // ..._genNonCumputedFieldsOption(enumClass, isAbstract: true),
    // _values(enumClass),
    ..._genNonCumputedFieldsWhen(enumClass, isAbstract: true),
    _when(enumClass, isAbstract: true),
    _wheno(enumClass, isAbstract: true),
  ]));

Constructor _defaultConstructor(Enum enumClass) => new Constructor(
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

Iterable<Code> _nullAssertions(Iterable<EnumField> fields) =>
    fields.map((field) => Code('assert(_value != null)'));

Field _values(Enum enumClass) => Field((b) => b
  ..static = true
  ..name = 'values'
  ..assignment = Code('''
  <${enumClass.name}>{${_valuesEntries(enumClass)}}
  '''));

String _valuesEntries(Enum e) =>
    e.fields.map((field) => '${e.name}.${field.name}').join(',');

Method _when(Enum enumClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'when'
        ..types.add(Reference('WHEN'))
        ..returns = Reference('WHEN')
        ..optionalParameters.addAll(enumClass.nonComputedFields.map((f) =>
            Parameter((b) => b
              ..named = true
              ..name = f.name
              ..type =
                  Reference('WHEN Function(${_removeReturnTypeVoid(f)})'))))
        ..body = isAbstract ? null : Code('''
          ${_cloneWhen(enumClass)}
          throw FallThroughError();'''),
    );

Method _wheno(Enum enumClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'wheno'
        ..types.add(Reference('WHENO'))
        ..returns = Reference('WHENO')
        ..optionalParameters.add(Parameter((b) => b
          ..named = true
          ..name = 'otherwise'
          ..type = Reference('WHENO Function()')))
        ..optionalParameters.addAll(
          enumClass.nonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..name = f.name
                ..type =
                    Reference('WHENO Function(${_removeReturnTypeVoid(f)})'),
            ),
          ),
        )
        ..body = isAbstract ? null : Code('''
          ${_cloneWhenO(enumClass)}
          return otherwise();'''),
    );

Iterable<Constructor> _constructors(Enum enumClass) =>
    enumClass.nonComputedFields.map(
      (f) => Constructor(
        (b) => b
          // ..constant = enumClass.computedFields.isEmpty && enumClass.isConst
          ..name = f.name
          ..requiredParameters.addAll([
            if (!_isVoid(f))
              Parameter(
                (b) => b
                  ..name = f.name
                  ..type = Reference(f.returnType.typeStr),
              ),
          ])
          ..initializers.addAll(
            enumClass.nonComputedFields.map(
              (ifield) => Code(
                ifield == f
                    ? (_isVoid(f)
                        ? '_${ifield.name} = true'
                        : 'assert(${ifield.name} != null), _${ifield.name} = ${ifield.name}')
                    : '_${ifield.name} = null',
              ),
            ),
          ),
      ),
    );

String _cloneWhen(Enum enumClass) => enumClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (this == ${enumClass.name}.${field.name}) { return ${field.name}(${_removeVoidPropertyNameSpaced(enumClass, field)}._value as ${field.returnType.typeStr}); }');

String _cloneWhenO(Enum enumClass) => enumClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (this == ${enumClass.name}.${field.name}) { if (${field.name} != null) return ${field.name}(${_removeVoidPropertyNameSpaced(enumClass, field)}._value as ${field.returnType.typeStr}); else return otherwise(); }');

Method _equality(Enum enumClass) => Method(
      (b) => b
        ..name = 'operator =='
        ..returns = TypeReference((b) => b..symbol = 'bool')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'other'
          ..type = Reference('dynamic')))
        ..body = Code('''
          if (identical(other, this)) return true;
          if (other is! ${enumClass.name}) return false;
          return _value == other._value;'''),
    );

Method _hashCode(Enum enumClass) => Method(
      (b) => b
        ..name = 'hashCode'
        ..type = MethodType.getter
        ..returns = TypeReference((b) => b..symbol = 'int')
        ..body = Code(
            'return \$jf(\$jc(_value.hashCode, \'${enumClass.name}\'.hashCode));'),
    );

Method _toString(Enum enumClass) => Method(
      (b) => b
        ..name = 'toString'
        ..returns = TypeReference((b) => b..symbol = 'String')
        ..body = Code('return \'${enumClass.name}( \$_value )\';'),
    );

Iterable<Field> _genNonComputedFields(Enum e) => e.nonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.constant
          ..static = true
          ..name = '${field.name}'
          ..assignment = Code('${e.name}._(\$${e.name}.${field.name})')
          ..type = Reference(e.name),
      ),
    );

Iterable<Field> _genComputedFields(Enum e) => e.computedFields.map(
      (field) => Field(
        (b) => b
          ..name = '_${field.name}'
          ..type = Reference(field.returnType.typeStr),
      ),
    );

Iterable<Method> _genNonCumputedFieldsCheck(Enum e,
        {bool isAbstract = false}) =>
    e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = "is" + capitalize(field.name)
          ..type = MethodType.getter
          ..returns = Reference('bool')
          ..body =
              isAbstract ? null : Code('''return ${field.name} != null;'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsWhen(
  Enum e, {
  bool isAbstract = false,
}) =>
    e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = 'when' + capitalize(field.name)
          ..returns = Reference('void')
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..name = 'handler'
                ..type =
                    Reference('void Function(${_removeReturnTypeVoid(field)})'),
            ),
          )
          ..body = isAbstract
              ? null
              : Code(
                  '''if (${e.name}.${field.name} == this) handler(${_removeVoidPropertyNameSpaced(e, field)}._value as ${field.returnType.typeStr});'''),
      ),
    );

Iterable<Method> _genComputedFieldsGetter(Enum e) => e.computedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..returns = Reference(field.returnType.typeStr)
          ..type = MethodType.getter
          ..body = Code('''return _${field.name} ??= super.${field.name};'''),
      ),
    );

String _replaceVoidReturnTypeWithBool(EnumField field) =>
    _isVoid(field) ? 'bool' : field.returnType.typeStr;
String _removeReturnTypeVoid(EnumField field) =>
    _isVoid(field) ? '' : field.returnType.typeStr;
String _removeVoidProperty(EnumField field) => _isVoid(field) ? '' : field.name;
String _removeVoidPropertyNameSpaced(Enum enumClass, EnumField field) =>
    _isVoid(field) ? '' : '${enumClass.name}.' + field.name;
bool _isVoid(EnumField field) => field.returnType.typeStr == 'void';

Iterable<Method> _genDataInterfaceFields(Enum e) => e.dataFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..returns = Reference(field.returnType.typeStr)
          ..type = MethodType.getter
          ..body =
              Code('''return when(${_genDataInterfaceFieldBody(e, field)});'''),
      ),
    );

String _genDataInterfaceFieldBody(Enum e, DataField field) =>
    e.nonComputedFields.fold(
        '',
        (comb, sfield) =>
            '$comb${sfield.name}: (${sfield.name}) => ${sfield.name}.${field.name},');
