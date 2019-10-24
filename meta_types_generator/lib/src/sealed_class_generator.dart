import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Sealed, SealedField, Option, Generic;
import 'util.dart';

//// TODO: mixin
// TODO: fix $story
// Fix field type generics
Class generateSealed(Sealed sealedClass) => Class((b) => b
  ..abstract = false
  ..types.addAll(sealedClass.generics.map((g) => Reference(g.type)))
  ..constructors.addAll(_constructors(sealedClass))
  ..constructors.add(_defaultConstructor(sealedClass))
  ..name = sealedClass.name
  // ..mixins = _mixins(sealedClass)
  ..types.addAll([])
  ..extend = Reference(
    '\$${sealedClass.name}' + classGenerics(sealedClass.generics),
    '',
  )
  ..fields.addAll([
    ..._genComputedFields(sealedClass),
    ..._genNonComputedFields(sealedClass),
  ])
  ..methods.addAll([
    ..._genComputedFieldsGetter(sealedClass),
    ..._genNonCumputedFieldsGetter(sealedClass),
    ..._genNonCumputedFieldsCheck(sealedClass),
    // ..._genNonCumputedFieldsOption(sealedClass),
    ..._genNonCumputedFieldsWhen(sealedClass),
    _when(sealedClass),
    _wheno(sealedClass),
    _hashCode(sealedClass),
    _equality(sealedClass),
    _toString(sealedClass),
  ]));

Class generateSealedBase(Sealed sealedClass) => Class((b) => b
  ..abstract = true
  ..types.addAll(sealedClass.generics.map((g) => Reference(g.type)))
  ..name = 'I' + sealedClass.name
  ..extend = Reference('Sealed')
  ..methods.addAll([
    ..._genNonCumputedFieldsOption(sealedClass, isAbstract: true),
    ..._genNonCumputedFieldsWhen(sealedClass, isAbstract: true),
    _when(sealedClass, isAbstract: true),
    _wheno(sealedClass, isAbstract: true),
  ]));

Constructor _defaultConstructor(Sealed sealedClass) => new Constructor(
      (b) => b
        ..optionalParameters.addAll(
          sealedClass.nonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..name = f.name
                ..type = Reference(_replaceVoidReturnTypeWithBool(f)),
            ),
          ),
        )
        ..initializers.addAll(_initializers(sealedClass.nonComputedFields))
        ..body = Code('''
        var found = false;
        ${_initializer(sealedClass.nonComputedFields)}
        throw Exception("TODO");
        '''),
    );

String _initializer(Iterable<SealedField> fields) => fields.fold(
    '',
    (comb, field) =>
        '$comb if (${field.name} != null) { if (found) throw Exception("todo"); found = true; }');

Iterable<Code> _initializers(Iterable<SealedField> fields) =>
    fields.map((field) => Code('_${field.name} = ${field.name}'));

Method _when(Sealed sealedClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'when'
        ..types.add(Reference('WHEN'))
        ..returns = Reference('WHEN')
        ..optionalParameters.addAll(sealedClass.nonComputedFields.map((f) =>
            Parameter((b) => b
              ..named = true
              ..name = f.name
              ..type =
                  Reference('WHEN Function(${_removeReturnTypeVoid(f)})'))))
        ..body = isAbstract ? null : Code('''
          ${_cloneWhen(sealedClass)}
          throw FallThroughError();'''),
    );

