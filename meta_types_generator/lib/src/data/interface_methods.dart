import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types_models.dart'
    show Data, DataField, MetaInterface;
// import 'data_class_meta_generator.dart';
// import '../util.dart';
import '../common/code_builder_utils.dart';

// returns the copy method for each interface implemented
// by this dataclass
Iterable<Method> copyInterfaces(
  Data<DataField> dataClass, {
  bool isAbstract: false,
}) =>
    dataClass.interfaces.where((i) => !i.meta.isPrivate).map(
          (i) => _copyInterface(
            dataClass,
            i,
            isAbstract: isAbstract,
          ),
        );

Method _copyInterface(
  Data<DataField> dataClass,
  MetaInterface<DataField, Data<DataField>> interface, {
  bool isAbstract: false,
}) =>
    Method(
      (b) => b
        ..name = 'copy${interface.meta.name}'
        ..returns = classNameWithTypeArguments(
          dataClass.name,
          dataClass.typeParameters,
        )
        ..optionalParameters.addAll(
          _copyMethodParameters(dataClass.nonComputedFields.where((f) =>
              interface.meta.nonComputedFields
                  .any((ifi) => f.name == ifi.name))),
        )
        ..body = abstractBody(
          isAbstract,
          'return copy(${_copyInvocationParameters(interface.meta)});',
        ),
    );

// for dataInterfaces
Method copyInterface(
  Data<DataField> dataClass, {
  bool isAbstract: false,
}) =>
    Method(
      (b) => b
        ..name = 'copy${dataClass.name}'
        ..returns = classNameWithTypeArguments(
          dataClass.name,
          dataClass.typeParameters,
        )
        ..optionalParameters.addAll(
          _copyMethodParameters(dataClass.nonComputedFields),
        )
        ..body = abstractBody(
          isAbstract,
          'return copy(${_copyInvocationParameters(dataClass)});',
        ),
    );

// returns the copy method
Method copy(
  Data<DataField> dataClass, {
  bool isAbstract: false,
}) =>
    Method(
      (b) => b
        ..name = 'copy'
        ..returns = classNameWithTypeArguments(
          dataClass.name + (dataClass.isInterface ? 'Base' : ''),
          dataClass.typeParameters,
        )
        ..optionalParameters.addAll(
          _copyMethodParameters(dataClass.nonComputedFields),
        )
        ..body = abstractBody(
          isAbstract,
          'return ${dataClass.name}(${_copyInvocationParameters(dataClass)});',
        ),
    );

Iterable<Parameter> _copyMethodParameters(Iterable<DataField> fields) =>
    fields.map(
      (f) => Parameter(
        (b) => b
          ..named = true
          ..name = fieldParameterName(f)
          ..type = Reference(f.returnType.typeStr),
      ),
    );

String _copyInvocationParameters(Data<DataField> dataClass) =>
    dataClass.nonComputedFields.fold(
        '',
        (comb, field) =>
            '$comb${fieldParameterName(field)}: ${fieldParameterName(field)} ?? _${field.name},');
