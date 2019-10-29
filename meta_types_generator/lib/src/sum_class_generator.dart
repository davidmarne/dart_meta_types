import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Sum, SumField, Option, Generic;
import 'util.dart';

//// TODO: mixin
// TODO: fix $story
// Fix field type generics
Class generateSum(Sum sumClass) => Class((b) => b
  ..abstract = false
  ..types.addAll(sumClass.generics.map((g) => Reference(g.type)))
  ..constructors.addAll(_constructors(sumClass))
  ..constructors.add(_defaultConstructor(sumClass))
  ..name = sumClass.name
  // ..mixins = _mixins(sumClass)
  ..types.addAll([])
  ..extend = Reference(
    '\$${sumClass.name}' + extendedClassGenerics(sumClass.generics),
    '',
  )
  ..fields.addAll([
    ..._genComputedFields(sumClass),
    ..._genNonComputedFields(sumClass),
  ])
  ..methods.addAll([
    ..._genComputedFieldsGetter(sumClass),
    ..._genNonCumputedFieldsGetter(sumClass),
    ..._genNonCumputedFieldsCheck(sumClass),
    // ..._genNonCumputedFieldsOption(sumClass),
    ..._genNonCumputedFieldsWhen(sumClass),
    _when(sumClass),
    _wheno(sumClass),
    _hashCode(sumClass),
    _equality(sumClass),
    _toString(sumClass),
  ]));

Class generateSumBase(Sum sumClass) => Class((b) => b
  ..abstract = true
  ..types.addAll(sumClass.generics.map((g) => Reference(g.type)))
  ..name = 'I' + sumClass.name
  // ..extend = Reference('Sum')
  ..methods.addAll([
    // ..._genNonCumputedFieldsOption(sumClass, isAbstract: true),
    ..._genNonCumputedFieldsWhen(sumClass, isAbstract: true),
    _when(sumClass, isAbstract: true),
    _wheno(sumClass, isAbstract: true),
  ]));

Constructor _defaultConstructor(Sum sumClass) => new Constructor(
      (b) => b
        ..optionalParameters.addAll(
          sumClass.nonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..name = f.name
                ..type = Reference(_replaceVoidReturnTypeWithBool(f)),
            ),
          ),
        )
        ..initializers.addAll(_initializers(sumClass.nonComputedFields))
        ..body = Code('''
        var found = false;
        ${_initializer(sumClass.nonComputedFields)}
        throw Exception("TODO");
        '''),
    );

String _initializer(Iterable<SumField> fields) => fields.fold(
    '',
    (comb, field) =>
        '$comb if (${field.name} != null) { if (found) throw Exception("todo"); found = true; }');

Iterable<Code> _initializers(Iterable<SumField> fields) =>
    fields.map((field) => Code('_${field.name} = ${field.name}'));

Method _when(Sum sumClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'when'
        ..types.add(Reference('WHEN'))
        ..returns = Reference('WHEN')
        ..optionalParameters.addAll(sumClass.nonComputedFields.map((f) =>
            Parameter((b) => b
              ..named = true
              ..name = f.name
              ..type =
                  Reference('WHEN Function(${_removeReturnTypeVoid(f)})'))))
        ..body = isAbstract ? null : Code('''
          ${_cloneWhen(sumClass)}
          throw FallThroughError();'''),
    );

