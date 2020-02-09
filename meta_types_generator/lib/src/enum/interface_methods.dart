import 'package:code_builder/code_builder.dart';
import '../common/code_builder_utils.dart';
import 'common.dart';

Method valueGetter({
  bool isAbstract: false,
}) =>
    Method(
      (b) => b
        ..name = 'value'
        ..body = abstractBody(isAbstract, '_value')
        ..lambda = !isAbstract
        ..type = MethodType.getter
        ..returns = Reference(enumGenericName),
    );

Method ordinalGetter({
  bool isAbstract: false,
}) =>
    Method(
      (b) => b
        ..name = 'ordinal'
        ..body = abstractBody(isAbstract, 'values.indexOf(this)')
        ..lambda = !isAbstract
        ..type = MethodType.getter
        ..returns = Reference(enumGenericName),
    );
