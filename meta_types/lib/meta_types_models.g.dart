// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types_models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class SealedField extends $SealedField {
  const SealedField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  SealedField clone({FieldType returnType, String name, bool isComputed}) {
    return SealedField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SealedField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class SealedValue extends $SealedValue {
  const SealedValue(
      {FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  SealedValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return SealedValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  FieldType get returnType {
    return _returnType;
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
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SealedValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sealed<T extends SealedField, D extends DataField> extends $Sealed<T, D> {
  const Sealed(
      {bool isConst,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods})
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
        assert(fields != null),
        _methods = methods,
        assert(methods != null);

  final bool _isConst;

  final Iterable<MetaInterfaceType<Data<D>>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  Sealed<T, D> clone(
      {bool isConst,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods}) {
    return Sealed(
      isConst: isConst ?? _isConst,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
    );
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterfaceType<Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isConst.hashCode), dataInterfaces.hashCode),
                        name.hashCode),
                    isPrivate.hashCode),
                generics.hashCode),
            fields.hashCode),
        methods.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sealed) return false;
    return isConst == other.isConst &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields &&
        methods == other.methods;
  }

  String toString() {
    return "Sealed (isConst: $isConst, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields, methods: $methods)";
  }
}

class EnumField extends $EnumField {
  const EnumField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  EnumField clone({FieldType returnType, String name, bool isComputed}) {
    return EnumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "EnumField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class EnumsValue extends $EnumsValue {
  const EnumsValue(
      {FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  EnumsValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return EnumsValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  FieldType get returnType {
    return _returnType;
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
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumsValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "EnumsValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Enum<T extends EnumField, D extends DataField> extends $Enum<T, D> {
  const Enum(
      {String type,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods})
      : _type = type,
        assert(type != null),
        _dataInterfaces = dataInterfaces,
        assert(dataInterfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null),
        _methods = methods,
        assert(methods != null);

  final String _type;

  final Iterable<MetaInterfaceType<Data<D>>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  Enum<T, D> clone(
      {String type,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods}) {
    return Enum(
      type: type ?? _type,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
    );
  }

  String get type {
    return _type;
  }

  Iterable<MetaInterfaceType<Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, type.hashCode), dataInterfaces.hashCode),
                        name.hashCode),
                    isPrivate.hashCode),
                generics.hashCode),
            fields.hashCode),
        methods.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Enum) return false;
    return type == other.type &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields &&
        methods == other.methods;
  }

  String toString() {
    return "Enum (type: $type, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields, methods: $methods)";
  }
}

class DataField extends $DataField {
  const DataField(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed})
      : _isAbstract = isAbstract,
        assert(isAbstract != null),
        _isDefaulted = isDefaulted,
        assert(isDefaulted != null),
        _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  DataField clone(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed}) {
    return DataField(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
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

  FieldType get returnType {
    return _returnType;
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
            $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                returnType.hashCode),
            name.hashCode),
        isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataField) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "DataField (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class DataValue extends $DataValue {
  const DataValue(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      Object value})
      : _isAbstract = isAbstract,
        assert(isAbstract != null),
        _isDefaulted = isDefaulted,
        assert(isDefaulted != null),
        _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  DataValue clone(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      Object value}) {
    return DataValue(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
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

  FieldType get returnType {
    return _returnType;
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
                $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                    returnType.hashCode),
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
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "DataValue (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Data<T extends DataField> extends $Data<T> {
  const Data(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Data<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods})
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
        assert(fields != null),
        _methods = methods,
        assert(methods != null);

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterfaceType<Data<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  Data<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Data<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
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

  Iterable<MetaInterfaceType<Data<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, isFinal.hashCode),
                                    isInterface.hashCode),
                                isConst.hashCode),
                            interfaces.hashCode),
                        name.hashCode),
                    isPrivate.hashCode),
                generics.hashCode),
            fields.hashCode),
        methods.hashCode));
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
        fields == other.fields &&
        methods == other.methods;
  }

  String toString() {
    return "Data (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields, methods: $methods)";
  }
}

class DataLoader extends $DataLoader {
  const DataLoader({String name, Object value})
      : _name = name,
        assert(name != null),
        _value = value,
        assert(value != null);

  final String _name;

  final Object _value;

  DataLoader clone({String name, Object value}) {
    return DataLoader(
      name: name ?? _name,
      value: value ?? _value,
    );
  }

  String get name {
    return _name;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataLoader) return false;
    return name == other.name && value == other.value;
  }

  String toString() {
    return "DataLoader (name: $name, value: $value)";
  }
}

