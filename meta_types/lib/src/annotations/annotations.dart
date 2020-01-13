part of meta_types;

/// [computed] is used to annotate fields that are computed and not set explicitly.
/// [computed] can be used in sealed and data classes.
const computed = Computed._();

class Computed {
  const Computed._();
}

/// [data] can be used to annotate classes to generate data
/// class boilerplate. generates as final.
const data = const DataClass._(true, false);
const dataInterface = const DataClass._(false, true);

/// [DataClass] is used to annotate classes to generate data class boilerplate
/// if `isInterface` is true, no constructor will be generated.
class DataClass {
  final bool isFinal;
  final bool isInterface;
  const DataClass._(this.isFinal, this.isInterface);
}

/// [enumeration] can be used to annotate classes to generate enumeration
/// class boilerplate
const enumeration = const EnumClass._();

/// [EnumClass] can be used to annotate classes to generate enumeration
/// class boilerplate
class EnumClass {
  const EnumClass._();
}

/// [sealed] can be used to annotate classes to generate sealed
/// class boilerplate
const seal = const SealedClass._();

/// [SealedClass] can be used to annotate classes to generate sealed
/// class boilerplate
class SealedClass {
  const SealedClass._();
}

/// [sum] can be used to annotate classes to generate sum
/// class boilerplate
const sum = const SumClass._(true, false);
const sumInterface = const SumClass._(false, true);

/// [SumClass] can be used to annotate classes to generate sumClass
/// class boilerplate
class SumClass {
  final bool isFinal;
  final bool isInterface;
  const SumClass._(this.isFinal, this.isInterface);
}

/// [union] can be used to annotate classes to generate union
/// class boilerplate
const union = const UnionClass._(true, false);
const unionInterface = const UnionClass._(false, true);

/// [UnionClass] can be used to annotate classes to generate unionClass
/// class boilerplate
class UnionClass {
  final bool isFinal;
  final bool isInterface;
  const UnionClass._(this.isFinal, this.isInterface);
}

class SerializableField {
  final bool ommit;
  final String wireName;

  const SerializableField._({
    this.ommit: false,
    this.wireName: '',
  });

  const SerializableField(
    this.wireName,
  ) : ommit = false;
}

const ommit = SerializableField._(ommit: true);

const serializable = Serializable();

class Serializable {
  const Serializable();
}

/// For use by generated code in calculating hash codes. Do not use directly.
int $jc(int hash, int value) {
  // Jenkins hash "combine".
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

/// For use by generated code in calculating hash codes. Do not use directly.
int $jf(int hash) {
  // Jenkins hash "finish".
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
