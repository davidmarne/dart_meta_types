import 'package:analyzer/dart/element/element.dart';

import 'generator_util.dart';
import 'sealed_class.dart';

String generateSealedClass(Element e) =>
    _generateSealedClass(getSealedClass(e));

String _generateSealedClass(SealedClass e) => _class(e) + _classBase(e);

String _classBase(SealedClass e) {
  var source = e.element.computeNode().toSource();

  // remove annotations
  source = source.substring(source.indexOf('abstract class'));

  // change the class name
  source = source.replaceFirst(e.templateClassName, e.baseClassName);
  source = source.replaceAll('\$', '');

  // make it extend SealedClass
  if (e.interfaces.isEmpty) {
    source = source.replaceFirst('{', 'extends SealedClass {');
  } else {
    source =
        source.replaceFirst('implements', 'extends SealedClass implements');
  }

  final closingBracket = source.lastIndexOf('}');
  source = source.replaceRange(
      closingBracket,
      null,
      _abstractFieldIsSets(e.unionFields) +
          _metaImplementations(e) +
          _genAbstractWhen(e) +
          '}');

  // strip generator tokens on interface
  return e.interfaces.fold(
      source,
      (source, interface) => source.replaceFirst(
          interface.templateClassName, interface.generatedClassName));
}

String _mixins(SealedClass e) => e.mixins.isEmpty
    ? ''
    : 'with ' + e.mixins.map((m) => m.generatedName).join(',');

String _class(SealedClass e) => '''
  class ${e.generatedClassName}${_generics(e)} extends ${e.baseClassName}${_generics(e)} ${_mixins(e)} ${_interfaces(e)} {
    ${_genFields(e)}

    ${_genConstructors(e)}

    ${_genGetters(e)}

    ${_genWhen(e)}

    ${_genEquality(e)}

    ${_genHashCode(e)}
  }
''';

String _metaImplementations(SealedClass e) => """
    @override
    Iterable<ComputedField> get computedFields => [${_computedFieldsReturnValue(e)}];

    @override
    Iterable<SealedClassField> get unionFields => [${_unionFieldsReturnValue(e)}];
""";

String _genWhen(SealedClass e) => '''
  W when<W>({
    ${_genWhenParameters(e)}
  }) {
    ${_genWhenConditions(e)}
  }
  ''';

String _genAbstractWhen(SealedClass e) => '''
  W when<W>({
    ${_genWhenParameters(e)}
  });
  ''';

String _genWhenParameters(SealedClass e) => e.unionFields.fold(
    '',
    (params, field) => '''$params
  @required W ${field.name}(${field.typeString} ${field.name}),
 ''');

String _genWhenConditions(SealedClass e) => e.unionFields.fold(
    '',
    (params, field) => field == e.unionFields.last
        ? '''$params
  return ${field.name}(this.${field.name});'''
        : '''$params
  if (_${field.name}Set) return ${field.name}(this.${field.name});''');

String _genEquality(SealedClass e) => '''
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ${e.generatedClassName}) return false;
    return ${_equalityFold(e.unionFields)};
  }
  ''';

String _equalityFold(Iterable<Field> e) =>
    e.map((field) => '${field.name} == other.${field.name}').join('&&');

String _genHashCode(SealedClass e) => '''
  @override
  int get hashCode {
    return \$jf(${_hashFold(e.unionFields)});
  }
''';

String _interfaces(SealedClass e) => e.interfaces.isEmpty
    ? ''
    : 'implements ' + e.interfaces.map((i) => i.generatedClassName).join(',');

String _hashFold(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, ${field.name}.hashCode)');

String _generics(SealedClass e) {
  return e.element.typeParameters.isEmpty
      ? ''
      : '<${e.element.typeParameters.map((p) => p.name).join(",")}>';
}

String _genConstructors(SealedClass e) => e.unionFields
    .fold('', (params, field) => params + generateUnionConstructor(e, field));

String generateUnionConstructor(SealedClass e, Field field) => '''
  ${e.generatedClassName}.${field.name}Factory(this._${field.name}) :
    ${_uninitializedInitializers(e, field)}
    _${field.name}Set = true;

''';

String _uninitializedInitializers(SealedClass e, Field field) =>
    e.unionFields.where((f) => f.name != field.name).fold(
        '',
        (params, f) => f == field
            ? '$params'
            : '''$params
  _${f.name}Set = false,
  _${f.name} = null,
''');

String _genFields(SealedClass e) =>
    _finalFields(e.unionFields) + _variableFields(e.computedFields);

String _finalFields(Iterable<Field> e) => e.fold(
    '',
    (params, field) => '''${params}
    final ${field.typeString} _${field.name};
    final bool _${field.name}Set;
    ''');

String _variableFields(Iterable<Field> e) => e.fold(
    '', (params, field) => '${params}${field.typeString} _${field.name};');

String _genGetters(SealedClass e) =>
    _unionFieldGetters(e.unionFields) + _memozedGetter(e.computedFields);

String _unionFieldGetters(Iterable<Field> e) => e.fold(
    '',
    (params, field) => '''${params}
        ${field.typeString} get ${field.name} => _${field.name};
        bool get ${field.name}Set => _${field.name}Set;
        ''');

String _memozedGetter(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '${params}${field.typeString} get ${field.name} => _${field.name} ??= super.${field.name};');

String _computedFieldsReturnValue(SealedClass e) =>
    e.computedFields.map(_computedFieldReturnValue).join(',');
String _unionFieldsReturnValue(SealedClass e) =>
    e.unionFields.map(_fieldReturnValue).join(',');

String _computedFieldReturnValue(Field e) =>
    'new ComputedField<${e.typeString}>(\"${e.name}\")';
String _fieldReturnValue(Field e) =>
    'new SealedClassField<${e.typeString}>(\"${e.name}\")';

String _abstractFieldIsSets(Iterable<Field> e) => e.fold(
    '',
    (params, field) => '''${params}
        bool get ${field.name}Set;
        ''');