class MetaInterfaceType<T extends Meta<Field>> extends $MetaInterfaceType<T> {
  MetaInterfaceType({T meta, Iterable<FieldType> generics})
      : _meta = meta,
        assert(meta != null),
        _generics = generics,
        assert(generics != null);

  final T _meta;

  final Iterable<FieldType> _generics;

  MetaInterfaceType<T> clone({T meta, Iterable<FieldType> generics}) {
    return MetaInterfaceType(
      meta: meta ?? _meta,
      generics: generics ?? _generics,
    );
  }

  T get meta {
    return _meta;
  }

  Iterable<FieldType> get generics {
    return _generics;
  }

  int get hashCode {
    return $jf($jc($jc(0, meta.hashCode), generics.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaInterfaceType) return false;
    return meta == other.meta && generics == other.generics;
  }

  String toString() {
    return "MetaInterfaceType (meta: $meta, generics: $generics)";
  }
}

class MetaSeal extends $MetaSeal {
  MetaSeal.data(Data<DataField> data)
      : assert(data != null),
        _data = data,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  MetaSeal.sealed(Sealed<SealedField, DataField> sealed)
      : _data = null,
        assert(sealed != null),
        _sealed = sealed,
        _sum = null,
        _enumeration = null;

  MetaSeal.sum(Sum<SumField> sum)
      : _data = null,
        _sealed = null,
        assert(sum != null),
        _sum = sum,
        _enumeration = null;

  MetaSeal.enumeration(Enum<EnumField, DataField> enumeration)
      : _data = null,
        _sealed = null,
        _sum = null,
        assert(enumeration != null),
        _enumeration = enumeration;

  MetaSeal(
      {Data<DataField> data,
      Sealed<SealedField, DataField> sealed,
      Sum<SumField> sum,
      Enum<EnumField, DataField> enumeration})
      : _data = data,
        _sealed = sealed,
        _sum = sum,
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
    if (sum != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (enumeration != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Data<DataField> _data;

  final Sealed<SealedField, DataField> _sealed;

  final Sum<SumField> _sum;

  final Enum<EnumField, DataField> _enumeration;

  String get name {
    return when(
      data: (data) => data.name,
      sealed: (sealed) => sealed.name,
      sum: (sum) => sum.name,
      enumeration: (enumeration) => enumeration.name,
    );
  }

  bool get isPrivate {
    return when(
      data: (data) => data.isPrivate,
      sealed: (sealed) => sealed.isPrivate,
      sum: (sum) => sum.isPrivate,
      enumeration: (enumeration) => enumeration.isPrivate,
    );
  }

  Iterable<TypeParameterDeclaration> get generics {
    return when(
      data: (data) => data.generics,
      sealed: (sealed) => sealed.generics,
      sum: (sum) => sum.generics,
      enumeration: (enumeration) => enumeration.generics,
    );
  }

  Iterable<Field> get fields {
    return when(
      data: (data) => data.fields,
      sealed: (sealed) => sealed.fields,
      sum: (sum) => sum.fields,
      enumeration: (enumeration) => enumeration.fields,
    );
  }

  Iterable<Method> get methods {
    return when(
      data: (data) => data.methods,
      sealed: (sealed) => sealed.methods,
      sum: (sum) => sum.methods,
      enumeration: (enumeration) => enumeration.methods,
    );
  }

  Data<DataField> get data {
    if (_data != null) return _data;
    throw Exception('TODO name htis');
  }

  Sealed<SealedField, DataField> get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('TODO name htis');
  }

  Sum<SumField> get sum {
    if (_sum != null) return _sum;
    throw Exception('TODO name htis');
  }

  Enum<EnumField, DataField> get enumeration {
    if (_enumeration != null) return _enumeration;
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

  bool get isEnumeration {
    return _enumeration != null;
  }

  void whenData(void Function(Data<DataField>) handler) {
    if (_data != null) handler(_data);
  }

  void whenSealed(void Function(Sealed<SealedField, DataField>) handler) {
    if (_sealed != null) handler(_sealed);
  }

  void whenSum(void Function(Sum<SumField>) handler) {
    if (_sum != null) handler(_sum);
  }

  void whenEnumeration(void Function(Enum<EnumField, DataField>) handler) {
    if (_enumeration != null) handler(_enumeration);
  }

  WHEN when<WHEN>(
      {WHEN Function(Data<DataField>) data,
      WHEN Function(Sealed<SealedField, DataField>) sealed,
      WHEN Function(Sum<SumField>) sum,
      WHEN Function(Enum<EnumField, DataField>) enumeration}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    if (_sum != null) {
      return sum(_sum);
    }
    if (_enumeration != null) {
      return enumeration(_enumeration);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data<DataField>) data,
      WHENO Function(Sealed<SealedField, DataField>) sealed,
      WHENO Function(Sum<SumField>) sum,
      WHENO Function(Enum<EnumField, DataField>) enumeration}) {
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
    if (_enumeration != null) {
      if (enumeration != null)
        return enumeration(_enumeration);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, _data.hashCode), _sealed.hashCode), _sum.hashCode),
        _enumeration.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaSeal) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _sum == other._sum &&
        _enumeration == other._enumeration;
  }

  String toString() {
    final value = when(
      data: (data) => 'data $data',
      sealed: (sealed) => 'sealed $sealed',
      sum: (sum) => 'sum $sum',
      enumeration: (enumeration) => 'enumeration $enumeration',
    );
    return 'MetaSeal( $value )';
  }
}