Method _wheno(Sum sumClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'wheno'
        ..types.add(Reference('WHENO'))
        ..returns = Reference('WHENO')
        ..optionalParameters.add(Parameter((b) => b
          ..named = true
          ..name = 'otherwise'
          ..type = Reference('WHENO Function()')))
        ..optionalParameters.addAll(
          sumClass.nonComputedFields.map(
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
          ${_cloneWhenO(sumClass)}
          return otherwise();'''),
    );

Iterable<Constructor> _constructors(Sum sumClass) =>
    sumClass.nonComputedFields.map(
      (f) => Constructor(
        (b) => b
          // ..constant = sumClass.computedFields.isEmpty && sumClass.isConst
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
            sumClass.nonComputedFields.map(
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

String _cloneWhen(Sum sumClass) => sumClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (_${field.name} != null) { return ${field.name}(${_removeVoidPropertyPrivate(field)}); }');

String _cloneWhenO(Sum sumClass) => sumClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (_${field.name} != null) { if (${field.name} != null) return ${field.name}(${_removeVoidPropertyPrivate(field)}); else return otherwise(); }');

Method _equality(Sum sumClass) => Method(
      (b) => b
        ..name = 'operator =='
        ..returns = TypeReference((b) => b..symbol = 'bool')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'other'
          ..type = Reference('dynamic')))
        ..body = Code('''
          if (identical(other, this)) return true;
          if (other is! ${sumClass.name}) return false;
          return ${_equalityFold(sumClass.nonComputedFields)};'''),
    );

String _equalityFold(Iterable<SumField> e) =>
    e.map((field) => '_${field.name} == other._${field.name}').join('&&');

Method _hashCode(Sum sumClass) => Method(
      (b) => b
        ..name = 'hashCode'
        ..type = MethodType.getter
        ..returns = TypeReference((b) => b..symbol = 'int')
        ..body = Code('''
          return \$jf(${_hashFold(sumClass.nonComputedFields)});'''),
    );

String _hashFold(Iterable<SumField> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, _${field.name}.hashCode)');

Method _toString(Sum sumClass) => Method(
      (b) => b
        ..name = 'toString'
        ..returns = TypeReference((b) => b..symbol = 'String')
        ..body = Code('''
          final value = when(${_toStringWhen(sumClass.nonComputedFields)});
          return \'${sumClass.name}( \$value )\';'''),
    );

String _toStringWhen(Iterable<SumField> e) => e.fold(
    '',
    (comb, field) =>
        '$comb${field.name}: (${_removeVoidProperty(field)}) => \'${field.name}${_isVoid(field) ? "" : " \$"}${_removeVoidProperty(field)}\',');

Iterable<Field> _genNonComputedFields(Sum e) => e.nonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..name = '_${field.name}'
          ..type = Reference(
            _replaceVoidReturnTypeWithBool(field),
          ),
      ),
    );

Iterable<Field> _genComputedFields(Sum e) => e.computedFields.map(
      (field) => Field(
        (b) => b
          ..name = '_${field.name}'
          ..type = Reference(field.returnType.typeStr),
      ),
    );

Iterable<Method> _genNonCumputedFieldsGetter(Sum e) => e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..type = MethodType.getter
          ..returns = Reference(field.returnType.typeStr)
          ..body = Code('''
            if (_${field.name} != null) return ${_removeVoidPropertyPrivate(field)};
            throw Exception('TODO name htis');'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsCheck(Sum e, {bool isAbstract = false}) =>
    e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = "is" + capitalize(field.name)
          ..type = MethodType.getter
          ..returns = Reference('bool')
          ..body =
              isAbstract ? null : Code('''return _${field.name} != null;'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsOption(Sum e,
        {bool isAbstract = false}) =>
    e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name + 'Option'
          ..type = MethodType.getter
          ..returns = Reference('Option<${field.returnType}>')
          ..body = isAbstract
              ? null
              : Code(
                  '''return Option(${_removeVoidPropertyPrivate(field)});'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsWhen(
  Sum e, {
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
                  '''if (_${field.name} != null) handler(${_removeVoidPropertyPrivate(field)});'''),
      ),
    );

Iterable<Method> _genComputedFieldsGetter(Sum e) => e.computedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..returns = Reference(field.returnType.typeStr)
          ..type = MethodType.getter
          ..body = Code('''return _${field.name} ??= super.${field.name};'''),
      ),
    );

String _replaceVoidReturnTypeWithBool(SumField field) =>
    _isVoid(field) ? 'bool' : field.returnType.typeStr;
String _removeReturnTypeVoid(SumField field) =>
    _isVoid(field) ? '' : field.returnType.typeStr;
String _removeVoidProperty(SumField field) => _isVoid(field) ? '' : field.name;
String _removeVoidPropertyPrivate(SumField field) =>
    _isVoid(field) ? '' : '_' + field.name;
bool _isVoid(SumField field) => field.returnType.typeStr == 'void';
