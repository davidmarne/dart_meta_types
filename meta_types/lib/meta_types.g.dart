// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class DataField extends $DataField {
  const DataField(
      {@required bool isAbstract,
      @required bool isDefaulted,
      @required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField})
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
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  @override
  bool get isAbstract {
    return _isAbstract;
  }

  @override
  bool get isDefaulted {
    return _isDefaulted;
  }

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  DataField copy(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return DataField(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  DataField copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc($jc($jc(0, _isAbstract.hashCode), _isDefaulted.hashCode),
                      _returnType.hashCode),
                  _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataField) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  @override
  String toString() {
    return 'DataField (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)';
  }
}

class DataValue extends $DataValue {
  const DataValue(
      {@required bool isAbstract,
      @required bool isDefaulted,
      @required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField,
      @required Object value})
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
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null),
        _value = value,
        assert(value != null);

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  final Object _value;

  @override
  bool get isAbstract {
    return _isAbstract;
  }

  @override
  bool get isDefaulted {
    return _isDefaulted;
  }

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  @override
  Object get value {
    return _value;
  }

  DataValue copy(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField,
      Object value}) {
    return DataValue(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
      value: value ?? _value,
    );
  }

  DataValue copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  DataValue copyValue({Object value}) {
    return copy(
      value: value ?? _value,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc(
                          $jc($jc(0, _isAbstract.hashCode),
                              _isDefaulted.hashCode),
                          _returnType.hashCode),
                      _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataValue) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField &&
        value == other.value;
  }

  @override
  String toString() {
    return 'DataValue (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)';
  }
}

class Data<T extends _$DataField> extends $Data<T> {
  const Data(
      {@required bool isFinal,
      @required bool isInterface,
      @required bool isConst,
      @required Iterable<MetaInterface<T, Data<T>>> interfaces,
      @required String name,
      @required bool isPrivate,
      @required Iterable<TypeParameterDeclaration> typeParameters,
      @required Iterable<T> fields,
      @required Iterable<Method> methods,
      @required bool serializable,
      @required bool implementsBase})
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
        _typeParameters = typeParameters,
        assert(typeParameters != null),
        _fields = fields,
        assert(fields != null),
        _methods = methods,
        assert(methods != null),
        _serializable = serializable,
        assert(serializable != null),
        _implementsBase = implementsBase,
        assert(implementsBase != null);

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterface<T, Data<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _typeParameters;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  final bool _serializable;

  final bool _implementsBase;

  @override
  bool get isFinal {
    return _isFinal;
  }

  @override
  bool get isInterface {
    return _isInterface;
  }

  @override
  bool get isConst {
    return _isConst;
  }

  @override
  Iterable<MetaInterface<T, Data<T>>> get interfaces {
    return _interfaces;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  @override
  Iterable<T> get fields {
    return _fields;
  }

  @override
  Iterable<Method> get methods {
    return _methods;
  }

  @override
  bool get serializable {
    return _serializable;
  }

  @override
  bool get implementsBase {
    return _implementsBase;
  }

  Data<T> copy(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterface<T, Data<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  Data<T> copyMeta(
      {String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return copy(
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc(
                          $jc(
                              $jc(
                                  $jc(
                                      $jc($jc(0, _isFinal.hashCode),
                                          _isInterface.hashCode),
                                      _isConst.hashCode),
                                  _interfaces.hashCode),
                              _name.hashCode),
                          _isPrivate.hashCode),
                      _typeParameters.hashCode),
                  _fields.hashCode),
              _methods.hashCode),
          _serializable.hashCode),
      _implementsBase.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        typeParameters == other.typeParameters &&
        fields == other.fields &&
        methods == other.methods &&
        serializable == other.serializable &&
        implementsBase == other.implementsBase;
  }

  @override
  String toString() {
    return 'Data (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)';
  }
}