abstract class IMetaSeal {
  void whenData(void Function(Data<DataField>) handler);
  void whenSealed(void Function(Sealed<SealedField, DataField>) handler);
  void whenSum(void Function(Sum<SumField>) handler);
  void whenEnumeration(void Function(Enum<EnumField, DataField>) handler);
  WHEN when<WHEN>(
      {WHEN Function(Data<DataField>) data,
      WHEN Function(Sealed<SealedField, DataField>) sealed,
      WHEN Function(Sum<SumField>) sum,
      WHEN Function(Enum<EnumField, DataField>) enumeration});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data<DataField>) data,
      WHENO Function(Sealed<SealedField, DataField>) sealed,
      WHENO Function(Sum<SumField>) sum,
      WHENO Function(Enum<EnumField, DataField>) enumeration});
}

class Generic extends $Generic {
  Generic.declaration(TypeParameterDeclaration declaration)
      : assert(declaration != null),
        _declaration = declaration,
        _parameter = null;

  Generic.parameter(String parameter)
      : _declaration = null,
        assert(parameter != null),
        _parameter = parameter;

  Generic({TypeParameterDeclaration declaration, String parameter})
      : _declaration = declaration,
        _parameter = parameter {
    var found = false;
    if (declaration != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (parameter != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final TypeParameterDeclaration _declaration;

  final String _parameter;

  TypeParameterDeclaration get declaration {
    if (_declaration != null) return _declaration;
    throw Exception('TODO name htis');
  }

  String get parameter {
    if (_parameter != null) return _parameter;
    throw Exception('TODO name htis');
  }

  bool get isDeclaration {
    return _declaration != null;
  }

  bool get isParameter {
    return _parameter != null;
  }

  void whenDeclaration(void Function(TypeParameterDeclaration) handler) {
    if (_declaration != null) handler(_declaration);
  }

  void whenParameter(void Function(String) handler) {
    if (_parameter != null) handler(_parameter);
  }

  WHEN when<WHEN>(
      {WHEN Function(TypeParameterDeclaration) declaration,
      WHEN Function(String) parameter}) {
    if (_declaration != null) {
      return declaration(_declaration);
    }
    if (_parameter != null) {
      return parameter(_parameter);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(TypeParameterDeclaration) declaration,
      WHENO Function(String) parameter}) {
    if (_declaration != null) {
      if (declaration != null)
        return declaration(_declaration);
      else
        return otherwise();
    }
    if (_parameter != null) {
      if (parameter != null)
        return parameter(_parameter);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _declaration.hashCode), _parameter.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic) return false;
    return _declaration == other._declaration && _parameter == other._parameter;
  }

  String toString() {
    final value = when(
      declaration: (declaration) => 'declaration $declaration',
      parameter: (parameter) => 'parameter $parameter',
    );
    return 'Generic( $value )';
  }
}

abstract class IGeneric {
  void whenDeclaration(void Function(TypeParameterDeclaration) handler);
  void whenParameter(void Function(String) handler);
  WHEN when<WHEN>(
      {WHEN Function(TypeParameterDeclaration) declaration,
      WHEN Function(String) parameter});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(TypeParameterDeclaration) declaration,
      WHENO Function(String) parameter});
}

class TypeParameterDeclaration extends $TypeParameterDeclaration {
  const TypeParameterDeclaration(
      {String type, Option<FieldType> extension, String genericsStr})
      : _type = type,
        assert(type != null),
        _extension = extension,
        assert(extension != null),
        _genericsStr = genericsStr,
        assert(genericsStr != null);

  final String _type;

  final Option<FieldType> _extension;

  final String _genericsStr;

