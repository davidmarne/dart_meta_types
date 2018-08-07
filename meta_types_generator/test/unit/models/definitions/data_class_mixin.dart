part of models;

@DCM()
@DataClass()
abstract class $DataClassMixinBase {
  int get implementor;
}

class DCM extends DataClassMixin {
  const DCM();
}

abstract class DataClassMixinBaseDCM implements _DataClassMixinBaseBase {
  void mixinFunction() {
    print('successfully mixed in ${implementor}');
  }
}