Method _wheno(Sealed sealedClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'wheno'
        ..types.add(Reference('WHENO'))
        ..returns = Reference('WHENO')
        ..optionalParameters.add(Parameter((b) => b
          ..named = true
          ..name = 'otherwise'
          ..type = Reference('WHENO Function()')))
        ..optionalParameters.addAll(
          sealedClass.nonComputedFields.map(
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
          ${_cloneWhen(sealedClass)}
          return otherwise();'''),
    );

Iterable<Constructor> _constructors(Sealed sealedClass) =>
    sealedClass.nonComputedFields.map(
      (f) => Constructor(
        (b) => b
          // ..constant = sealedClass.computedFields.isEmpty && sealedClass.isConst
          ..name = f.name
          ..requiredParameters.addAll([
            if (f.returnType != 'void')
              Parameter(
                (b) => b
                  ..name = f.name
                  ..type = Reference(f.returnType),
              ),
          ])
          ..initializers.addAll(
            sealedClass.nonComputedFields.map(
              (ifield) => Code(
                ifield == f
                    ? (f.returnType == 'void'
                        ? '_${ifield.name} = true'
                        : 'assert(${ifield.name} != null), _${ifield.name} = ${ifield.name}')
                    : '_${ifield.name} = null',
              ),
            ),
          ),
      ),
    );

String _cloneWhen(Sealed sealedClass) => sealedClass.nonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (_${field.name} != null) { return ${field.name}(${_removeVoidPropertyPrivate(field)}); }');

Method _equality(Sealed sealedClass) => Method(
      (b) => b
        ..name = 'operator =='
        ..returns = TypeReference((b) => b..symbol = 'bool')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'other'
          ..type = Reference('dynamic')))
        ..body = Code('''
          if (identical(other, this)) return true;
          if (other is! ${sealedClass.name}) return false;
          return ${_equalityFold(sealedClass.nonComputedFields)};'''),
    );

String _equalityFold(Iterable<SealedField> e) =>
    e.map((field) => '_${field.name} == other._${field.name}').join('&&');

Method _hashCode(Sealed sealedClass) => Method(
      (b) => b
        ..name = 'hashCode'
        ..type = MethodType.getter
        ..returns = TypeReference((b) => b..symbol = 'int')
        ..body = Code('''
          return \$jf(${_hashFold(sealedClass.nonComputedFields)});'''),
    );

String _hashFold(Iterable<SealedField> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, _${field.name}.hashCode)');

Method _toString(Sealed sealedClass) => Method(
      (b) => b
        ..name = 'toString'
        ..returns = TypeReference((b) => b..symbol = 'String')
        ..body = Code('''
          final value = when(${_toStringWhen(sealedClass.nonComputedFields)});
          return \'${sealedClass.name}( \$value )\';'''),
    );

String _toStringWhen(Iterable<SealedField> e) => e.fold(
    '',
    (comb, field) =>
        '$comb${field.name}: (${_removeVoidProperty(field)}) => \'${field.name}${_isVoid(field) ? "" : " \$"}${_removeVoidProperty(field)}\',');

Iterable<Field> _genNonComputedFields(Sealed e) => e.nonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..name = '_${field.name}'
          ..type = Reference(
            _replaceVoidReturnTypeWithBool(field),
          ),
      ),
    );

Iterable<Field> _genComputedFields(Sealed e) => e.computedFields.map(
      (field) => Field(
        (b) => b
          ..name = '_${field.name}'
          ..type = Reference(field.returnType),
      ),
    );

Iterable<Method> _genNonCumputedFieldsGetter(Sealed e) =>
    e.nonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..type = MethodType.getter
          ..returns = Reference(field.returnType)
          ..body = Code('''
            if (_${field.name} != null) return ${_removeVoidPropertyPrivate(field)};
            throw Exception('TODO name htis');'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsCheck(Sealed e,
        {bool isAbstract = false}) =>
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

Iterable<Method> _genNonCumputedFieldsOption(Sealed e,
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
  Sealed e, {
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

Iterable<Method> _genComputedFieldsGetter(Sealed e) => e.computedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.name
          ..returns = Reference(field.returnType)
          ..type = MethodType.getter
          ..body = Code('''return _${field.name} ??= super.${field.name};'''),
      ),
    );

String _replaceVoidReturnTypeWithBool(SealedField field) =>
    _isVoid(field) ? 'bool' : field.returnType;
String _removeReturnTypeVoid(SealedField field) =>
    _isVoid(field) ? '' : field.returnType;
String _removeVoidProperty(SealedField field) =>
    _isVoid(field) ? '' : field.name;
String _removeVoidPropertyPrivate(SealedField field) =>
    _isVoid(field) ? '' : '_' + field.name;
bool _isVoid(SealedField field) => field.returnType == 'void';