class EnumField extends $EnumField {
  const EnumField(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  EnumField copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return EnumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  EnumField copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  @override
  String toString() {
    return 'EnumField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)';
  }
}

class EnumValue extends $EnumValue {
  const EnumValue(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField,
      @required Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  final Object _value;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  @override
  Object get value {
    return _value;
  }

  EnumValue copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField,
      Object value}) {
    return EnumValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
      value: value ?? _value,
    );
  }

  EnumValue copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  EnumValue copyValue({Object value}) {
    return copy(
      value: value ?? _value,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField &&
        value == other.value;
  }

  @override
  String toString() {
    return 'EnumValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)';
  }
}

class Enum<T extends _$EnumField, D extends _$DataField> extends $Enum<T, D> {
  const Enum(
      {@required String type,
      @required Iterable<MetaInterface<D, Data<D>>> dataInterfaces,
      @required String name,
      @required bool isPrivate,
      @required Iterable<TypeParameterDeclaration> typeParameters,
      @required Iterable<T> fields,
      @required Iterable<Method> methods,
      @required bool serializable,
      @required bool implementsBase})
      : _type = type,
        assert(type != null),
        _dataInterfaces = dataInterfaces,
        assert(dataInterfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _typeParameters = typeParameters,
        assert(typeParameters != null),
        _fields = fields,
        assert(fields != null),
        _methods = methods,
        assert(methods != null),
        _serializable = serializable,
        assert(serializable != null),
        _implementsBase = implementsBase,
        assert(implementsBase != null);

  final String _type;

  final Iterable<MetaInterface<D, Data<D>>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _typeParameters;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  final bool _serializable;

  final bool _implementsBase;

  @override
  String get type {
    return _type;
  }

  @override
  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  @override
  Iterable<T> get fields {
    return _fields;
  }

  @override
  Iterable<Method> get methods {
    return _methods;
  }

  @override
  bool get serializable {
    return _serializable;
  }

  @override
  bool get implementsBase {
    return _implementsBase;
  }

  Enum<T, D> copy(
      {String type,
      Iterable<MetaInterface<D, Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return Enum(
      type: type ?? _type,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  Enum<T, D> copyMeta(
      {String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return copy(
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc(
                          $jc(
                              $jc($jc(0, _type.hashCode),
                                  _dataInterfaces.hashCode),
                              _name.hashCode),
                          _isPrivate.hashCode),
                      _typeParameters.hashCode),
                  _fields.hashCode),
              _methods.hashCode),
          _serializable.hashCode),
      _implementsBase.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Enum) return false;
    return type == other.type &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        typeParameters == other.typeParameters &&
        fields == other.fields &&
        methods == other.methods &&
        serializable == other.serializable &&
        implementsBase == other.implementsBase;
  }

  @override
  String toString() {
    return 'Enum (type: $type, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)';
  }
}

class MetaInterface<F extends Field, T extends Meta<F>>
    extends $MetaInterface<F, T> {
  MetaInterface(
      {@required T meta,
      @required Iterable<FieldType> typeArguments,
      @required Iterable<F> parametarizedFields})
      : _meta = meta,
        assert(meta != null),
        _typeArguments = typeArguments,
        assert(typeArguments != null),
        _parametarizedFields = parametarizedFields,
        assert(parametarizedFields != null);

  final T _meta;

  final Iterable<FieldType> _typeArguments;

  final Iterable<F> _parametarizedFields;

  @override
  T get meta {
    return _meta;
  }

  @override
  Iterable<FieldType> get typeArguments {
    return _typeArguments;
  }

  @override
  Iterable<F> get parametarizedFields {
    return _parametarizedFields;
  }

  MetaInterface<F, T> copy(
      {T meta,
      Iterable<FieldType> typeArguments,
      Iterable<F> parametarizedFields}) {
    return MetaInterface(
      meta: meta ?? _meta,
      typeArguments: typeArguments ?? _typeArguments,
      parametarizedFields: parametarizedFields ?? _parametarizedFields,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc(0, _meta.hashCode), _typeArguments.hashCode),
      _parametarizedFields.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaInterface) return false;
    return meta == other.meta &&
        typeArguments == other.typeArguments &&
        parametarizedFields == other.parametarizedFields;
  }

  @override
  String toString() {
    return 'MetaInterface (meta: $meta, typeArguments: $typeArguments, parametarizedFields: $parametarizedFields)';
  }
}