  TypeParameterDeclaration clone(
      {String type, Option<FieldType> extension, String genericsStr}) {
    return TypeParameterDeclaration(
      type: type ?? _type,
      extension: extension ?? _extension,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  String get type {
    return _type;
  }

  Option<FieldType> get extension {
    return _extension;
  }

  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, type.hashCode), extension.hashCode), genericsStr.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TypeParameterDeclaration) return false;
    return type == other.type &&
        extension == other.extension &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "TypeParameterDeclaration (type: $type, extension: $extension)";
  }
}

class FieldType extends $FieldType {
  const FieldType(
      {String type, Option<Iterable<FieldType>> generics, String genericsStr})
      : _type = type,
        assert(type != null),
        _generics = generics,
        assert(generics != null),
        _genericsStr = genericsStr,
        assert(genericsStr != null);

  final String _type;

  final Option<Iterable<FieldType>> _generics;

  final String _genericsStr;

  FieldType clone(
      {String type, Option<Iterable<FieldType>> generics, String genericsStr}) {
    return FieldType(
      type: type ?? _type,
      generics: generics ?? _generics,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  String get type {
    return _type;
  }

  Option<Iterable<FieldType>> get generics {
    return _generics;
  }

  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, type.hashCode), generics.hashCode), genericsStr.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FieldType) return false;
    return type == other.type &&
        generics == other.generics &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "FieldType (type: $type, generics: $generics)";
  }
}

class Method extends $Method {
  Method(
      {String name,
      Iterable<TypeParameterDeclaration> typeParams,
      FieldType returnType,
      Iterable<MethodParameter> inputs})
      : _name = name,
        assert(name != null),
        _typeParams = typeParams,
        assert(typeParams != null),
        _returnType = returnType,
        assert(returnType != null),
        _inputs = inputs,
        assert(inputs != null);

  final String _name;

  final Iterable<TypeParameterDeclaration> _typeParams;

  final FieldType _returnType;

  final Iterable<MethodParameter> _inputs;

  Method clone(
      {String name,
      Iterable<TypeParameterDeclaration> typeParams,
      FieldType returnType,
      Iterable<MethodParameter> inputs}) {
    return Method(
      name: name ?? _name,
      typeParams: typeParams ?? _typeParams,
      returnType: returnType ?? _returnType,
      inputs: inputs ?? _inputs,
    );
  }

  String get name {
    return _name;
  }

  Iterable<TypeParameterDeclaration> get typeParams {
    return _typeParams;
  }

  FieldType get returnType {
    return _returnType;
  }

  Iterable<MethodParameter> get inputs {
    return _inputs;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), typeParams.hashCode),
            returnType.hashCode),
        inputs.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Method) return false;
    return name == other.name &&
        typeParams == other.typeParams &&
        returnType == other.returnType &&
        inputs == other.inputs;
  }

  String toString() {
    return "Method (name: $name, typeParams: $typeParams, returnType: $returnType, inputs: $inputs)";
  }
}

class MethodParameter extends $MethodParameter {
  MethodParameter({String name, FieldType type})
      : _name = name,
        assert(name != null),
        _type = type,
        assert(type != null);

  final String _name;

  final FieldType _type;

  MethodParameter clone({String name, FieldType type}) {
    return MethodParameter(
      name: name ?? _name,
      type: type ?? _type,
    );
  }

  String get name {
    return _name;
  }

  FieldType get type {
    return _type;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), type.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MethodParameter) return false;
    return name == other.name && type == other.type;
  }

  String toString() {
    return "MethodParameter (name: $name, type: $type)";
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
  const SumField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  SumField clone({FieldType returnType, String name, bool isComputed}) {
    return SumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SumField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class SumValue extends $SumValue {
  const SumValue(
      {FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  SumValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return SumValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  FieldType get returnType {
    return _returnType;
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
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SumValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sum<T extends SumField> extends $Sum<T> {
  const Sum(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Sum<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods})
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
        assert(fields != null),
        _methods = methods,
        assert(methods != null);

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterfaceType<Sum<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  Sum<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Sum<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields,
      Iterable<Method> methods}) {
    return Sum(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
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

  Iterable<MetaInterfaceType<Sum<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, isFinal.hashCode),
                                    isInterface.hashCode),
                                isConst.hashCode),
                            interfaces.hashCode),
                        name.hashCode),
                    isPrivate.hashCode),
                generics.hashCode),
            fields.hashCode),
        methods.hashCode));
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
        fields == other.fields &&
        methods == other.methods;
  }

  String toString() {
    return "Sum (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields, methods: $methods)";
  }
}
