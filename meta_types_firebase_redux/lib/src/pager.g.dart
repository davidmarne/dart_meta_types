// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

abstract class _PagerBase extends DataClass {
  String get nextStartKey;
  bool get itemsRemain;
  bool get fetching;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<String>("nextStartKey"),
        new DataClassField<bool>("itemsRemain"),
        new DataClassField<bool>("fetching")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class Pager extends _PagerBase {
  final String _nextStartKey;
  final bool _itemsRemain;
  final bool _fetching;

  Pager({
    @required String nextStartKey,
    @required bool itemsRemain,
    @required bool fetching,
  })  : _nextStartKey = nextStartKey,
        _itemsRemain = itemsRemain,
        _fetching = fetching,
        super() {
    assert(this.nextStartKey != null,
        "null value provided for field nextStartKey");
    assert(
        this.itemsRemain != null, "null value provided for field itemsRemain");
    assert(this.fetching != null, "null value provided for field fetching");
  }

  Pager clone({
    String nextStartKey,
    bool itemsRemain,
    bool fetching,
  }) =>
      new Pager(
        nextStartKey: nextStartKey ?? _nextStartKey,
        itemsRemain: itemsRemain ?? _itemsRemain,
        fetching: fetching ?? _fetching,
      );

  @override
  String get nextStartKey => _nextStartKey;
  @override
  bool get itemsRemain => _itemsRemain;
  @override
  bool get fetching => _fetching;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Pager) return false;
    return nextStartKey == other.nextStartKey &&
        itemsRemain == other.itemsRemain &&
        fetching == other.fetching;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, nextStartKey.hashCode), itemsRemain.hashCode),
        fetching.hashCode));
  }
}
