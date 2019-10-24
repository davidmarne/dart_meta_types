import 'data_class.dart';
import 'enum_class.dart';
import 'option.dart';
import 'sealed_class.dart';

class MetaClassReference {
  final String symbol;
  final String url;
  final Iterable<MetaClassReference> generics;
  MetaClassReference(this.symbol, this.url, {this.generics = const []});
}

abstract class MetaClass {
  MetaClassReference get metaClassReference;
}

class MetaClassSealed implements MetaClass {
  final DataClass _data;
  final EnumClass _enumeration;
  final SealedClass _sealed;

  MetaClassSealed.data(this._data)
      : _enumeration = null,
        _sealed = null;
  MetaClassSealed.enumeration(this._enumeration)
      : _data = null,
        _sealed = null;
  MetaClassSealed.sealed(this._sealed)
      : _data = null,
        _enumeration = null;

  Option<DataClass> get data => Option(_data);
  Option<EnumClass> get enumeration => Option(_enumeration);
  Option<SealedClass> get sealed => Option(_sealed);

  W when<W>({
    W Function(DataClass) data,
    W Function(EnumClass) enumeration,
    W Function(SealedClass) sealed,
  }) {
    if (_data != null) return data(_data);
    if (_enumeration != null) return enumeration(_enumeration);
    if (_sealed != null) return sealed(_sealed);
    throw FallThroughError();
  }

  W whenDef<W>({
    W Function(DataClass) data,
    W Function(EnumClass) enumeration,
    W Function(SealedClass) sealed,
    W Function() def,
  }) {
    if (_data != null) return data == null ? def() : data(_data);
    if (_enumeration != null)
      return enumeration == null ? def() : enumeration(_enumeration);
    if (_sealed != null) return sealed == null ? def() : sealed(_sealed);
    throw FallThroughError();
  }

  MetaClassReference get metaClassReference => when(
        data: (d) => d.metaClassReference,
        enumeration: (e) => e.metaClassReference,
        sealed: (s) => s.metaClassReference,
      );
}

class TemplateException implements Exception {
  final String msg;

  TemplateException(this.msg);

  @override
  String toString() {
    return 'TemplateError( $msg )';
  }
}
