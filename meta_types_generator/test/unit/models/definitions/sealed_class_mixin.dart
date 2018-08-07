part of models;

@SCM()
@SealedClass()
abstract class $SealedClassMixinBase {
  int get a;
  int get b;
}

class SCM extends SealedClassMixin {
  const SCM();
}

abstract class SealedClassMixinBaseSCM implements _SealedClassMixinBaseBase {
  void mixinFunction() {
    print('successfully mixed in ${a}');
  }
}
