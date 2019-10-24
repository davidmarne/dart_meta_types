part of models;

@DCM()
@DataClass()
abstract class $DataClassMixinBase {
  int get implementor;
}

class DCM extends DataClassMixin {
  const DCM();
}

mixin DataClassMixinBaseDCM on DataClassMixinBase {
  static DataClassMixinBase create() => new DataClassMixinBase();
  void printFoo() {
    print("foo");
  }
}
