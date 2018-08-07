part of models;

@ECM()
@EnumClass(int)
abstract class $EnumClassMixinBase {
  static int a;
  static int b;
}

class ECM extends EnumClassMixin {
  const ECM();
}

abstract class EnumClassMixinBaseECM implements _EnumClassMixinBaseBase {
  void mixinFunction() {
    print('successfully mixed in ${value}');
  }
}
