// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_hook.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class DocumentResolutions<T extends Path> extends $DocumentResolutions<T> {
  DocumentResolutions({BuiltMap<DocumentReference, T> data})
      : __data = data,
        assert(data != null);

  Iterable<T> _datas;

  final BuiltMap<DocumentReference, T> __data;

  DocumentResolutions<T> clone({BuiltMap<DocumentReference, T> data}) {
    return DocumentResolutions(
      data: data ?? __data,
    );
  }

  BuiltMap<DocumentReference, T> get _data {
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
    if (other is! DocumentResolutions) return false;
    return _data == other._data;
  }

  String toString() {
    return "DocumentResolutions (_data: $_data)";
  }
}
