import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, MetaInterface;

Field metaField(Data<DataField> d) => Field((b) => b
  ..name = '_meta\$'
  ..type = Reference('Data<DataValue>'));

Method metaGetter(Data<DataField> d) => Method(
      (b) => b
        ..name = 'meta\$'
        ..returns = Reference('Data<DataValue>')
        ..type = MethodType.getter
        ..lambda = true
        ..body = Code('''
          _meta\$ ??= ${_fromData(d)}
        '''),
    );

String _fromData(Data<DataField> d) => '''
  Data<DataValue>(
            isFinal: ${d.isFinal},
            isInterface: ${d.isInterface},
            isConst: ${d.isConst},
            name: '${d.name}',
            isPrivate: ${d.isPrivate},
            fields: [${_fields(d)}],
            interfaces: [${_interfaces(d)}],
          )
''';

String _fields(Data<DataField> d) => d.fields.map(_fieldReturnValue).join(',');

String _fieldReturnValue(DataField f) => '''DataValue(
        name: '${f.name}',
        returnType: FieldType(
          type: '${f.returnType.type}',
        ),
        isComputed: ${f.isComputed},
        value: _${f.name},
        isAbstract: ${f.isAbstract},
        isDefaulted: ${f.isDefaulted},
    )''';

String _interfaces(Data<DataField> d) =>
    d.interfaces.map(_interfacesReturnValue).join(',');

String _interfacesReturnValue(MetaInterface<DataField, Data<DataField>> m) =>
    '''MetaInterface<Data<DataValue>>(
        meta: ${_fromData(m.meta)},
    )''';
