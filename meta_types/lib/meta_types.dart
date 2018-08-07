export 'package:meta/meta.dart' show required;

/// [computed] is used to annotate fields that are computed and not set explicitly.
/// [computed] can be used in sealed and data classes.
const computed = 'computed';

/// [DataClass] is used to annotate classes to generate data class boilerplate
/// if `isInterface` is true, no constructor will be generated.
class DataClass {
  final bool isFinal;
  final bool isInterface;
  final bool isAbstract;

  const DataClass({
    bool isFinal = true,
    this.isInterface = false,
    this.isAbstract = false,
  }) : this.isFinal = isAbstract || isInterface ? false : isFinal;

  Iterable<ComputedField> get computedFields =>
      throw NotGenerated('computedFields');
  Iterable<DataClassField> get nonDefaultedFields =>
      throw NotGenerated('nonDefaultedFields');
  Iterable<DataClassField> get defaultedFields =>
      throw NotGenerated('defaultedFields');
  Iterable<DataClassField> get fields => throw NotGenerated('fields');
  T valueOf<T>(DataClassField<T> field) => throw NotGenerated('valueOf');
}

/// [EnumClass] can be used to annotate classes to generate enumeration
/// class boilerplate
class EnumClass<E, T> {
  final Type type;
  const EnumClass([Type type]) : this.type = type ?? Object;
  T get value => throw NotGenerated('value');
  Set<E> get allValues => throw NotGenerated('values');
  E valueOfOther(T t) => throw NotGenerated('valueOf');
}

/// [SealedClass] can be used to annotate classes to generate sealed
/// class boilerplate
class SealedClass {
  const SealedClass();
  Iterable<ComputedField> get computedFields =>
      throw NotGenerated('computedFields');
  Iterable<SealedClassField> get unionFields =>
      throw NotGenerated('unionFields');
  T valueOf<T>(SealedClassField<T> field) => throw NotGenerated('valueOf');
  bool isSet(SealedClassField field) => throw NotGenerated('isSet');
}

/// [DataClassMixin] is used to declare that this mixin is for data classes
class DataClassMixin {
  const DataClassMixin();
}

/// [SealedClassMixin] is used to declare that this mixin is for sealed classes
class SealedClassMixin {
  const SealedClassMixin();
}

/// [EnumClassMixin] is used to declare that this mixin is for enum classes
class EnumClassMixin {
  const EnumClassMixin();
}

/// [MetaTypeMixin] is used to declare that this mixin is for any metatype
class MetaTypeMixin {
  const MetaTypeMixin();
}

/// [Nullable] is used to represent nullable fields in other union and data
/// classes. Use of nullable is required so one can set a field to null
/// vial the data class's clone method.
class Nullable<T> {
  final T _value;
  Nullable.val(this._value);
  Nullable.nil() : _value = null;

  T get value => _value;

  /// [isNull] retuns true if the [Nullable] represents null
  /// i.e. no value is set
  bool get isNull => _value == null;

  /// [when] calls the whenNull if the [Nullable] represents null
  /// and calls whenValue if the value is set
  R when<R>(R whenValue(T value), R whenNull()) {
    if (isNull) return whenNull();
    return whenValue(_value);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Nullable<T>) return false;
    return _value == other._value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, _value.hashCode));
  }
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
  NotGenerated(String message);
}

class Field<T> {
  final String name;
  const Field(this.name);
  Type get dartType => T;
}

class DataClassField<T> extends Field<T> {
  const DataClassField(String name) : super(name);
}

class SealedClassField<T> extends Field<T> {
  const SealedClassField(String name) : super(name);
}

class EnumClassField<T> extends Field<T> {
  const EnumClassField(String name) : super(name);
}

class ComputedField<T> extends Field<T> {
  const ComputedField(String name) : super(name);
}
