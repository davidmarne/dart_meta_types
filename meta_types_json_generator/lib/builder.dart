import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:meta_types_generator/generator_api.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

Builder metaTypesjson(BuilderOptions options) =>
    new SharedPartBuilder([new _MetaTypesjsonGenerator()], 'meta_types_json');

class _MetaTypesjsonGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    for (final element in library.allElements) {
      try {
        if (_elementHasJsonAnnotation(element)) {
          result.write(_generateMixin(element));
        }
      } catch (e, s) {
        log.severe('failed to generate class for ${element.name}. $s', e, s);
      }
    }

    return result.toString();
  }

  bool _elementHasJsonAnnotation(Element e) =>
      e.metadata.any((a) => a.computeConstantValue().type.name == 'MetaJson');

  String _generateMixin(Element e) {
    final meta = e.metadata
        .firstWhere((a) => a.computeConstantValue().type.name == 'MetaJson')
        .computeConstantValue();

    final metaType = elementMetaType(e);
    switch (metaType) {
      case MetaTypes.dataClass:
        return _dataClass(getDataClass(e), meta.type.name);
      case MetaTypes.enumClass:
        return _enumClass(getEnumClass(e), meta.type.name);
      case MetaTypes.sealedClass:
        return _sealedClass(getSealedClass(e), meta.type.name);
      default:
        throw Exception('invalid meta type');
    }
  }

  String _dataClass(DataClass d, String metaTypeName) {
    final mixin =
        d.mixins.firstWhere((m) => m.constValue.type.name == metaTypeName);
    final mixinClassName = mixin.generatedName;
    return '''
      abstract class $mixinClassName implements ${mixin.baseClassName}, ToJson {
        ${_fromJsonDataClass(d)}
       dynamic toJson() => <String, dynamic>{${_toJsonParams(d)}};
      }
    ''';
  }

  String _enumClass(EnumClass e, String metaTypeName) {
    final mixin =
        e.mixins.firstWhere((m) => m.constValue.type.name == metaTypeName);
    final mixinClassName = mixin.generatedName;
    return '''
      abstract class $mixinClassName implements ${mixin.baseClassName}, ToJson {
        ${_fromJsonEnumClass(e)}
        dynamic toJson() => value;
      }
    ''';
  }

  String _sealedClass(SealedClass s, String metaTypeName) {
    final mixin =
        s.mixins.firstWhere((m) => m.constValue.type.name == metaTypeName);
    final mixinClassName = mixin.generatedName;
    return '''
      abstract class $mixinClassName implements ${mixin.baseClassName}, ToJson {
        ${_fromJsonSealedClass(s)}
        dynamic toJson() => when(
          ${_toJsonSealedFields(s)}
        );
      }
    ''';
  }

  String _fromJsonDataClass(DataClass d) =>
      '''static ${d.generatedClassName} fromJson(dynamic j) {
        final m = j as Map<String, dynamic>;
        return ${d.generatedClassName}(${_genDataClassConstructorInputs(d)});
      }''';

  String _fromJsonEnumClass(EnumClass d) =>
      'static ${d.generatedClassName} fromJson(dynamic j) => ${d.generatedClassName}.valueOf(${_typeCast(d.type, d.typeString, "j")});';

  String _fromJsonSealedClass(SealedClass d) =>
      '''static ${d.generatedClassName} fromJson(dynamic j) { 
        final m = j as Map<String, dynamic>;
        switch (m.keys.first) {
          ${_sealedKeysCases(d)}
          default:
          throw Exception(\'invalid key \${m.keys.first}\');
        }
      }''';

  String _sealedKeysCases(SealedClass d) => d.unionFields.fold(
      '',
      (comb, f) =>
          '${comb}case \'${f.name}\': return ${d.generatedClassName}.${f.name}Factory(${_typeCast(f.dartType, f.typeString, "m.values.first")});');

  String _toJsonSealedFields(SealedClass s) => s.unionFields.fold(
      '',
      (comb, next) =>
          '${comb}${next.name}: (v) => <String, dynamic>{\'${next.name}\': v},');

  String _genDataClassConstructorInputs(DataClass d) => d.nonComputedFields
      .fold('', (comb, f) => '$comb${_genDataClassConstructorInput(f)},');

  String _genDataClassConstructorInput(Field f) {
    final lookup = 'm[\'${f.name}\']';
    return '${f.name}: ${_typeCast(f.dartType, f.typeString, lookup)}';
  }

  String _typeCast(DartType t, String typeString, String value) {
    if (typeString.startsWith('List<'))
      return '${typeString}.unmodifiable(${_genListCast(t, value)})';
    if (typeString.startsWith('Map<'))
      return '${typeString}.unmodifiable(${_genMapCast(t, typeString, value)})';
    if (typeString.startsWith('Set<'))
      return '${typeString}.from(${_genSetCast(t, value)})';
    if (_elementHasJsonAnnotation(t.element))
      return '${typeString}MetaJson.fromJson($value)';
    return '$value as ${typeString}';
  }

  // TODO: recursive searches for nested lists/maps/sets
  String _genMapCast(DartType t, String typeString, String lookup) {
    final args = (t as InterfaceType).typeArguments;
    final keyType = args.elementAt(0);
    final valueType = args.elementAt(1);
    final keyIsMetaType = _elementHasJsonAnnotation(keyType.element);
    final valIsMetaType = _elementHasJsonAnnotation(valueType.element);
    final keyTypeStr = keyType.name.replaceAll('\$', '');
    final valTypeStr = valueType.name.replaceAll('\$', '');
    if (!keyIsMetaType && !valIsMetaType)
      return '($lookup as Map<dynamic, dynamic>).cast<$keyTypeStr, $valTypeStr>()';

    String keyParam, valParam;
    if (keyIsMetaType)
      keyParam =
          '($lookup as Map<dynamic, dynamic>).keys.map((dynamic k) => ${keyTypeStr}MetaJson.fromJson(k as Map<String, dynamic>))';
    else
      keyParam = '($lookup as Map<dynamic, dynamic>).keys.cast<$keyTypeStr>()';

    if (valIsMetaType)
      valParam =
          '($lookup as Map<dynamic, dynamic>).values.map((dynamic k) => ${valTypeStr}MetaJson.fromJson(k as Map<String, dynamic>))';
    else
      valParam =
          '($lookup as Map<dynamic, dynamic>).values.cast<$valTypeStr>()';

    return '${typeString}.fromIterables($keyParam, $valParam)';
  }

  // TODO: recursive searches for nested lists/maps/sets
  String _genListCast(DartType t, String lookup) {
    final typeparam = (t as InterfaceType).typeArguments.elementAt(0);
    if (!_elementHasJsonAnnotation(typeparam.element))
      return '($lookup as List<dynamic>).cast<${typeparam.name.replaceAll('\$', '')}>()';
    return '($lookup as List<dynamic>).map((dynamic v) => ${typeparam.name.replaceAll('\$', '')}MetaJson.fromJson(v as Map<String, dynamic>)).toList()';
  }

  String _genSetCast(DartType t, String lookup) {
    final typeparam = (t as InterfaceType).typeArguments.elementAt(0);
    if (!_elementHasJsonAnnotation(typeparam.element))
      return '($lookup as List<dynamic>).cast<${typeparam.name.replaceAll('\$', '')}>().toSet()';
    return '($lookup as List<dynamic>).map((dynamic v) => ${typeparam.name.replaceAll('\$', '')}MetaJson.fromJson(v as Map<String, dynamic>)).toSet()';
  }

  String _toJsonParams(DataClass d) => d.nonComputedFields
      .fold('', (comb, f) => '$comb\'${f.name}\': \$toJson(${f.name}),');
}
