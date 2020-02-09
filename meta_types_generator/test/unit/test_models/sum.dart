library sum;

import 'package:meta_types/meta_types.dart';

part 'sum.g.dart';

@dataInterface
abstract class DataInterfaceBasic {
  int get inheritedValue;
}

@data
@serializable
abstract class $DataInterfaceBasicImplementation implements DataInterfaceBasic {
  int get concreteValue;
}

@sum
@serializable
abstract class $SumGenerics<A, B extends DataInterfaceBasic> {
  A get genericNoExtension;
  B get genericSumExtension;
}

@sum
@serializable
abstract class $SumConst {
  const $SumConst();

  int get a;
  double get b;
}

@sum
@serializable
abstract class $SumComputedFields implements SumComputedFieldsBase {
  int get a;
  double get b;

  @computed
  int get doubled => when(a: (a) => a * 2, b: (b) => b.toInt() * 2);
}

@sum
@serializable
abstract class $SumWithVoid {
  const $SumWithVoid();

  int get a;
  void get v;
}
