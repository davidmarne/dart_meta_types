library data;

import 'package:meta_types/meta_types.dart';

part 'data.g.dart';

@dataInterface
abstract class DataInterfaceBasic {
  int get inheritedValue;
}

@dataInterface
abstract class DataInterfaceGenerics<T> {
  T get inheritedValue;
}

@data
@serializable
abstract class $DataInterfaceBasicImplementation implements DataInterfaceBasic {
  int get concreteValue;
}

@data
@serializable
abstract class $DataInterfaceGenericsImplementationUnset<T>
    implements DataInterfaceGenerics<T> {
  T get concreteValue;
}

@data
@serializable
abstract class $DataInterfaceGenericsImplementationSet
    implements DataInterfaceGenerics<int> {
  int get concreteValue;
}

@data
@serializable
abstract class $DataClassGenerics<A, B extends DataInterfaceBasic> {
  A get genericNoExtension;
  B get genericDataClassExtension;
}

@data
@serializable
abstract class $DataClassConst {
  const $DataClassConst();

  int get value;
}

@data
@serializable
abstract class $DataClassDefaultFields {
  int get value => 2;
}

@data
@serializable
abstract class $DataClassComputedFields {
  int get value;

  @computed
  int get doubled => value * 2;
}
