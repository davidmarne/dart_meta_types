// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

abstract class _CounterBase extends DataClass {
  int get count => 0;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<int>("count")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class Counter extends _CounterBase {
  final int _count;

  Counter({
    int count,
  })  : _count = count,
        super() {
    assert(this.count != null, "null value provided for field count");
  }

  Counter clone({
    int count,
  }) =>
      new Counter(
        count: count ?? _count,
      );

  @override
  int get count => _count ?? super.count;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Counter) return false;
    return count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(0, count.hashCode));
  }
}

class CounterActions extends _CounterActionsBase with CounterActionsActions {
  final int _increment;
  final bool _incrementSet;

  final int _decrement;
  final bool _decrementSet;

  CounterActions.incrementFactory(this._increment)
      : _decrementSet = false,
        _decrement = null,
        _incrementSet = true;

  CounterActions.decrementFactory(this._decrement)
      : _incrementSet = false,
        _increment = null,
        _decrementSet = true;

  int get increment => _increment;
  bool get incrementSet => _incrementSet;

  int get decrement => _decrement;
  bool get decrementSet => _decrementSet;

  W when<W>({
    @required W increment(int increment),
    @required W decrement(int decrement),
  }) {
    if (_incrementSet) return increment(this.increment);
    return decrement(this.decrement);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CounterActions) return false;
    return increment == other.increment && decrement == other.decrement;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, increment.hashCode), decrement.hashCode));
  }
}

abstract class _CounterActionsBase extends SealedClass {
  int get increment;
  int get decrement;
  bool get incrementSet;

  bool get decrementSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<int>("increment"),
        new SealedClassField<int>("decrement")
      ];
  W when<W>({
    @required W increment(int increment),
    @required W decrement(int decrement),
  });
}
