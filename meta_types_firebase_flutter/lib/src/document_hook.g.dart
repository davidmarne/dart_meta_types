// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_hook.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class DocumentResolutions<
        D,
        U extends DocumentUpdater<D>,
        DR extends TypedDocumentReference<D, U, DR, DC>,
        DC extends TypedCollectionReference<D, U, DR, DC>>
    extends $DocumentResolutions<D, U, DR, DC> {
  DocumentResolutions({@required Map<String, DocumentResolution<D>> $_data})
      : __data = $_data,
        assert($_data != null);

  Iterable<DocumentResolution<D>> _datas;

  final Map<String, DocumentResolution<D>> __data;

  Map<String, DocumentResolution<D>> get _data {
    return __data;
  }

  @override
  Iterable<DocumentResolution<D>> get datas {
    return _datas ??= super.datas;
  }

  DocumentResolutions<D, U, DR, DC> copy(
      {Map<String, DocumentResolution<D>> $_data}) {
    return DocumentResolutions(
      $_data: $_data ?? __data,
    );
  }

  int get hashCode => $jf($jc(0, __data.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DocumentResolutions) return false;
    return _data == other._data;
  }

  String toString() {
    return "DocumentResolutions (_data: $_data)";
  }
}
