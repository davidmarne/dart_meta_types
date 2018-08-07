import 'package:analyzer/dart/element/element.dart';
import 'generator_util.dart';
import 'data_class.dart';

String generateDataClass(Element e) => _dataClass(getDataClass(e));

String _dataClass(DataClass e) =>
    e.isInterface ? _interface(e) : _classBase(e) + _class(e);

String _interface(DataClass e) {
  var source = e.element.computeNode().toSource();
  source = source.replaceRange(
    source.lastIndexOf('}'),
    source.lastIndexOf('}') + 1,
    _abstractClone(e) + '}',
  );

  // remove annotation
  source = source.replaceRange(
      source.indexOf('@DataClass'), source.indexOf(')') + 1, '');

  // change the class name
  source = source.replaceFirst(e.templateClassName, e.generatedClassName);
  return source;
}

String _class(DataClass e) => '''
  ${_abstract(e)} class ${e.generatedClassName}${_generics(e)} extends ${e.baseClassName}${_generics(e)} ${_mixins(e)} ${_interfaces(e)} {
    ${_genFields(e)}

    ${_constructor(e)}

    ${_clone(e)}

    ${_cloneInterfaces(e)}

    ${_cloneSupertypes(e)}

    ${_getters(e)}

    ${_equality(e)}

    ${_hashCode(e)}
  }
''';

String _metaImplementations(DataClass e) => """
    @override
    Iterable<ComputedField> get computedFields => [${_computedFieldsReturnValue(e)}];

    @override
    Iterable<DataClassField> get nonDefaultedFields => [${_nonDefaultedFieldsReturnValue(e)}];

    @override
    Iterable<DataClassField> get defaultedFields => [${_defaultedFieldsReturnValue(e)}];

    Iterable<DataClassField> _fields;
    @override
    Iterable<DataClassField> get fields => _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
""";

String _generics(DataClass e) {
  return e.element.typeParameters.isEmpty
      ? ''
      : '<${e.element.typeParameters.map((p) => p.name).join(",")}>';
}

String _classBase(DataClass e) {
  var source = e.element.computeNode().toSource();

  // remove annotations
  source = source.substring(source.indexOf('abstract class'));

  // change the class name
  source = source.replaceFirst(e.templateClassName, e.baseClassName);
  source = source.replaceAll('\$', '');

  if (e.supertype == null && e.interfaces.isEmpty) {
    // if there is no supertype make it extend DataClass
    source = source.replaceFirst('{', 'extends DataClass {');
  } else if (e.supertype == null && e.interfaces.isNotEmpty) {
    source = source.replaceFirst('implements', 'extends DataClass implements');
  } else {
    source = source.replaceFirst('{', '{ ${_baseConstructor(e)}');
  }

  final closingBracket = source.lastIndexOf('}');
  source =
      source.replaceRange(closingBracket, null, _metaImplementations(e) + '}');

  // strip generator tokens on interface
  return e.interfaces.fold(
      source,
      (source, interface) => source.replaceFirst(
          interface.templateClassName, interface.generatedClassName));
}

String _interfaces(DataClass e) => e.interfaces.isEmpty
    ? ''
    : 'implements ' + e.interfaces.map((i) => i.generatedClassName).join(',');

String _mixins(DataClass e) => e.mixins.isEmpty
    ? ''
    : 'with ' + e.mixins.map((m) => m.generatedName).join(',');

String _abstract(DataClass e) => e.isAbstract ? 'abstract' : '';

String _equality(DataClass e) => '''
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ${e.generatedClassName}) return false;
    return ${_equalityFold(e.nonComputedFields)};
  }
  ''';

String _equalityFold(Iterable<Field> e) =>
    e.map((field) => '${field.name} == other.${field.name}').join('&&');

String _hashCode(DataClass e) => '''
  @override
  int get hashCode {
    return \$jf(${_hashFold(e.nonComputedFields)});
  }
''';

String _hashFold(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, ${field.name}.hashCode)');

String _baseConstructor(DataClass e) => '''
  ${e.baseClassName}(
    ${_genConstructorParams(e.supertype)}
  ) : super(
      ${_superConstructorParams(e)}
    );''';

String _constructor(DataClass e) => '''
  ${e.generatedClassName}(
    ${_genConstructorParams(e)}
  ) : ${initializer(e)}, super(
      ${_superConstructorParams(e)}
    ) {
    ${_genNullAssertions(e)}
  }''';

String _cloneInterfaces(DataClass e) => e.interfaces
    .fold('', (combined, next) => '$combined\n${_cloneInterface(e, next)}');

String _cloneSupertypes(DataClass e) => e.supertypes
    .fold('', (combined, next) => '$combined\n${_cloneSupertype(e, next)}');

String _cloneSupertype(DataClass e, DataClass supertype) => e.isAbstract
    ? _abstractCloneSupertype(e, supertype)
    : _cloneInterface(e, supertype);

