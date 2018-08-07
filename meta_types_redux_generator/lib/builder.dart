import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:meta_types_generator/generator_api.dart';
import 'package:analyzer/dart/element/element.dart';

Builder metaTypesRedux(BuilderOptions options) =>
    new SharedPartBuilder([new _MetaTypesReduxGenerator()], 'meta_types_redux');

class _MetaTypesReduxGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    for (final element in library.allElements) {
      try {
        if (_elementHasActionsAnnotation(element)) {
          result.write(_generateMixin(element));
        }
      } catch (e, s) {
        log.severe('failed to generate class for ${element.name}. $s', e, s);
      }
    }

    return result.toString();
  }

  bool _elementHasActionsAnnotation(Element e) =>
      e.metadata.any((a) => a.computeConstantValue().type.name == 'Actions');

  String _generateMixin(Element e) {
    final meta = e.metadata
        .firstWhere((a) => a.computeConstantValue().type.name == 'Actions')
        .computeConstantValue();

    final sealedClass = getSealedClass(e);
    final mixin = sealedClass.mixins
        .firstWhere((m) => m.constValue.type.name == meta.type.name);

    final stateType = meta.getField('stateType').toTypeValue();
    final stateTypeString = getDataClass(stateType.element).generatedClassName;
    final mixinClassName = mixin.generatedName;
    return '''
      abstract class $mixinClassName implements ${mixin.baseClassName}{
        ${_genReduce(stateTypeString, sealedClass)}
        ${_genMWHandler(stateTypeString, sealedClass.generatedClassName, sealedClass)}
      }
    ''';
  }

  String _genReduce(String stateType, SealedClass e) => '''
    $stateType reduce(
      $stateType state,{
      ${_genReduceParameters(stateType, e)}
    }) {
      ${_genReduceConditions(e)}
    }
  ''';

  String _genReduceParameters(String stateType, SealedClass e) =>
      e.unionFields.fold(
          '',
          (params, field) => '''$params
    @required $stateType ${field.name}($stateType state, ${field.typeString} ${field.name}),
  ''');

  String _genReduceConditions(SealedClass e) => e.unionFields.fold(
      '',
      (params, field) => field == e.unionFields.last
          ? '''$params
  return ${field.name}(state, this.${field.name});'''
          : '''$params
  if (${field.name}Set) return ${field.name}(state, this.${field.name});''');

  String _genMWHandler(String stateType, String actionsType, SealedClass e) =>
      '''
    FutureOr<void> handleMiddleware(
      MiddlewareApi<$stateType, $actionsType> api,
      MetaNextDispatcher next, {
      ${_genMWHandlerParameters(stateType, actionsType, e)}
    }) {
      ${_genMWHandlerConditions(e)}
    }
  ''';

  String _genMWHandlerParameters(
          String stateType, String actionsType, SealedClass e) =>
      e.unionFields.fold(
          '',
          (params, field) => '''$params
    @required FutureOr<void> ${field.name}(MiddlewareApi<$stateType, $actionsType> api, MetaNextDispatcher next, ${field.typeString} ${field.name}),
  ''');

  String _genMWHandlerConditions(SealedClass e) => e.unionFields.fold(
      '',
      (params, field) => field == e.unionFields.last
          ? '''$params
  return ${field.name}(api, next, this.${field.name});'''
          : '''$params
  if (${field.name}Set) return ${field.name}(api, next, this.${field.name});''');
}