class MetaSeal extends $MetaSeal {
  const MetaSeal.data(Data<DataField> data)
      : assert(data != null),
        _data = data,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  const MetaSeal.sealed(Sealed<SealedField, DataField> sealed)
      : _data = null,
        assert(sealed != null),
        _sealed = sealed,
        _sum = null,
        _enumeration = null;

  const MetaSeal.sum(Sum<SumField> sum)
      : _data = null,
        _sealed = null,
        assert(sum != null),
        _sum = sum,
        _enumeration = null;

  const MetaSeal.enumeration(Enum<EnumField, DataField> enumeration)
      : _data = null,
        _sealed = null,
        _sum = null,
        assert(enumeration != null),
        _enumeration = enumeration;

  final Data<DataField> _data;

  final Sealed<SealedField, DataField> _sealed;

  final Sum<SumField> _sum;

  final Enum<EnumField, DataField> _enumeration;

  @override
  String get name {
    return when(
      data: (data) => data.name,
      sealed: (sealed) => sealed.name,
      sum: (sum) => sum.name,
      enumeration: (enumeration) => enumeration.name,
    );
  }

  @override
  bool get isPrivate {
    return when(
      data: (data) => data.isPrivate,
      sealed: (sealed) => sealed.isPrivate,
      sum: (sum) => sum.isPrivate,
      enumeration: (enumeration) => enumeration.isPrivate,
    );
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return when(
      data: (data) => data.typeParameters,
      sealed: (sealed) => sealed.typeParameters,
      sum: (sum) => sum.typeParameters,
      enumeration: (enumeration) => enumeration.typeParameters,
    );
  }

  @override
  Iterable<Field> get fields {
    return when(
      data: (data) => data.fields,
      sealed: (sealed) => sealed.fields,
      sum: (sum) => sum.fields,
      enumeration: (enumeration) => enumeration.fields,
    );
  }

  @override
  Iterable<Method> get methods {
    return when(
      data: (data) => data.methods,
      sealed: (sealed) => sealed.methods,
      sum: (sum) => sum.methods,
      enumeration: (enumeration) => enumeration.methods,
    );
  }

  @override
  bool get serializable {
    return when(
      data: (data) => data.serializable,
      sealed: (sealed) => sealed.serializable,
      sum: (sum) => sum.serializable,
      enumeration: (enumeration) => enumeration.serializable,
    );
  }

  @override
  bool get implementsBase {
    return when(
      data: (data) => data.implementsBase,
      sealed: (sealed) => sealed.implementsBase,
      sum: (sum) => sum.implementsBase,
      enumeration: (enumeration) => enumeration.implementsBase,
    );
  }

  @override
  Data<DataField> get data {
    if (_data != null) return _data;
    throw Exception('Illegal access of sealed field, data is not set');
  }

  @override
  Sealed<SealedField, DataField> get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('Illegal access of sealed field, sealed is not set');
  }

  @override
  Sum<SumField> get sum {
    if (_sum != null) return _sum;
    throw Exception('Illegal access of sealed field, sum is not set');
  }

  @override
  Enum<EnumField, DataField> get enumeration {
    if (_enumeration != null) return _enumeration;
    throw Exception('Illegal access of sealed field, enumeration is not set');
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
    if (_data != null) {
      return handler(_data);
    }
  }

  void whenSealed(void Function(Sealed<SealedField, DataField>) handler) {
    if (_sealed != null) {
      return handler(_sealed);
    }
  }

  void whenSum(void Function(Sum<SumField>) handler) {
    if (_sum != null) {
      return handler(_sum);
    }
  }

  void whenEnumeration(void Function(Enum<EnumField, DataField>) handler) {
    if (_enumeration != null) {
      return handler(_enumeration);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(Data<DataField>) data,
      @required WHEN Function(Sealed<SealedField, DataField>) sealed,
      @required WHEN Function(Sum<SumField>) sum,
      @required WHEN Function(Enum<EnumField, DataField>) enumeration}) {
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

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(Data<DataField>) data,
      WHEN Function(Sealed<SealedField, DataField>) sealed,
      WHEN Function(Sum<SumField>) sum,
      WHEN Function(Enum<EnumField, DataField>) enumeration}) {
    if (_data != null) {
      if (data != null) {
        return data(_data);
      } else {
        return otherwise();
      }
    }
    if (_sealed != null) {
      if (sealed != null) {
        return sealed(_sealed);
      } else {
        return otherwise();
      }
    }
    if (_sum != null) {
      if (sum != null) {
        return sum(_sum);
      } else {
        return otherwise();
      }
    }
    if (_enumeration != null) {
      if (enumeration != null) {
        return enumeration(_enumeration);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _data.hashCode), _sealed.hashCode), _sum.hashCode),
      _enumeration.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaSeal) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _sum == other._sum &&
        _enumeration == other._enumeration;
  }

  @override
  String toString() {
    return 'MetaSeal (${when(data: (data) => 'data $data', sealed: (sealed) => 'sealed $sealed', sum: (sum) => 'sum $sum', enumeration: (enumeration) => 'enumeration $enumeration')}))';
  }
}

