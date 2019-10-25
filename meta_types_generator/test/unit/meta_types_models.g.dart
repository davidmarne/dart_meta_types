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

class SealedValue extends $SealedValue {
  SealedValue(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _returnTypeGenerics = returnTypeGenerics,
        assert(returnTypeGenerics != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  final Object _value;

  SealedValue clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value}) {
    return SealedValue(
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
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

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, returnType.hashCode), returnTypeGenerics.hashCode),
                name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedValue) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SealedValue (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sealed<T extends SealedField, D extends DataField> extends $Sealed<T, D> {
  Sealed(
      {bool isConst,
      Iterable<Data<D>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _isConst = isConst,
        assert(isConst != null),
        _dataInterfaces = dataInterfaces,
        assert(dataInterfaces != null),
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

  Iterable<D> _dataFields;

  final bool _isConst;

  final Iterable<Data<D>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Sealed<T, D> clone(
      {bool isConst,
      Iterable<Data<D>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Sealed(
      isConst: isConst ?? _isConst,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<Data<D>> get dataInterfaces {
    return _dataInterfaces;
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

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<D> get dataFields {
    return _dataFields ??= super.dataFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isConst.hashCode), dataInterfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sealed) return false;
    return isConst == other.isConst &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Sealed (isConst: $isConst, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class EnumField extends $EnumField {
  EnumField(
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

  EnumField clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed}) {
    return EnumField(
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
    if (other is! EnumField) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "EnumField (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed)";
  }
}

class EnumsValue extends $EnumsValue {
  EnumsValue(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _returnTypeGenerics = returnTypeGenerics,
        assert(returnTypeGenerics != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  final Object _value;

  EnumsValue clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value}) {
    return EnumsValue(
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
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

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, returnType.hashCode), returnTypeGenerics.hashCode),
                name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumsValue) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "EnumsValue (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Enum<T extends EnumField> extends $Enum<T> {
  Enum(
      {String type,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _type = type,
        assert(type != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  final String _type;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Enum<T> clone(
      {String type,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Enum(
      type: type ?? _type,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  String get type {
    return _type;
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

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), name.hashCode), isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Enum) return false;
    return type == other.type &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Enum (type: $type, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
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

class DataValue extends $DataValue {
  DataValue(
      {bool isAbstract,
      bool isDefaulted,
      String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value})
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
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  final Object _value;

  DataValue clone(
      {bool isAbstract,
      bool isDefaulted,
      String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value}) {
    return DataValue(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
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

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                        returnType.hashCode),
                    returnTypeGenerics.hashCode),
                name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataValue) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "DataValue (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Data<T extends DataField> extends $Data<T> {
  Data(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<Data<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _isConst = isConst,
        assert(isConst != null),
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

  final bool _isConst;

  final Iterable<Data<T>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Data<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<Data<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
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

  bool get isConst {
    return _isConst;
  }

  Iterable<Data<T>> get interfaces {
    return _interfaces;
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
                    $jc(
                        $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                            isConst.hashCode),
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
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Data (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class MetaUnion extends $MetaUnion {
  MetaUnion.data(Data data)
      : assert(data != null),
        _data = data,
        _sealed = null,
        _sum = null;

  MetaUnion.sealed(Sealed sealed)
      : _data = null,
        assert(sealed != null),
        _sealed = sealed,
        _sum = null;

  MetaUnion.sum(Sum sum)
      : _data = null,
        _sealed = null,
        assert(sum != null),
        _sum = sum;

  MetaUnion({Data data, Sealed sealed, Sum sum})
      : _data = data,
        _sealed = sealed,
        _sum = sum {
    var found = false;
    if (data != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sealed != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sum != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Data _data;

  final Sealed _sealed;

  final Sum _sum;

  Data get data {
    if (_data != null) return _data;
    throw Exception('TODO name htis');
  }

  Sealed get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('TODO name htis');
  }

  Sum get sum {
    if (_sum != null) return _sum;
    throw Exception('TODO name htis');
  }

  bool get isData {
    return _data != null;
  }

  bool get isSealed {
    return _sealed != null;
  }

  bool get isSum {
    return _sum != null;
  }

  void whenData(void Function(Data) handler) {
    if (_data != null) handler(_data);
  }

  void whenSealed(void Function(Sealed) handler) {
    if (_sealed != null) handler(_sealed);
  }

  void whenSum(void Function(Sum) handler) {
    if (_sum != null) handler(_sum);
  }

  WHEN when<WHEN>(
      {WHEN Function(Data) data,
      WHEN Function(Sealed) sealed,
      WHEN Function(Sum) sum}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    if (_sum != null) {
      return sum(_sum);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data) data,
      WHENO Function(Sealed) sealed,
      WHENO Function(Sum) sum}) {
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
    if (_sum != null) {
      if (sum != null)
        return sum(_sum);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf(
        $jc($jc($jc(0, _data.hashCode), _sealed.hashCode), _sum.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaUnion) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _sum == other._sum;
  }

  String toString() {
    final value = when(
      data: (data) => 'data $data',
      sealed: (sealed) => 'sealed $sealed',
      sum: (sum) => 'sum $sum',
    );
    return 'MetaUnion( $value )';
  }
}

abstract class IMetaUnion {
  void whenData(void Function(Data) handler);
  void whenSealed(void Function(Sealed) handler);
  void whenSum(void Function(Sum) handler);
  WHEN when<WHEN>(
      {WHEN Function(Data) data,
      WHEN Function(Sealed) sealed,
      WHEN Function(Sum) sum});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data) data,
      WHENO Function(Sealed) sealed,
      WHENO Function(Sum) sum});
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
  void whenSome(void Function(T) handler);
  void whenNone(void Function() handler);
  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none});
}

class SumField extends $SumField {
  SumField(
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

  SumField clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed}) {
    return SumField(
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
    if (other is! SumField) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SumField (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed)";
  }
}

class SumValue extends $SumValue {
  SumValue(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _returnTypeGenerics = returnTypeGenerics,
        assert(returnTypeGenerics != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final String _returnType;

  final Option<List<String>> _returnTypeGenerics;

  final String _name;

  final bool _isComputed;

  final Object _value;

  SumValue clone(
      {String returnType,
      Option<List<String>> returnTypeGenerics,
      String name,
      bool isComputed,
      Object value}) {
    return SumValue(
      returnType: returnType ?? _returnType,
      returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
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

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, returnType.hashCode), returnTypeGenerics.hashCode),
                name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumValue) return false;
    return returnType == other.returnType &&
        returnTypeGenerics == other.returnTypeGenerics &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SumValue (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sum<T extends SumField> extends $Sum<T> {
  Sum(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<Sum<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _isConst = isConst,
        assert(isConst != null),
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

  final bool _isConst;

  final Iterable<Sum<T>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Sum<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<Sum<T>> interfaces,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Sum(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
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

  bool get isConst {
    return _isConst;
  }

  Iterable<Sum<T>> get interfaces {
    return _interfaces;
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
                    $jc(
                        $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                            isConst.hashCode),
                        interfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sum) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Sum (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}
