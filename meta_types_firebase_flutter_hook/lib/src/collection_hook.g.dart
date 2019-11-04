// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_hook.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class CollectionResolutions<T extends Path> extends $CollectionResolutions<T> {
  CollectionResolutions({BuiltMap<CollectionReference, T> data})
      : __data = data,
        assert(data != null);

  Iterable<T> _datas;

  final BuiltMap<CollectionReference, T> __data;

  CollectionResolutions<T> clone({BuiltMap<CollectionReference, T> data}) {
    return CollectionResolutions(
      data: data ?? __data,
    );
  }

  BuiltMap<CollectionReference, T> get _data {
    return __data;
  }

  Iterable<T> get datas {
    return _datas ??= super.datas;
  }

  int get hashCode {
    return $jf($jc(0, _data.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CollectionResolutions) return false;
    return _data == other._data;
  }

  String toString() {
    return "CollectionResolutions (_data: $_data)";
  }
}