class TypeParameterDeclaration extends $TypeParameterDeclaration {
  const TypeParameterDeclaration(
      {@required String type,
      @required Option<FieldType> extension,
      String genericsStr})
      : _type = type,
        assert(type != null),
        _extension = extension,
        assert(extension != null),
        _genericsStr = genericsStr;

  final String _type;

  final Option<FieldType> _extension;

  final String _genericsStr;

  @override
  String get type {
    return _type;
  }

  @override
  Option<FieldType> get extension {
    return _extension;
  }

  @override
  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  TypeParameterDeclaration copy(
      {String type, Option<FieldType> extension, String genericsStr}) {
    return TypeParameterDeclaration(
      type: type ?? _type,
      extension: extension ?? _extension,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc(0, _type.hashCode), _extension.hashCode), genericsStr.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TypeParameterDeclaration) return false;
    return type == other.type &&
        extension == other.extension &&
        genericsStr == other.genericsStr;
  }

  @override
  String toString() {
    return 'TypeParameterDeclaration (type: $type, extension: $extension, genericsStr: $genericsStr)';
  }
}

class FieldType extends $FieldType {
  const FieldType(
      {@required String type,
      @required Option<Iterable<FieldType>> generics,
      String genericsStr})
      : _type = type,
        assert(type != null),
        _generics = generics,
        assert(generics != null),
        _genericsStr = genericsStr;

  final String _type;

  final Option<Iterable<FieldType>> _generics;

  final String _genericsStr;

  @override
  String get type {
    return _type;
  }

  @override
  Option<Iterable<FieldType>> get generics {
    return _generics;
  }

  @override
  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  FieldType copy(
      {String type, Option<Iterable<FieldType>> generics, String genericsStr}) {
    return FieldType(
      type: type ?? _type,
      generics: generics ?? _generics,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc(0, _type.hashCode), _generics.hashCode), genericsStr.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FieldType) return false;
    return type == other.type &&
        generics == other.generics &&
        genericsStr == other.genericsStr;
  }

  @override
  String toString() {
    return 'FieldType (type: $type, generics: $generics, genericsStr: $genericsStr)';
  }
}

abstract class FieldBase {
  Field copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField});
}

class Method extends $Method {
  Method(
      {@required String name,
      @required Iterable<TypeParameterDeclaration> typeParameters,
      @required FieldType returnType,
      @required Iterable<MethodParameter> inputs})
      : _name = name,
        assert(name != null),
        _typeParameters = typeParameters,
        assert(typeParameters != null),
        _returnType = returnType,
        assert(returnType != null),
        _inputs = inputs,
        assert(inputs != null);

  final String _name;

  final Iterable<TypeParameterDeclaration> _typeParameters;

  final FieldType _returnType;

  final Iterable<MethodParameter> _inputs;

  @override
  String get name {
    return _name;
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  Iterable<MethodParameter> get inputs {
    return _inputs;
  }

  Method copy(
      {String name,
      Iterable<TypeParameterDeclaration> typeParameters,
      FieldType returnType,
      Iterable<MethodParameter> inputs}) {
    return Method(
      name: name ?? _name,
      typeParameters: typeParameters ?? _typeParameters,
      returnType: returnType ?? _returnType,
      inputs: inputs ?? _inputs,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _name.hashCode), _typeParameters.hashCode),
          _returnType.hashCode),
      _inputs.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Method) return false;
    return name == other.name &&
        typeParameters == other.typeParameters &&
        returnType == other.returnType &&
        inputs == other.inputs;
  }

  @override
  String toString() {
    return 'Method (name: $name, typeParameters: $typeParameters, returnType: $returnType, inputs: $inputs)';
  }
}

