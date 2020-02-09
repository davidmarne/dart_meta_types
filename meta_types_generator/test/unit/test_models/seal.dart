library seal;

import 'package:meta_types/meta_types.dart';

part 'seal.g.dart';

@dataInterface
abstract class DataInterfaceBasic {
  int get inheritedValue;
}

@data
@serializable
abstract class $DataInterfaceBasicImplementationA
    implements DataInterfaceBasic {
  const $DataInterfaceBasicImplementationA();
  int get a;
}

@data
@serializable
abstract class $DataInterfaceBasicImplementationB
    implements DataInterfaceBasic {
  const $DataInterfaceBasicImplementationB();
  int get b;
}

@seal
@serializable
abstract class $Seal implements DataInterfaceBasic {
  DataInterfaceBasicImplementationA get a;
  DataInterfaceBasicImplementationB get b;
}

@seal
@serializable
abstract class $SealConst implements DataInterfaceBasic {
  const $SealConst();
  DataInterfaceBasicImplementationA get a;
  DataInterfaceBasicImplementationB get b;
}

@seal
@serializable
abstract class $SealComputedFields implements SealComputedFieldsBase {
  DataInterfaceBasicImplementationA get a;
  DataInterfaceBasicImplementationB get b;

  @computed
  int get value => when(a: (a) => a.a, b: (b) => b.b);
}
