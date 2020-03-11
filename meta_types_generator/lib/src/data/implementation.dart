import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart' show Data, DataField;

import '../common/code_builder_utils.dart';
import 'interface_methods.dart';

Class generateData(Data<DataField> dataClass) => Class(
      (b) => b
        ..abstract = false
        ..types.addAll(
          typeParameterReferences(dataClass.typeParameters),
        )
        ..constructors.add(
          _defaultConstructor(dataClass),
        )
        ..name = dataClass.name
        ..extend = templateExtension(dataClass.name, dataClass.typeParameters)
        ..fields.addAll([
          // if dataclass is const don't memoize computed fields
          if (!dataClass.isConst)
            ...computedFields(dataClass.computedFields),
          ..._genNonComputedFields(dataClass)
        ])
        ..methods.addAll([
          ..._nonDefaultedFieldsGetter(dataClass),
          ..._defaultedFieldsGetter(dataClass),
          if (!dataClass.isConst)
            ...computedFieldMethods(dataClass.computedFields),
          copy(dataClass),
          ...copyInterfaces(dataClass),
          hashCode(
            hashBodyForFields(dataClass.nonComputedFields),
          ),
          equality(
            dataClass.name,
            _equalityFold(dataClass.nonComputedFields),
          ),
          toString(
            dataClass.name,
            _toStringFold(dataClass.nonComputedFields),
          ),
        ]),
    );

Constructor _defaultConstructor(Data<DataField> dataClass) => new Constructor(
      (b) => b
        ..constant = dataClass.isConst
        ..initializers.addAll(
          dataClass.nonComputedFields.map(_initializer).expand((i) => i),
        )
        ..optionalParameters.addAll(
          dataClass.nonComputedFields.map(
            (f) => Parameter(
              (b) => b
                ..named = true
                ..annotations.addAll(
                  required(!f.isDefaulted),
                )
                ..name = fieldParameterName(f)
                ..type = Reference(f.returnType.typeStr),
            ),
          ),
        ),
    );

Iterable<Code> _initializer(DataField field) => [
      Code('_${field.name} = ${fieldParameterName(field)}'),
      if (!field.isDefaulted)
        Code('assert(${fieldParameterName(field)} != null)'),
    ];

String _equalityFold(Iterable<DataField> fields) =>
    fields.map((field) => '${field.name} == other.${field.name}').join('&&');

String _toStringFold(Iterable<DataField> e) =>
    e.map((field) => '${field.name}: \$${field.name}').join(', ');

Iterable<Field> _genNonComputedFields(Data e) => e.nonComputedFields.map(
      (field) => Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..name = '_${field.name}'
          ..type = Reference(field.returnType.typeStr),
      ),
    );

Iterable<Method> _nonDefaultedFieldsGetter(Data e) => e.nonDefaultedFields.map(
      (field) => Method(
        (b) => b
          ..annotations.add(Reference('override'))
          ..name = field.name
          ..returns = Reference(field.returnType.typeStr)
          ..type = MethodType.getter
          ..body = Code('return _${field.name};'),
      ),
    );

Iterable<Method> _defaultedFieldsGetter(Data e) => e.defaultedFields.map(
      (field) => Method(
        (b) => b
          ..annotations.add(Reference('override'))
          ..name = field.name
          ..returns = Reference(field.returnType.typeStr)
          ..type = MethodType.getter
          ..body = Code('return _${field.name} ?? super.${field.name};'),
      ),
    );