class MethodParameter extends $MethodParameter {
  MethodParameter({@required String name, @required FieldType type})
      : _name = name,
        assert(name != null),
        _type = type,
        assert(type != null);

  final String _name;

  final FieldType _type;

  @override
  String get name {
    return _name;
  }

  @override
  FieldType get type {
    return _type;
  }

  MethodParameter copy({String name, FieldType type}) {
    return MethodParameter(
      name: name ?? _name,
      type: type ?? _type,
    );
  }

  @override
  int get hashCode => $jf($jc($jc(0, _name.hashCode), _type.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MethodParameter) return false;
    return name == other.name && type == other.type;
  }

  @override
  String toString() {
    return 'MethodParameter (name: $name, type: $type)';
  }
}

class SealedField extends $SealedField {
  const SealedField(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  SealedField copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return SealedField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  SealedField copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  @override
  String toString() {
    return 'SealedField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)';
  }
}

class SealedValue extends $SealedValue {
  const SealedValue(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField,
      @required Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  final Object _value;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  @override
  Object get value {
    return _value;
  }

  SealedValue copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField,
      Object value}) {
    return SealedValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
      value: value ?? _value,
    );
  }

  SealedValue copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  SealedValue copyValue({Object value}) {
    return copy(
      value: value ?? _value,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField &&
        value == other.value;
  }

  @override
  String toString() {
    return 'SealedValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)';
  }
}

