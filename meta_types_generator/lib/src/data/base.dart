import 'package:code_builder/code_builder.dart';
import 'package:meta_types/meta_types.dart' show Data, DataField;

import '../common/code_builder_utils.dart';
import 'interface_methods.dart';

// TODO: conditionally return
Class generateDataBase(Data<DataField> dataClass) => Class(
      (b) => b
        ..abstract = true
        ..types.addAll(
          typeParameterReferences(dataClass.typeParameters),
        )
        ..name = dataClass.name + 'Base'
        ..methods.addAll([
          if (!dataClass.isInterface)
            copy(dataClass, isAbstract: true)
          else
            copyInterface(dataClass, isAbstract: true),
          ...copyInterfaces(dataClass, isAbstract: true),
        ]),
    );
