import 'package:analyzer/dart/element/element.dart';
import 'generator_util.dart';
import 'enum_class.dart';

String generateEnumClass(Element e) => _generateEnumClass(getEnumClass(e));

String _generateEnumClass(EnumClass e) => _class(e) + _classBase(e);

String _classBase(EnumClass e) {
  var source = e.element.computeNode().toSource();

  // remove annotations
  source = source.substring(source.indexOf('abstract class'));

  // change the class name
  source = source.replaceFirst(e.templateClassName, e.baseClassName);
  source = source.replaceAll('\$', '');
  // add the extends clause
  source = source.replaceFirst(
      '{', 'extends EnumClass<${e.generatedClassName}, ${e.typeString}> {');
  source = source.replaceFirst(
      '{', '{ ${e.baseClassName}._(Type type) : super(type);');
  return source;
}

String _class(EnumClass e) => '''
  class ${e.generatedClassName} extends ${e.baseClassName} ${_mixins(e)} {
    final ${e.typeString} _value;
    
    static final values = Set<${e.generatedClassName}>.from(<${e.generatedClassName}>[
      ${valuesEntries(e)}
    ],);

    static ${e.generatedClassName} valueOf(${e.typeString} v) {
      ${valuesOfChecks(e)}
      return null;
    }

    ${e.generatedClassName}._(this._value) : super._(${e.typeString});

    ${generateEnumClassStaticFields(e)}

    @override
    ${e.typeString} get value => _value;
    
    @override
    ${e.generatedClassName} valueOfOther(${e.typeString} v) => ${e.generatedClassName}.valueOf(v);

    @override
    Set<${e.generatedClassName}> get allValues => ${e.generatedClassName}.values;

    ${generateEnumClassEquality(e)}

    ${generateEnumClassHashcode(e)}

    ${generateEnumClassToString(e)}
  }
''';

String generateEnumClassStaticFields(EnumClass e) => e.fields.fold(
    '',
    (params, field) =>
        '${params}static final ${e.generatedClassName} ${field.name} = new ${e.generatedClassName}._(${_constructorValue(e, field)});');

String _constructorValue(EnumClass e, Field f) {
  final redirectedValue = '${e.baseClassName}.${f.name}';
  if (e.typeString == 'int')
    return '$redirectedValue ?? ${e.fields.toList().indexOf(f)}';
  if (e.typeString == 'String') return '$redirectedValue ?? \'${f.name}\'';
  return redirectedValue;
}

String valuesEntries(EnumClass e) => e.fields.fold(
    '', (params, field) => '$params${e.generatedClassName}.${field.name},');

String valuesOfChecks(EnumClass e) => e.fields.fold(
    '',
    (params, field) =>
        '${params}if(${e.generatedClassName}.${field.name}.value == v) return ${e.generatedClassName}.${field.name};');

String generateEnumClassEquality(EnumClass e) => '''
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ${e.generatedClassName}) return false;
    return value == other.value;
  }
  ''';

String generateEnumClassHashcode(EnumClass e) => '''
  @override
  int get hashCode {
    return \$jf(\$jc(0, value.hashCode));
  }
''';

String generateEnumClassToString(EnumClass e) => '''
  @override
  String toString() {
    ${_generateEnumClassToStringClauses(e)}
    return '';
  }
''';

String _generateEnumClassToStringClauses(EnumClass e) => e.fields.fold(
    '',
    (comb, next) =>
        '${comb}if (this == ${e.generatedClassName}.${next.name}) return \'${e.generatedClassName}.${next.name}: \$_value\';');

String generateEnumName(String name) {
  if (name.startsWith('_\$')) return name.substring(2);
  return name.substring(1);
}

String _mixins(EnumClass e) => e.mixins.isEmpty
    ? ''
    : 'with ' + e.mixins.map((m) => m.generatedName).join(',');