class Sealed<T extends _$SealedField, D extends _$DataField>
    extends $Sealed<T, D> {
  const Sealed(
      {@required bool isConst,
      @required Iterable<MetaInterface<D, Data<D>>> dataInterfaces,
      @required String name,
      @required bool isPrivate,
      @required Iterable<TypeParameterDeclaration> typeParameters,
      @required Iterable<T> fields,
      @required Iterable<Method> methods,
      @required bool serializable,
      @required bool implementsBase})
      : _isConst = isConst,
        assert(isConst != null),
        _dataInterfaces = dataInterfaces,
        assert(dataInterfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _typeParameters = typeParameters,
        assert(typeParameters != null),
        _fields = fields,
        assert(fields != null),
        _methods = methods,
        assert(methods != null),
        _serializable = serializable,
        assert(serializable != null),
        _implementsBase = implementsBase,
        assert(implementsBase != null);

  final bool _isConst;

  final Iterable<MetaInterface<D, Data<D>>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _typeParameters;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  final bool _serializable;

  final bool _implementsBase;

  @override
  bool get isConst {
    return _isConst;
  }

  @override
  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  @override
  Iterable<T> get fields {
    return _fields;
  }

  @override
  Iterable<Method> get methods {
    return _methods;
  }

  @override
  bool get serializable {
    return _serializable;
  }

  @override
  bool get implementsBase {
    return _implementsBase;
  }

  Sealed<T, D> copy(
      {bool isConst,
      Iterable<MetaInterface<D, Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return Sealed(
      isConst: isConst ?? _isConst,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  Sealed<T, D> copyMeta(
      {String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return copy(
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc(
                          $jc(
                              $jc($jc(0, _isConst.hashCode),
                                  _dataInterfaces.hashCode),
                              _name.hashCode),
                          _isPrivate.hashCode),
                      _typeParameters.hashCode),
                  _fields.hashCode),
              _methods.hashCode),
          _serializable.hashCode),
      _implementsBase.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sealed) return false;
    return isConst == other.isConst &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        typeParameters == other.typeParameters &&
        fields == other.fields &&
        methods == other.methods &&
        serializable == other.serializable &&
        implementsBase == other.implementsBase;
  }

  @override
  String toString() {
    return 'Sealed (isConst: $isConst, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)';
  }
}

class SumField extends $SumField {
  const SumField(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  SumField copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return SumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  SumField copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  @override
  String toString() {
    return 'SumField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)';
  }
}

class SumValue extends $SumValue {
  const SumValue(
      {@required FieldType returnType,
      @required String name,
      @required bool isComputed,
      @required bool isPrivate,
      @required Option<SerializableField> serialableField,
      @required Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _serialableField = serialableField,
        assert(serialableField != null),
        _value = value,
        assert(value != null);

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final bool _isPrivate;

  final Option<SerializableField> _serialableField;

  final Object _value;

  @override
  FieldType get returnType {
    return _returnType;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isComputed {
    return _isComputed;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Option<SerializableField> get serialableField {
    return _serialableField;
  }

  @override
  Object get value {
    return _value;
  }

  SumValue copy(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField,
      Object value}) {
    return SumValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
      value: value ?? _value,
    );
  }

  SumValue copyField(
      {FieldType returnType,
      String name,
      bool isComputed,
      bool isPrivate,
      Option<SerializableField> serialableField}) {
    return copy(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      isPrivate: isPrivate ?? _isPrivate,
      serialableField: serialableField ?? _serialableField,
    );
  }

  SumValue copyValue({Object value}) {
    return copy(
      value: value ?? _value,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField &&
        value == other.value;
  }

  @override
  String toString() {
    return 'SumValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)';
  }
}

class Sum<T extends _$SumField> extends $Sum<T> {
  const Sum(
      {@required bool isFinal,
      @required bool isInterface,
      @required bool isConst,
      @required Iterable<MetaInterface<T, Sum<T>>> interfaces,
      @required String name,
      @required bool isPrivate,
      @required Iterable<TypeParameterDeclaration> typeParameters,
      @required Iterable<T> fields,
      @required Iterable<Method> methods,
      @required bool serializable,
      @required bool implementsBase})
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
        _typeParameters = typeParameters,
        assert(typeParameters != null),
        _fields = fields,
        assert(fields != null),
        _methods = methods,
        assert(methods != null),
        _serializable = serializable,
        assert(serializable != null),
        _implementsBase = implementsBase,
        assert(implementsBase != null);

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterface<T, Sum<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _typeParameters;

  final Iterable<T> _fields;

  final Iterable<Method> _methods;

  final bool _serializable;

  final bool _implementsBase;

  @override
  bool get isFinal {
    return _isFinal;
  }

  @override
  bool get isInterface {
    return _isInterface;
  }

  @override
  bool get isConst {
    return _isConst;
  }

  @override
  Iterable<MetaInterface<T, Sum<T>>> get interfaces {
    return _interfaces;
  }

  @override
  String get name {
    return _name;
  }

  @override
  bool get isPrivate {
    return _isPrivate;
  }

  @override
  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  @override
  Iterable<T> get fields {
    return _fields;
  }

  @override
  Iterable<Method> get methods {
    return _methods;
  }

  @override
  bool get serializable {
    return _serializable;
  }

  @override
  bool get implementsBase {
    return _implementsBase;
  }

  Sum<T> copy(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterface<T, Sum<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return Sum(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  Sum<T> copyMeta(
      {String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> typeParameters,
      Iterable<T> fields,
      Iterable<Method> methods,
      bool serializable,
      bool implementsBase}) {
    return copy(
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      typeParameters: typeParameters ?? _typeParameters,
      fields: fields ?? _fields,
      methods: methods ?? _methods,
      serializable: serializable ?? _serializable,
      implementsBase: implementsBase ?? _implementsBase,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc(
                          $jc(
                              $jc(
                                  $jc(
                                      $jc($jc(0, _isFinal.hashCode),
                                          _isInterface.hashCode),
                                      _isConst.hashCode),
                                  _interfaces.hashCode),
                              _name.hashCode),
                          _isPrivate.hashCode),
                      _typeParameters.hashCode),
                  _fields.hashCode),
              _methods.hashCode),
          _serializable.hashCode),
      _implementsBase.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sum) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        typeParameters == other.typeParameters &&
        fields == other.fields &&
        methods == other.methods &&
        serializable == other.serializable &&
        implementsBase == other.implementsBase;
  }

  @override
  String toString() {
    return 'Sum (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)';
  }
}
