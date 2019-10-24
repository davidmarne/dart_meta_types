// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types_models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class SealedField extends $SealedField {
  const SealedField(
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
      String templateClassName,
      String generatedClassName,
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
        _templateClassName = templateClassName,
        assert(templateClassName != null),
        _generatedClassName = generatedClassName,
        assert(generatedClassName != null),
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

  final String _templateClassName;

  final String _generatedClassName;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Sealed<T> clone(
      {bool isFinal,
      bool isInterface,
      Iterable<Sealed<T>> interfaces,
      String templateClassName,
      String generatedClassName,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Sealed(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      interfaces: interfaces ?? _interfaces,
      templateClassName: templateClassName ?? _templateClassName,
      generatedClassName: generatedClassName ?? _generatedClassName,
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

  Iterable<Sealed<T>> get interfaces {
    return _interfaces ?? super.interfaces;
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
    return "Sealed (isFinal: $isFinal, isInterface: $isInterface, name: $name, isPrivate: $isPrivate, generics: $generics)";
  }
}

// class EnumField extends $EnumField {
//   const EnumField(
//       {String returnType,
//       Option<List<String>> returnTypeGenerics,
//       String name,
//       bool isComputed})
//       : _returnType = returnType,
//         assert(returnType != null),
//         _returnTypeGenerics = returnTypeGenerics,
//         assert(returnTypeGenerics != null),
//         _name = name,
//         assert(name != null),
//         _isComputed = isComputed,
//         assert(isComputed != null);

//   final String _returnType;

//   final Option<List<String>> _returnTypeGenerics;

//   final String _name;

//   final bool _isComputed;

//   EnumField clone(
//       {String returnType,
//       Option<List<String>> returnTypeGenerics,
//       String name,
//       bool isComputed}) {
//     return EnumField(
//       returnType: returnType ?? _returnType,
//       returnTypeGenerics: returnTypeGenerics ?? _returnTypeGenerics,
//       name: name ?? _name,
//       isComputed: isComputed ?? _isComputed,
//     );
//   }

//   String get returnType {
//     return _returnType;
//   }

//   Option<List<String>> get returnTypeGenerics {
//     return _returnTypeGenerics;
//   }

//   String get name {
//     return _name;
//   }

//   bool get isComputed {
//     return _isComputed;
//   }

//   int get hashCode {
//     return $jf($jc(
//         $jc($jc($jc(0, returnType.hashCode), returnTypeGenerics.hashCode),
//             name.hashCode),
//         isComputed.hashCode));
//   }

//   bool operator ==(dynamic other) {
//     if (identical(other, this)) return true;
//     if (other is! EnumField) return false;
//     return returnType == other.returnType &&
//         returnTypeGenerics == other.returnTypeGenerics &&
//         name == other.name &&
//         isComputed == other.isComputed;
//   }

//   String toString() {
//     return "EnumField (returnType: $returnType, returnTypeGenerics: $returnTypeGenerics, name: $name, isComputed: $isComputed)";
//   }
// }

// class EnumsValue extends $EnumsValue {
//   const EnumsValue({Object value})
//       : _value = value,
//         assert(value != null);

//   final Object _value;

//   EnumsValue clone({Object value}) {
//     return EnumsValue(
//       value: value ?? _value,
//     );
//   }

//   Object get value {
//     return _value;
//   }

//   int get hashCode {
//     return $jf($jc(0, value.hashCode));
//   }

//   bool operator ==(dynamic other) {
//     if (identical(other, this)) return true;
//     if (other is! EnumsValue) return false;
//     return value == other.value;
//   }

//   String toString() {
//     return "EnumsValue (value: $value)";
//   }
// }

// class Enum extends $Enum {
//   const Enum(
//       {String templateClassName,
//       String generatedClassName,
//       String name,
//       bool isPrivate,
//       Iterable<Generic> generics,
//       Iterable<T> fields})
//       : _templateClassName = templateClassName,
//         assert(templateClassName != null),
//         _generatedClassName = generatedClassName,
//         assert(generatedClassName != null),
//         _name = name,
//         assert(name != null),
//         _isPrivate = isPrivate,
//         assert(isPrivate != null),
//         _generics = generics,
//         assert(generics != null),
//         _fields = fields,
//         assert(fields != null);

//   final String _templateClassName;

//   final String _generatedClassName;

//   final String _name;

//   final bool _isPrivate;

//   final Iterable<Generic> _generics;

//   final Iterable<T> _fields;

//   Enum clone(
//       {String templateClassName,
//       String generatedClassName,
//       String name,
//       bool isPrivate,
//       Iterable<Generic> generics,
//       Iterable<T> fields}) {
//     return Enum(
//       templateClassName: templateClassName ?? _templateClassName,
//       generatedClassName: generatedClassName ?? _generatedClassName,
//       name: name ?? _name,
//       isPrivate: isPrivate ?? _isPrivate,
//       generics: generics ?? _generics,
//       fields: fields ?? _fields,
//     );
//   }

//   String get name {
//     return _name;
//   }

//   bool get isPrivate {
//     return _isPrivate;
//   }

//   Iterable<Generic> get generics {
//     return _generics;
//   }

//   String get templateClassName {
//     return _templateClassName ?? super.templateClassName;
//   }

//   String get generatedClassName {
//     return _generatedClassName ?? super.generatedClassName;
//   }

//   Iterable<T> get fields {
//     return _fields ?? super.fields;
//   }

//   int get hashCode {
//     return $jf($jc(
//         $jc(
//             $jc(
//                 $jc(
//                     $jc($jc(0, templateClassName.hashCode),
//                         generatedClassName.hashCode),
//                     name.hashCode),
//                 isPrivate.hashCode),
//             generics.hashCode),
//         fields.hashCode));
//   }

//   bool operator ==(dynamic other) {
//     if (identical(other, this)) return true;
//     if (other is! Enum) return false;
//     return templateClassName == other.templateClassName &&
//         generatedClassName == other.generatedClassName &&
//         name == other.name &&
//         isPrivate == other.isPrivate &&
//         generics == other.generics &&
//         fields == other.fields;
//   }

//   String toString() {
//     return "Enum (name: $name, isPrivate: $isPrivate, generics: $generics)";
//   }
// }

class DataField extends $DataField {
  const DataField(
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

// class DataValue extends $DataValue {
//   const DataValue({Object value})
//       : _value = value,
//         assert(value != null);

//   final Object _value;

//   DataValue clone({Object value}) {
//     return DataValue(
//       value: value ?? _value,
//     );
//   }

//   Object get value {
//     return _value;
//   }

//   int get hashCode {
//     return $jf($jc(0, value.hashCode));
//   }

//   bool operator ==(dynamic other) {
//     if (identical(other, this)) return true;
//     if (other is! DataValue) return false;
//     return value == other.value;
//   }

//   String toString() {
//     return "DataValue (value: $value)";
//   }
// }

class Data<T extends DataField> extends $Data<T> {
  Data(
      {bool isFinal,
      bool isInterface,
      Iterable<Data<T>> interfaces,
      String templateClassName,
      String generatedClassName,
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
        _templateClassName = templateClassName,
        assert(templateClassName != null),
        _generatedClassName = generatedClassName,
        assert(generatedClassName != null),
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

  final String _templateClassName;

  final String _generatedClassName;

  final String _name;

  final bool _isPrivate;

  final Iterable<Generic> _generics;

  final Iterable<T> _fields;

  Data<T> clone(
      {bool isFinal,
      bool isInterface,
      Iterable<Data<T>> interfaces,
      String templateClassName,
      String generatedClassName,
      String name,
      bool isPrivate,
      Iterable<Generic> generics,
      Iterable<T> fields}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      interfaces: interfaces ?? _interfaces,
      templateClassName: templateClassName ?? _templateClassName,
      generatedClassName: generatedClassName ?? _generatedClassName,
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

  Iterable<Data<T>> get interfaces {
    return _interfaces;
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
    return "Data (isFinal: $isFinal, isInterface: $isInterface, name: $name, isPrivate: $isPrivate, generics: $generics)";
  }
}

class MetaUnion extends $MetaUnion {
  const MetaUnion.data(Data data)
      : assert(data != null),
        _data = data,
        _sealed = null,
        _enumeration = null;

  const MetaUnion.sealed(Sealed sealed)
      : _data = null,
        assert(sealed != null),
        _sealed = sealed,
        _enumeration = null;

  const MetaUnion.enumeration(EnumClass enumeration)
      : _data = null,
        _sealed = null,
        assert(enumeration != null),
        _enumeration = enumeration;

  MetaUnion({Data data, Sealed sealed, EnumClass enumeration})
      : _data = data,
        _sealed = sealed,
        _enumeration = enumeration {
    var found = false;
    if (data != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sealed != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (enumeration != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Data _data;

  final Sealed _sealed;

  final EnumClass _enumeration;

  Data get data {
    if (_data != null) return _data;
    throw Exception('TODO name htis');
  }

  Sealed get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('TODO name htis');
  }

  EnumClass get enumeration {
    if (_enumeration != null) return _enumeration;
    throw Exception('TODO name htis');
  }

  bool get isData {
    return _data != null;
  }

  bool get isSealed {
    return _sealed != null;
  }

  bool get isEnumeration {
    return _enumeration != null;
  }

  void whenData(void Function(Data) handler) {
    if (_data != null) handler(_data);
  }

  void whenSealed(void Function(Sealed) handler) {
    if (_sealed != null) handler(_sealed);
  }

  void whenEnumeration(void Function(EnumClass) handler) {
    if (_enumeration != null) handler(_enumeration);
  }

  WHEN when<WHEN>(
      {WHEN Function(Data) data,
      WHEN Function(Sealed) sealed,
      WHEN Function(EnumClass) enumeration}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    if (_enumeration != null) {
      return enumeration(_enumeration);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data) data,
      WHENO Function(Sealed) sealed,
      WHENO Function(EnumClass) enumeration}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    if (_enumeration != null) {
      return enumeration(_enumeration);
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, _data.hashCode), _sealed.hashCode), _enumeration.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaUnion) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _enumeration == other._enumeration;
  }

  String toString() {
    final value = when(
      data: (data) => 'data $data',
      sealed: (sealed) => 'sealed $sealed',
      enumeration: (enumeration) => 'enumeration $enumeration',
    );
    return 'MetaUnion( $value )';
  }
}

abstract class IMetaUnion extends SealedClass {
  Option<DataClass> get dataOption;
  Option<SealedClass> get sealedOption;
  Option<EnumClass> get enumerationOption;
  void whenData(void Function(DataClass) handler);
  void whenSealed(void Function(SealedClass) handler);
  void whenEnumeration(void Function(EnumClass) handler);
  WHEN when<WHEN>(
      {WHEN Function(DataClass) data,
      WHEN Function(SealedClass) sealed,
      WHEN Function(EnumClass) enumeration});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(DataClass) data,
      WHENO Function(SealedClass) sealed,
      WHENO Function(EnumClass) enumeration});
}

class Generic extends $Generic {
  const Generic({String type, Option<String> extension})
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
  const Option.some(T some)
      : assert(some != null),
        _some = some,
        _none = null;

  const Option.none()
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
      return some(_some);
    }
    if (_none != null) {
      return none();
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

abstract class IOption<T> extends SealedClass {
  void whenSome(void Function(T) handler);
  void whenNone(void Function() handler);
  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none});
}
