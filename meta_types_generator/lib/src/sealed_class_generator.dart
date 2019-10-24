import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'meta_class.dart';
import 'meta_class_cache.dart';
import 'sealed_class.dart';
import 'option.dart';
import 'util.dart';

//// TODO: mixin
// TODO: fix $story
// Fix field type generics
Class generateSealedClass(SealedClass sealedClass) => Class((b) => b
  ..abstract = false
  ..types.addAll(
      sealedClass.metaClassReference.generics.map((g) => Reference(g.symbol)))
  ..constructors.addAll(_constructors(sealedClass))
  ..constructors.add(_defaultConstructor(sealedClass))
  ..name = sealedClass.metaClassReference.symbol
  // ..mixins = _mixins(sealedClass)
  ..types.addAll([])
  ..extend = Reference(
    '\$${sealedClass.metaClassReference.symbol}' +
        classGenerics(sealedClass.metaClassReference.generics),
    sealedClass.metaClassReference.url,
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

Class generateSealedClassBase(SealedClass sealedClass) => Class((b) => b
  ..abstract = true
  ..types.addAll(
      sealedClass.metaClassReference.generics.map((g) => Reference(g.symbol)))
  ..name = 'I' + sealedClass.metaClassReference.symbol
  ..extend = Reference('SealedClass')
  ..methods.addAll([
    ..._genNonCumputedFieldsOption(sealedClass, isAbstract: true),
    ..._genNonCumputedFieldsWhen(sealedClass, isAbstract: true),
    _when(sealedClass, isAbstract: true),
    _wheno(sealedClass, isAbstract: true),
  ]));

Constructor _defaultConstructor(SealedClass sealedClass) => new Constructor(
      (b) => b
        ..optionalParameters.addAll(
          sealedClass.allNonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..name = f.propertyName
                ..type = Reference(_replaceVoidReturnTypeWithBool(f)),
            ),
          ),
        )
        ..initializers.addAll(_initializers(sealedClass.allNonComputedFields))
        ..body = Code('''
        var found = false;
        ${_initializer(sealedClass.allNonComputedFields)}
        throw Exception("TODO");
        '''),
    );

Iterable<Reference> _mixins(SealedClass sealedClass) =>
    sealedClass.mixins.map((m) => Reference(m));

String _initializer(Iterable<SealedClassField> fields) => fields.fold(
    '',
    (comb, field) =>
        '$comb if (${field.propertyName} != null) { if (found) throw Exception("todo"); found = true; }');

Iterable<Code> _initializers(Iterable<SealedClassField> fields) => fields
    .map((field) => Code('_${field.propertyName} = ${field.propertyName}'));

Method _when(SealedClass sealedClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'when'
        ..types.add(Reference('WHEN'))
        ..returns = Reference('WHEN')
        ..optionalParameters.addAll(sealedClass.allNonComputedFields.map((f) =>
            Parameter((b) => b
              ..named = true
              ..name = f.propertyName
              ..type =
                  Reference('WHEN Function(${_removeReturnTypeVoid(f)})'))))
        ..body = isAbstract ? null : Code('''
          ${_cloneWhen(sealedClass)}
          throw FallThroughError();'''),
    );

Method _wheno(SealedClass sealedClass, {bool isAbstract = false}) => Method(
      (b) => b
        ..name = 'wheno'
        ..types.add(Reference('WHENO'))
        ..returns = Reference('WHENO')
        ..optionalParameters.add(Parameter((b) => b
          ..named = true
          ..name = 'otherwise'
          ..type = Reference('WHENO Function()')))
        ..optionalParameters.addAll(
          sealedClass.allNonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..name = f.propertyName
                ..type =
                    Reference('WHENO Function(${_removeReturnTypeVoid(f)})'),
            ),
          ),
        )
        ..body = isAbstract ? null : Code('''
          ${_cloneWhen(sealedClass)}
          return otherwise();'''),
    );

Iterable<Constructor> _constructors(SealedClass sealedClass) =>
    sealedClass.allNonComputedFields.map(
      (f) => Constructor(
        (b) => b
          ..constant = sealedClass.computedFields.isEmpty && sealedClass.isConst
          ..name = f.propertyName
          ..requiredParameters.addAll([
            if (f.returnTypeName != 'void')
              Parameter(
                (b) => b
                  ..name = f.propertyName
                  ..type = Reference(f.returnTypeName),
              ),
          ])
          ..initializers.addAll(
            sealedClass.allNonComputedFields.map(
              (ifield) => Code(
                ifield == f
                    ? (f.returnTypeName == 'void'
                        ? '_${ifield.propertyName} = true'
                        : 'assert(${ifield.propertyName} != null), _${ifield.propertyName} = ${ifield.propertyName}')
                    : '_${ifield.propertyName} = null',
              ),
            ),
          ),
      ),
    );