String _cloneInterface(DataClass e, DataClass supertype) {
  var params = _genOptionalCloneParams(supertype);
  if (params.isNotEmpty) params = '{$params}';
  return '''
    @override
    ${e.generatedClassName} clone${supertype.generatedClassName}(
      $params
    ) => ${_cloneName(e)}(
      ${_genCloneInitializer(supertype)}
    );
  ''';
}

String _abstractCloneSupertype(DataClass e, DataClass supertype) {
  var params = _genOptionalCloneParams(supertype);
  if (params.isNotEmpty) params = '{$params}';
  return '''
    @override
    ${e.generatedClassName} clone${supertype.generatedClassName}(
      $params
    );
  ''';
}

String _clone(DataClass e) {
  var params = _genOptionalCloneParams(e);
  if (params.isNotEmpty) params = '{$params}';
  if (e.isInterface || e.isAbstract)
    return '''
    ${e.generatedClassName} clone${e.generatedClassName}(
      $params
    );
  ''';
  else
    return '''
    ${e.generatedClassName} ${_cloneName(e)}(
      $params
    ) => new ${e.generatedClassName}${_generics(e)}(
      ${_genCloneInitializer(e)}
    );
  ''';
}

String _cloneName(DataClass e) =>
    e.isFinal ? 'clone' : 'clone${e.generatedClassName}';

String _abstractClone(DataClass e) {
  var params = _genOptionalCloneParams(e);
  if (params.isNotEmpty) params = '{$params}';
  return '''
    ${e.generatedClassName} clone${e.generatedClassName}(
      $params
    );
  ''';
}

String _genNullAssertions(DataClass e) => e.nonComputedFields.fold(
    '',
    (params, field) =>
        '${params}assert(this.${field.name} != null, "null value provided for field ${field.name}");');

String _genCloneInitializer(DataClass e) => e.allFields.fold(
    '',
    (params, field) =>
        '${params}${field.name}: ${field.name} ?? _${field.name},');

String _genOptionalCloneParams(DataClass e) => e.allFields
    .fold('', (params, field) => '${params}${field.typeString} ${field.name},');

String _genFields(DataClass e) =>
    _finalFields(e.nonDefaultedFields) +
    _finalFields(e.defaultedFields) +
    _variableFields(e.computedFields);

String _finalFields(Iterable<Field> e) => e.fold('',
    (params, field) => '${params}final ${field.typeString} _${field.name};');

String _variableFields(Iterable<Field> e) => e.fold(
    '', (params, field) => '${params}${field.typeString} _${field.name};');

String _getters(DataClass e) =>
    _nonDefaulGetters(e.nonDefaultedFields) +
    _defaultGetters(e.defaultedFields) +
    _memozedGetter(e.computedFields);

String _nonDefaulGetters(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '${params}\n@override\n${field.typeString} get ${field.name} => _${field.name};');

String _defaultGetters(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '${params}\n@override\n${field.typeString} get ${field.name} => _${field.name} ?? super.${field.name};');

String _memozedGetter(Iterable<Field> e) => e.fold(
    '',
    (params, field) =>
        '${params}\n@override\n${field.typeString} get ${field.name} => _${field.name} ??= super.${field.name};');

String _genConstructorParams(DataClass e) {
  final params = _genRequiredConstructorParams(e) +
      e.supertypes.fold<String>(
          '', (comb, st) => comb + _genRequiredConstructorParams(st)) +
      _genOptionalConstructorParams(e) +
      e.supertypes.fold<String>(
          '', (comb, st) => comb + _genOptionalConstructorParams(st));
  if (params.isEmpty) return params;
  return '{$params}';
}

String _superConstructorParams(DataClass e) =>
    e.supertypes.fold('', (comb, st) => comb + _superParams(st));

String initializer(DataClass e) {
  final optionalParamsInitializers = _genOptionalConstructorInitializer(e);

  if (optionalParamsInitializers.isEmpty) return '';
  return '$optionalParamsInitializers';
}

String _superParams(DataClass e) => e.nonComputedFields
    .fold('', (params, field) => '${params}${field.name}: ${field.name},');

String _genRequiredConstructorParams(DataClass e) => e.nonDefaultedFields.fold(
    '',
    (params, field) => '${params}@required ${field.typeString} ${field.name},');

String _genOptionalConstructorParams(DataClass e) => e.defaultedFields
    .fold('', (params, field) => '${params}${field.typeString} ${field.name},');

String _genOptionalConstructorInitializer(DataClass e) => e.nonComputedFields
    .map((field) => '_${field.name} = ${field.name}')
    .join(',');

String _computedFieldsReturnValue(DataClass e) =>
    e.computedFields.map(_computedFieldReturnValue).join(',');
String _nonDefaultedFieldsReturnValue(DataClass e) =>
    e.nonDefaultedFields.map(_fieldReturnValue).join(',');
String _defaultedFieldsReturnValue(DataClass e) =>
    e.defaultedFields.map(_fieldReturnValue).join(',');

String _computedFieldReturnValue(Field e) =>
    'new ComputedField<${e.typeString}>(\"${e.name}\")';
String _fieldReturnValue(Field e) =>
    'new DataClassField<${e.typeString}>(\"${e.name}\")';
