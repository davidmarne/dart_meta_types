// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types_models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class SealedField extends $SealedField {
  SealedField(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _returnTypeGenerics = returnTypeGenerics,
        assert(returnTypeGenerics != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  SealedField clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed}) {
    return SealedField(
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  String get returnType {
    return _returnType;
  }

  Option<List<String>> get returnTypeGenerics {
    return _returnTypeGenerics;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, returnType.hashCode), returnTypeGenerics.hashCode),
            name.hashCode),
        isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedField) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SealedField (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed)";
  }
}

class Sealed<T extends SealedField> extends $Sealed<T> {
  Sealed(
      {bool isFinal,
      bool isInterface,
      Iterable<Sealed<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _interfaces = interfaces,
        assert(interfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  Iterable<T> _computedFields;

  Iterable<T> _nonComputedFields;

  Iterable<T> _localNonComputedFields;

  final bool _isFinal;

  final bool _isInterface;

  final Iterable<Sealed<T>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Sealed<T> clone(
      {bool isFinal,
      bool isInterface,
      Iterable<Sealed<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Sealed(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<Generic> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Sealed<T>> get interfaces {
    return _interfaces ?? super.interfaces;
  }

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<T> get localNonComputedFields {
    return _localNonComputedFields ??= super.localNonComputedFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                        interfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sealed) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Sealed (isFinal: $isFinal, isInterface: $isInterface, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class DataField extends $DataField {
  DataField(
      {bool isAbstract,
      bool isDefaulted,
      String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed})
      : _isAbstract = isAbstract,
        assert(isAbstract != null),
        _isDefaulted = isDefaulted,
        assert(isDefaulted != null),
        _returnType = returnType,
        assert(returnType != null),
        _returnTypeGenerics = returnTypeGenerics,
        assert(returnTypeGenerics != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  DataField clone(
      {bool isAbstract,
      bool isDefaulted,
      String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed}) {
    return DataField(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  bool get isAbstract {
    return _isAbstract;
  }

  bool get isDefaulted {
    return _isDefaulted;
  }

  String get returnType {
    return _returnType;
  }

  Option<List<String>> get returnTypeGenerics {
    return _returnTypeGenerics;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                    returnType.hashCode),
                returnTypeGenerics.hashCode),
            name.hashCode),
        isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataField) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "DataField (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed)";
  }
}

class Data<T extends DataField> extends $Data<T> {
  Data(
      {bool isFinal,
      bool isInterface,
      Iterable<Data<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _interfaces = interfaces,
        assert(interfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  Iterable<T> _computedFields;

  Iterable<T> _nonComputedFields;

  Iterable<T> _localNonComputedFields;

  Iterable<T> _nonDefaultedFields;

  Iterable<T> _localNonDefaultedFields;

  Iterable<T> _defaultedFields;

  Iterable<T> _localDefaultedFields;

  final bool _isFinal;

  final bool _isInterface;

  final Iterable<Data<T>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Data<T> clone(
      {bool isFinal,
      bool isInterface,
      Iterable<Data<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<Generic> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Data<T>> get interfaces {
    return _interfaces ?? super.interfaces;
  }

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<T> get localNonComputedFields {
    return _localNonComputedFields ??= super.localNonComputedFields;
  }

  Iterable<T> get nonDefaultedFields {
    return _nonDefaultedFields ??= super.nonDefaultedFields;
  }

  Iterable<T> get localNonDefaultedFields {
    return _localNonDefaultedFields ??= super.localNonDefaultedFields;
  }

  Iterable<T> get defaultedFields {
    return _defaultedFields ??= super.defaultedFields;
  }

  Iterable<T> get localDefaultedFields {
    return _localDefaultedFields ??= super.localDefaultedFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                        interfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Data (isFinal: $isFinal, isInterface: $isInterface, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class MetaUnion extends $MetaUnion {
  MetaUnion.data(Data data)
      : assert(data != null),
        _data = data,
        _sealed = null;

  MetaUnion.sealed(Sealed sealed)
      : _data = null,
        assert(sealed != null),
        _sealed = sealed;

  MetaUnion({Data data, Sealed sealed})
      : _data = data,
        _sealed = sealed {
    var found = false;
    if (data != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sealed != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Data _data;

  final Sealed _sealed;

  Data get data {
    if (_data != null) return _data;
    throw Exception('TODO name htis');
  }

  Sealed get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('TODO name htis');
  }

  bool get isData {
    return _data != null;
  }

  bool get isSealed {
    return _sealed != null;
  }

  void whenData(void Function(Data) handler) {
    if (_data != null) handler(_data);
  }

  void whenSealed(void Function(Sealed) handler) {
    if (_sealed != null) handler(_sealed);
  }

  WHEN when<WHEN>({WHEN Function(Data) data, WHEN Function(Sealed) sealed}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data) data,
      WHENO Function(Sealed) sealed}) {
    if (_data != null) {
      if (data != null)
        return data(_data);
      else
        return otherwise();
    }
    if (_sealed != null) {
      if (sealed != null)
        return sealed(_sealed);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _data.hashCode), _sealed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaUnion) return false;
    return _data == other._data && _sealed == other._sealed;
  }

  String toString() {
    final value = when(
      data: (data) => 'data $data',
      sealed: (sealed) => 'sealed $sealed',
    );
    return 'MetaUnion( $value )';
  }
}

abstract class IMetaUnion {
  Option<Data> get dataOption;
  Option<Sealed> get sealedOption;
  void whenData(void Function(Data) handler);
  void whenSealed(void Function(Sealed) handler);
  WHEN when<WHEN>({WHEN Function(Data) data, WHEN Function(Sealed) sealed});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data) data,
      WHENO Function(Sealed) sealed});
}

class Generic extends $Generic {
  Generic({String type, Option<String> extension})
      : _type = type,
        assert(type != null),
        _extension = extension,
        assert(extension != null);

  final String _type;

  final Option<String> _extension;

  Generic clone({String type, Option<String> extension}) {
    return Generic(
      type: type ?? _type,
      extension: extension ?? _extension,
    );
  }

  String get type {
    return _type;
  }

  Option<String> get extension {
    return _extension;
  }

  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), extension.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic) return false;
    return type == other.type && extension == other.extension;
  }

  String toString() {
    return "Generic (type: $type, extension: $extension)";
  }
}

class Option<T> extends $Option<T> {
  Option.some(T some)
      : assert(some != null),
        _some = some,
        _none = null;

  Option.none()
      : _some = null,
        _none = true;

  Option({T some, bool none})
      : _some = some,
        _none = none {
    var found = false;
    if (some != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (none != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final T _some;

  final bool _none;

  T get some {
    if (_some != null) return _some;
    throw Exception('TODO name htis');
  }

  void get none {
    if (_none != null) return;
    throw Exception('TODO name htis');
  }

  bool get isSome {
    return _some != null;
  }

  bool get isNone {
    return _none != null;
  }

  void whenSome(void Function(T) handler) {
    if (_some != null) handler(_some);
  }

  void whenNone(void Function() handler) {
    if (_none != null) handler();
  }

  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none}) {
    if (_some != null) {
      return some(_some);
    }
    if (_none != null) {
      return none();
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none}) {
    if (_some != null) {
      if (some != null)
        return some(_some);
      else
        return otherwise();
    }
    if (_none != null) {
      if (none != null)
        return none();
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _some.hashCode), _none.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Option) return false;
    return _some == other._some && _none == other._none;
  }

  String toString() {
    final value = when(
      some: (some) => 'some $some',
      none: () => 'none',
    );
    return 'Option( $value )';
  }
}

abstract class IOption<T> {
  Option<T> get someOption;
  Option<void> get noneOption;
  void whenSome(void Function(T) handler);
  void whenNone(void Function() handler);
  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none});
}
