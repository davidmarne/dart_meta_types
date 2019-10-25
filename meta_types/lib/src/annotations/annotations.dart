part of meta_types;

/// [computed] is used to annotate fields that are computed and not set explicitly.
/// [computed] can be used in sealed and data classes.
const computed = 'computed';

/// [data] can be used to annotate classes to generate data
/// class boilerplate. generates as final.
const data = const DataClass();

/// [DataClass] is used to annotate classes to generate data class boilerplate
/// if `isInterface` is true, no constructor will be generated.
class DataClass {
  final bool isFinal;
  final bool isInterface;

  const DataClass({
    this.isFinal = false,
    this.isInterface = false,
  });
}

/// [enumeration] can be used to annotate classes to generate enumeration
/// class boilerplate
const enumeration = const EnumClass();

/// [EnumClass] can be used to annotate classes to generate enumeration
/// class boilerplate
class EnumClass {
  const EnumClass();
}

/// [sealed] can be used to annotate classes to generate sealed
/// class boilerplate
const sealed = const SealedClass();

/// [SealedClass] can be used to annotate classes to generate sealed
/// class boilerplate
class SealedClass {
  const SealedClass();
}

/// [sum] can be used to annotate classes to generate sum
/// class boilerplate
const sum = const Sum();

/// [Sum] can be used to annotate classes to generate sum
/// class boilerplate
class Sum {
  const Sum();
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

class NotGenerated implements Exception {
  final String message;
  NotGenerated(this.message);
}