String _cloneWhen(SealedClass sealedClass) => sealedClass.allNonComputedFields.fold(
    '',
    (comb, field) =>
        '$comb if (_${field.propertyName} != null) { return ${field.propertyName}(${_removeVoidPropertyPrivate(field)}); }');

Method _equality(SealedClass sealedClass) => Method(
      (b) => b
        ..name = 'operator =='
        ..returns = TypeReference((b) => b..symbol = 'bool')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'other'
          ..type = Reference('dynamic')))
        ..body = Code('''
          if (identical(other, this)) return true;
          if (other is! ${sealedClass.metaClassReference.symbol}) return false;
          return ${_equalityFold(sealedClass.allNonComputedFields)};'''),
    );

String _equalityFold(Iterable<SealedClassField> e) => e
    .map((field) => '_${field.propertyName} == other._${field.propertyName}')
    .join('&&');

Method _hashCode(SealedClass sealedClass) => Method(
      (b) => b
        ..name = 'hashCode'
        ..type = MethodType.getter
        ..returns = TypeReference((b) => b..symbol = 'int')
        ..body = Code('''
          return \$jf(${_hashFold(sealedClass.allNonComputedFields)});'''),
    );

String _hashFold(Iterable<SealedClassField> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, _${field.propertyName}.hashCode)');

Method _toString(SealedClass sealedClass) => Method(
      (b) => b
        ..name = 'toString'
        ..returns = TypeReference((b) => b..symbol = 'String')
        ..body = Code('''
          final value = when(${_toStringWhen(sealedClass.allNonComputedFields)});
          return \'${sealedClass.metaClassReference.symbol}( \$value )\';'''),
    );

String _toStringWhen(Iterable<SealedClassField> e) => e.fold(
    '',
    (comb, field) =>
        '$comb${field.propertyName}: (${_removeVoidProperty(field)}) => \'${field.propertyName}${_isVoid(field) ? "" : " \$"}${_removeVoidProperty(field)}\',');

Iterable<Field> _genNonComputedFields(SealedClass e) =>
    e.allNonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..name = '_${field.propertyName}'
          ..type = Reference(
            _replaceVoidReturnTypeWithBool(field),
          ),
      ),
    );

Iterable<Field> _genComputedFields(SealedClass e) => e.computedFields.map(
      (field) => Field(
        (b) => b
          ..name = '_${field.propertyName}'
          ..type = Reference(field.returnTypeName),
      ),
    );

Iterable<Method> _genNonCumputedFieldsGetter(SealedClass e) =>
    e.allNonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.propertyName
          ..type = MethodType.getter
          ..returns = Reference(field.returnTypeName)
          ..body = Code('''
            if (_${field.propertyName} != null) return ${_removeVoidPropertyPrivate(field)};
            throw Exception('TODO name htis');'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsCheck(SealedClass e,
        {bool isAbstract = false}) =>
    e.allNonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = "is" + capitalize(field.propertyName)
          ..type = MethodType.getter
          ..returns = Reference('bool')
          ..body = isAbstract
              ? null
              : Code('''return _${field.propertyName} != null;'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsOption(SealedClass e,
        {bool isAbstract = false}) =>
    e.allNonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.propertyName + 'Option'
          ..type = MethodType.getter
          ..returns = Reference('Option<${field.returnTypeName}>')
          ..body = isAbstract
              ? null
              : Code(
                  '''return Option(${_removeVoidPropertyPrivate(field)});'''),
      ),
    );

Iterable<Method> _genNonCumputedFieldsWhen(
  SealedClass e, {
  bool isAbstract = false,
}) =>
    e.allNonComputedFields.map(
      (field) => Method(
        (b) => b
          ..name = 'when' + capitalize(field.propertyName)
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
                  '''if (_${field.propertyName} != null) handler(${_removeVoidPropertyPrivate(field)});'''),
      ),
    );

Iterable<Method> _genComputedFieldsGetter(SealedClass e) =>
    e.computedFields.map(
      (field) => Method(
        (b) => b
          ..name = field.propertyName
          ..returns = Reference(field.returnTypeName)
          ..type = MethodType.getter
          ..body = Code(
              '''return _${field.propertyName} ??= super.${field.propertyName};'''),
      ),
    );

String _replaceVoidReturnTypeWithBool(SealedClassField field) =>
    _isVoid(field) ? 'bool' : field.returnTypeName;
String _removeReturnTypeVoid(SealedClassField field) =>
    _isVoid(field) ? '' : field.returnTypeName;
String _removeVoidProperty(SealedClassField field) =>
    _isVoid(field) ? '' : field.propertyName;
String _removeVoidPropertyPrivate(SealedClassField field) =>
    _isVoid(field) ? '' : '_' + field.propertyName;
bool _isVoid(SealedClassField field) => field.returnTypeName == 'void';
