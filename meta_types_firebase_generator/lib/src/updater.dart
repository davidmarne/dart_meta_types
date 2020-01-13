import 'package:meta_types/meta_types_models.dart' as mtm;
import 'package:code_builder/code_builder.dart';
import 'models.dart';

Iterable<Class> updatersContext(Context context) =>
    context.schema.documentMetaTypes
        .map(
          (metaClass) => metaClass.when<mtm.Option<Class>>(
            data: (d) => mtm.Option.some(_dataUpdater(context, metaClass)),
            sealed: (s) => mtm.Option.some(_sumUpdater(context, metaClass)),
            sum: (s) => mtm.Option.some(_sumUpdater(context, metaClass)),
            enumeration: (e) => mtm.Option.none(),
          ),
        )
        .where((o) => o.isSome)
        .map((o) => o.some);

Class _dataUpdater(Context context, mtm.MetaSeal meta) => Class(
      (b) => b
        ..name = '${meta.name}Updater'
        ..types.addAll(
          meta.typeParameters.map(
            (t) => Reference(t.typeParameterStr),
          ),
        )
        ..extend = Reference('DocumentUpdater<${meta.name}>')
        ..constructors.add(
          Constructor((b) => b..name = '_'),
        )
        ..fields.addAll(_updaterGettersFields(context, meta))
        ..methods.addAll([
          ..._updaterDataSetters(context, meta),
          ..._updaterDataGetters(context, meta),
        ]),
    );

Class _sumUpdater(Context context, mtm.MetaSeal meta) => Class(
      (b) => b
        ..name = '${meta.name}Updater'
        ..types.addAll(
            meta.typeParameters.map((t) => Reference(t.typeParameterStr)))
        ..extend = Reference('DocumentUpdater<${meta.name}>')
        ..constructors.add(
          Constructor((b) => b..name = '_'),
        )
        ..fields.addAll(_updaterGettersFields(context, meta))
        ..methods.addAll([
          ..._sumSealUpdaterSetters(context, meta),
          ..._sumSealUpdaterGetters(context, meta),
        ]),
    );

Iterable<Method> _updaterDataGetters(Context context, mtm.MetaSeal meta) =>
    _nonServiceFields(meta.fields)
        .where((f) => !f.isComputed && _needsGetter(context, f))
        .map(
          (f) => Method(
            (b) => b
              ..type = MethodType.getter
              ..name = f.name + 'Updater'
              ..returns = Reference(
                _updaterGetterType(f),
              )
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = f.name
                    ..type = Reference(f.returnType.typeStr),
                ),
              )
              ..body = Code(_updaterDataGetterBody(context, f)),
          ),
        );

Iterable<Method> _updaterDataSetters(Context context, mtm.MetaSeal meta) =>
    _nonServiceFields(meta.fields)
        .where((f) => !f.isComputed && !_needsUpdater(context, f))
        .map(
          (f) => Method(
            (b) => b
              ..type = MethodType.setter
              ..name = f.name
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = f.name
                    ..type = Reference(f.returnType.typeStr),
                ),
              )
              ..body = Code('update[\'${f.name}\'] = ${f.name};'),
          ),
        );

Iterable<Field> _updaterGettersFields(Context context, mtm.MetaSeal meta) =>
    _nonServiceFields(meta.fields).where((f) => _needsUpdater(context, f)).map(
          (f) => Field((b) => b
            ..type = Reference(f.returnType.type + 'Updater')
            ..name = '_${f.name}'),
        );

Iterable<Method> _sumSealUpdaterGetters(Context context, mtm.MetaSeal meta) =>
    _nonServiceFields(meta.fields)
        .where(
          (f) => !f.isComputed && _needsGetter(context, f),
        )
        .map(
          (f) => Method(
            (b) => b
              ..type = MethodType.getter
              ..name = f.name + 'Updater'
              ..returns = Reference(
                _updaterGetterType(f),
              )
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = f.name
                    ..type = Reference(f.returnType.typeStr),
                ),
              )
              ..body = Code('''
          if (update['kind'] != '${f.name}') {
            update.clear();
          }
          _${f.name} ??= ${f.returnType.type}Updater._();
          update['kind'] = 'x';
          update['value'] = _${f.name};
          return _${f.name};
          '''),
          ),
        );

Iterable<Method> _sumSealUpdaterSetters(Context context, mtm.MetaSeal meta) =>
    _nonServiceFields(meta.fields)
        .where((f) => !f.isComputed && !_needsUpdater(context, f))
        .map(
          (f) => Method(
            (b) => b
              ..type = MethodType.setter
              ..name = f.name
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..name = f.name
                    ..type = Reference(f.returnType.typeStr),
                ),
              )
              ..body = Code('''
                if (update['kind'] != '${f.name}') {
                  update.clear();
                }
                update['kind'] = '${f.name}';
                update['value'] = ${f.returnType.type == "void" ? null : f.name};
              '''),
          ),
        );

bool _needsGetter(Context context, mtm.Field f) =>
    _needsUpdater(context, f) || customUpdaterTypes.contains(f.returnType.type);

bool _needsUpdater(Context context, mtm.Field f) {
  final metaFieldType = context.metaCache.find(f.returnType.type);
  return !f.isComputed &&
      metaFieldType.isSome &&
      !metaFieldType.some.isEnumeration;
}

const customUpdaterTypes = [
  'int',
  'double',
  'DateTime',
  'BuiltList',
  'BuiltMap',
];

String _updaterGetterType(mtm.Field field) {
  switch (field.returnType.type) {
    case 'int':
      return 'NumberUpdater<int>';
    case 'double':
      return 'NumberUpdater<double>';
    case 'DateTime':
      return 'DateTimeUpdater';
    case 'BuiltList':
      return 'ListUpdater${field.returnType.genericsStr}';
    case 'BuiltMap':
      return 'MapUpdater<${field.returnType.generics.some.last.typeStr}>';
    default:
      return '${field.returnType.type}Updater';
  }
}

String _updaterDataGetterBody(Context context, mtm.Field field) {
  switch (field.returnType.type) {
    case 'int':
      return 'return \$numberUpdater(\'${field.name}\');';
    case 'double':
      return 'return \$numberUpdater(\'${field.name}\');';
    case 'DateTime':
      return 'return \$dateTimeUpdater(\'${field.name}\');';
    case 'BuiltList':
      return 'return \$listUpdater(\'${field.name}\');';
    case 'BuiltMap':
      return 'return \$mapUpdater(\'${field.name}\');';
    default:
      return _objectGetterBody(
          context.metaCache.find(field.returnType.type).some, field);
  }
}

// String _updaterSumSealGetterBody(Context context, mtm.Field field) {
//   switch (field.returnType.type) {
//     case 'int':
//       return 'return \$numberUpdater(\'${field.name}\');';
//     case 'double':
//       return 'return \$numberUpdater(\'${field.name}\');';
//     case 'DateTime':
//       return 'return \$dateTimeUpdater(\'${field.name}\');';
//     case 'BuiltList':
//       return 'return \$listUpdater(\'${field.name}\');';
//     case 'BuiltMap':
//       return 'return \$mapUpdater(\'${field.name}\');';
//     default:
//       return _objectGetterBody(
//           context.metaCache.find(field.returnType.type).some, field);
//   }
// }

String _objectGetterBody(mtm.MetaSeal s, mtm.Field f) => '''
  _${f.name} ??= ${s.name}Updater._();
  update['${f.name}'] = _${f.name}.update;
  return _${f.name};
''';

Iterable<mtm.Field> _nonServiceFields(Iterable<mtm.Field> fields) =>
    fields; // TODO
