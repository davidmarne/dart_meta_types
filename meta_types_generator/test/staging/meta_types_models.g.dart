// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types_models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Json extends $Json {
  Json.object(Map<String, Json> object)
      : assert(object != null),
        _object = object,
        _array = null,
        _string = null,
        _number = null,
        _boolean = null,
        _nil = null;

  Json.array(List<Json> array)
      : _object = null,
        assert(array != null),
        _array = array,
        _string = null,
        _number = null,
        _boolean = null,
        _nil = null;

  Json.string(String string)
      : _object = null,
        _array = null,
        assert(string != null),
        _string = string,
        _number = null,
        _boolean = null,
        _nil = null;

  Json.number(num number)
      : _object = null,
        _array = null,
        _string = null,
        assert(number != null),
        _number = number,
        _boolean = null,
        _nil = null;

  Json.boolean(bool boolean)
      : _object = null,
        _array = null,
        _string = null,
        _number = null,
        assert(boolean != null),
        _boolean = boolean,
        _nil = null;

  Json.nil(Null nil)
      : _object = null,
        _array = null,
        _string = null,
        _number = null,
        _boolean = null,
        assert(nil != null),
        _nil = nil;

  final Map<String, Json> _object;

  final List<Json> _array;

  final String _string;

  final num _number;

  final bool _boolean;

  final Null _nil;

  Map<String, Json> get object {
    if (_object != null) return _object;
    throw Exception('Illegal access of sum field, object is not set');
  }

  List<Json> get array {
    if (_array != null) return _array;
    throw Exception('Illegal access of sum field, array is not set');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sum field, string is not set');
  }

  num get number {
    if (_number != null) return _number;
    throw Exception('Illegal access of sum field, number is not set');
  }

  bool get boolean {
    if (_boolean != null) return _boolean;
    throw Exception('Illegal access of sum field, boolean is not set');
  }

  Null get nil {
    if (_nil != null) return _nil;
    throw Exception('Illegal access of sum field, nil is not set');
  }

  bool get isObject {
    return _object != null;
  }

  bool get isArray {
    return _array != null;
  }

  bool get isString {
    return _string != null;
  }

  bool get isNumber {
    return _number != null;
  }

  bool get isBoolean {
    return _boolean != null;
  }

  bool get isNil {
    return _nil != null;
  }

  void whenObject(void Function(Map<String, Json>) handler) {
    if (_object != null) return handler(_object);
  }

  void whenArray(void Function(List<Json>) handler) {
    if (_array != null) return handler(_array);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) return handler(_string);
  }

  void whenNumber(void Function(num) handler) {
    if (_number != null) return handler(_number);
  }

  void whenBoolean(void Function(bool) handler) {
    if (_boolean != null) return handler(_boolean);
  }

  void whenNil(void Function(Null) handler) {
    if (_nil != null) return handler(_nil);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(Map<String, Json>) object,
      @required WHEN Function(List<Json>) array,
      @required WHEN Function(String) string,
      @required WHEN Function(num) number,
      @required WHEN Function(bool) boolean,
      @required WHEN Function(Null) nil}) {
    if (_object != null) {
      return object(_object);
    }
    if (_array != null) {
      return array(_array);
    }
    if (_string != null) {
      return string(_string);
    }
    if (_number != null) {
      return number(_number);
    }
    if (_boolean != null) {
      return boolean(_boolean);
    }
    if (_nil != null) {
      return nil(_nil);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(Map<String, Json>) object,
      WHEN Function(List<Json>) array,
      WHEN Function(String) string,
      WHEN Function(num) number,
      WHEN Function(bool) boolean,
      WHEN Function(Null) nil}) {
    if (_object != null) {
      if (object != null)
        return object(_object);
      else
        return otherwise();
    }
    if (_array != null) {
      if (array != null)
        return array(_array);
      else
        return otherwise();
    }
    if (_string != null) {
      if (string != null)
        return string(_string);
      else
        return otherwise();
    }
    if (_number != null) {
      if (number != null)
        return number(_number);
      else
        return otherwise();
    }
    if (_boolean != null) {
      if (boolean != null)
        return boolean(_boolean);
      else
        return otherwise();
    }
    if (_nil != null) {
      if (nil != null)
        return nil(_nil);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _object.hashCode), _array.hashCode),
                  _string.hashCode),
              _number.hashCode),
          _boolean.hashCode),
      _nil.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Json) return false;
    return _object == other._object &&
        _array == other._array &&
        _string == other._string &&
        _number == other._number &&
        _boolean == other._boolean &&
        _nil == other._nil;
  }

  String toString() {
    return "Json (${when(object: (object) => 'object $object', array: (array) => 'array $array', string: (string) => 'string $string', number: (number) => 'number $number', boolean: (boolean) => 'boolean $boolean', nil: (nil) => 'nil $nil')}))";
  }
}

class Either<A, B> extends $Either<A, B> {
  Either.a(A a)
      : assert(a != null),
        _a = a,
        _b = null;

  Either.b(B b)
      : _a = null,
        assert(b != null),
        _b = b;

  Either<B, A> _reversed;

  final A _a;

  final B _b;

  @override
  Either<B, A> get reversed {
    return _reversed ??= super.reversed;
  }

  A get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  B get b {
    if (_b != null) return _b;
    throw Exception('Illegal access of sum field, b is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(A) handler) {
    if (_a != null) return handler(_a);
  }

  void whenB(void Function(B) handler) {
    if (_b != null) return handler(_b);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(A) a, @required WHEN Function(B) b}) {
    if (_a != null) {
      return a(_a);
    }
    if (_b != null) {
      return b(_b);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise, WHEN Function(A) a, WHEN Function(B) b}) {
    if (_a != null) {
      if (a != null)
        return a(_a);
      else
        return otherwise();
    }
    if (_b != null) {
      if (b != null)
        return b(_b);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Either) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    return "Either (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))";
  }
}

class EitherSerializer extends StructuredSerializer<Either> {
  @override
  final Iterable<Type> types = const [Either];

  @override
  final String wireName = 'Either';

  @override
  Iterable<Object> serialize(Serializers serializers, Either object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: paramA)
            ],
        b: (object) => [
              'kind',
              serializers.serialize('b', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: paramB)
            ]);
  }

  @override
  Either deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];
    final iterator = serialized.iterator;
    iterator.moveNext();
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    iterator.moveNext();
    final dynamic value$ = iterator.current;
    switch (key) {
      case 'a':
        return Either.a(serializers.deserialize(value$, specifiedType: paramA));
      case 'b':
        return Either.b(serializers.deserialize(value$, specifiedType: paramB));
    }
    throw FallThroughError();
  }
}

abstract class EitherBase<A, B> {
  bool get isA;
  bool get isB;
  void whenA(void Function(A) handler);
  void whenB(void Function(B) handler);
  WHEN when<WHEN>({@required WHEN Function(A) a, @required WHEN Function(B) b});
  WHEN wheno<WHEN>(
      {WHEN Function() otherwise, WHEN Function(A) a, WHEN Function(B) b});
}

class Result<S, E> extends $Result<S, E> {
  Result.success(S success)
      : assert(success != null),
        _success = success,
        _error = null;

  Result.error(Err<E> error)
      : _success = null,
        assert(error != null),
        _error = error;

  final S _success;

  final Err<E> _error;

  S get success {
    if (_success != null) return _success;
    throw Exception('Illegal access of sum field, success is not set');
  }

  Err<E> get error {
    if (_error != null) return _error;
    throw Exception('Illegal access of sum field, error is not set');
  }

  bool get isSuccess {
    return _success != null;
  }

  bool get isError {
    return _error != null;
  }

  void whenSuccess(void Function(S) handler) {
    if (_success != null) return handler(_success);
  }

  void whenError(void Function(Err<E>) handler) {
    if (_error != null) return handler(_error);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(S) success,
      @required WHEN Function(Err<E>) error}) {
    if (_success != null) {
      return success(_success);
    }
    if (_error != null) {
      return error(_error);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(S) success,
      WHEN Function(Err<E>) error}) {
    if (_success != null) {
      if (success != null)
        return success(_success);
      else
        return otherwise();
    }
    if (_error != null) {
      if (error != null)
        return error(_error);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _success.hashCode), _error.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    return _success == other._success && _error == other._error;
  }

  String toString() {
    return "Result (${when(success: (success) => 'success $success', error: (error) => 'error $error')}))";
  }
}

abstract class ResultBase<S, E> {
  bool get isSuccess;
  bool get isError;
  void whenSuccess(void Function(S) handler);
  void whenError(void Function(Err<E>) handler);
  WHEN when<WHEN>(
      {@required WHEN Function(S) success,
      @required WHEN Function(Err<E>) error});
  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(S) success,
      WHEN Function(Err<E>) error});
}

class Err<E> extends $Err<E> {
  Err({@required E error, @required StackTrace trace})
      : _error = error,
        assert(error != null),
        _trace = trace,
        assert(trace != null);

  final E _error;

  final StackTrace _trace;

  E get error {
    return _error;
  }

  StackTrace get trace {
    return _trace;
  }

  Err<E> copy({E error, StackTrace trace}) {
    return Err(
      error: error ?? _error,
      trace: trace ?? _trace,
    );
  }

  int get hashCode => $jf($jc($jc(0, _error.hashCode), _trace.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Err) return false;
    return error == other.error && trace == other.trace;
  }

  String toString() {
    return "Err (error: $error, trace: $trace)";
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  String toString() {
    return "SealedField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)";
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Option<SerializableField> get serialableField {
    return _serialableField;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
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

  String toString() {
    return "SealedValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)";
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

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  bool get serializable {
    return _serializable;
  }

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

  String toString() {
    return "Sealed (isConst: $isConst, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)";
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  String toString() {
    return "EnumField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)";
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Option<SerializableField> get serialableField {
    return _serialableField;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
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

  String toString() {
    return "EnumValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)";
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

  String get type {
    return _type;
  }

  Iterable<MetaInterface<D, Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  bool get serializable {
    return _serializable;
  }

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

  String toString() {
    return "Enum (type: $type, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)";
  }
}

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

  bool get isPrivate {
    return _isPrivate;
  }

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

  String toString() {
    return "DataField (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)";
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

  bool get isPrivate {
    return _isPrivate;
  }

  Option<SerializableField> get serialableField {
    return _serialableField;
  }

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

  String toString() {
    return "DataValue (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)";
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

  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterface<T, Data<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  bool get serializable {
    return _serializable;
  }

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

  String toString() {
    return "Data (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)";
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

  T get meta {
    return _meta;
  }

  Iterable<FieldType> get typeArguments {
    return _typeArguments;
  }

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

  int get hashCode => $jf($jc(
      $jc($jc(0, _meta.hashCode), _typeArguments.hashCode),
      _parametarizedFields.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaInterface) return false;
    return meta == other.meta &&
        typeArguments == other.typeArguments &&
        parametarizedFields == other.parametarizedFields;
  }

  String toString() {
    return "MetaInterface (meta: $meta, typeArguments: $typeArguments, parametarizedFields: $parametarizedFields)";
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

  Iterable<TypeParameterDeclaration> get typeParameters {
    return when(
      data: (data) => data.typeParameters,
      sealed: (sealed) => sealed.typeParameters,
      sum: (sum) => sum.typeParameters,
      enumeration: (enumeration) => enumeration.typeParameters,
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

  bool get serializable {
    return when(
      data: (data) => data.serializable,
      sealed: (sealed) => sealed.serializable,
      sum: (sum) => sum.serializable,
      enumeration: (enumeration) => enumeration.serializable,
    );
  }

  bool get implementsBase {
    return when(
      data: (data) => data.implementsBase,
      sealed: (sealed) => sealed.implementsBase,
      sum: (sum) => sum.implementsBase,
      enumeration: (enumeration) => enumeration.implementsBase,
    );
  }

  Data<DataField> get data {
    if (_data != null) return _data;
    throw Exception('Illegal access of sealed field, data is not set');
  }

  Sealed<SealedField, DataField> get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('Illegal access of sealed field, sealed is not set');
  }

  Sum<SumField> get sum {
    if (_sum != null) return _sum;
    throw Exception('Illegal access of sealed field, sum is not set');
  }

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
    if (_data != null) return handler(_data);
  }

  void whenSealed(void Function(Sealed<SealedField, DataField>) handler) {
    if (_sealed != null) return handler(_sealed);
  }

  void whenSum(void Function(Sum<SumField>) handler) {
    if (_sum != null) return handler(_sum);
  }

  void whenEnumeration(void Function(Enum<EnumField, DataField>) handler) {
    if (_enumeration != null) return handler(_enumeration);
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

  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _data.hashCode), _sealed.hashCode), _sum.hashCode),
      _enumeration.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaSeal) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _sum == other._sum &&
        _enumeration == other._enumeration;
  }

  String toString() {
    return "MetaSeal (${when(data: (data) => 'data $data', sealed: (sealed) => 'sealed $sealed', sum: (sum) => 'sum $sum', enumeration: (enumeration) => 'enumeration $enumeration')}))";
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

  String get type {
    return _type;
  }

  Option<FieldType> get extension {
    return _extension;
  }

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

  int get hashCode => $jf($jc(
      $jc($jc(0, _type.hashCode), _extension.hashCode), genericsStr.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TypeParameterDeclaration) return false;
    return type == other.type &&
        extension == other.extension &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "TypeParameterDeclaration (type: $type, extension: $extension, genericsStr: $genericsStr)";
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

  String get type {
    return _type;
  }

  Option<Iterable<FieldType>> get generics {
    return _generics;
  }

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

  int get hashCode => $jf($jc(
      $jc($jc(0, _type.hashCode), _generics.hashCode), genericsStr.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FieldType) return false;
    return type == other.type &&
        generics == other.generics &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "FieldType (type: $type, generics: $generics, genericsStr: $genericsStr)";
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

  String get name {
    return _name;
  }

  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  FieldType get returnType {
    return _returnType;
  }

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

  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _name.hashCode), _typeParameters.hashCode),
          _returnType.hashCode),
      _inputs.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Method) return false;
    return name == other.name &&
        typeParameters == other.typeParameters &&
        returnType == other.returnType &&
        inputs == other.inputs;
  }

  String toString() {
    return "Method (name: $name, typeParameters: $typeParameters, returnType: $returnType, inputs: $inputs)";
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

  String get name {
    return _name;
  }

  FieldType get type {
    return _type;
  }

  MethodParameter copy({String name, FieldType type}) {
    return MethodParameter(
      name: name ?? _name,
      type: type ?? _type,
    );
  }

  int get hashCode => $jf($jc($jc(0, _name.hashCode), _type.hashCode));
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
  const Option.some(T some)
      : assert(some != null),
        _some = some,
        _none = null;

  const Option.none()
      : _some = null,
        _none = true;

  final T _some;

  final bool _none;

  T get some {
    if (_some != null) return _some;
    throw Exception('Illegal access of sum field, some is not set');
  }

  void get none {
    if (_none != null) return;
    throw Exception('Illegal access of sum field, none is not set');
  }

  bool get isSome {
    return _some != null;
  }

  bool get isNone {
    return _none != null;
  }

  void whenSome(void Function(T) handler) {
    if (_some != null) return handler(_some);
  }

  void whenNone(void Function() handler) {
    if (_none != null) return handler();
  }

  WHEN when<WHEN>(
      {@required WHEN Function(T) some, @required WHEN Function() none}) {
    if (_some != null) {
      return some(_some);
    }
    if (_none != null) {
      return none();
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(T) some,
      WHEN Function() none}) {
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

  int get hashCode => $jf($jc($jc(0, _some.hashCode), _none.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Option) return false;
    return _some == other._some && _none == other._none;
  }

  String toString() {
    return "Option (${when(some: (some) => 'some $some', none: () => 'none')}))";
  }
}

class OptionSerializer extends StructuredSerializer<Option> {
  @override
  final Iterable<Type> types = const [Option];

  @override
  final String wireName = 'Option';

  @override
  Iterable<Object> serialize(Serializers serializers, Option object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    return object.when(
        some: (object) => [
              'kind',
              serializers.serialize('some', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: paramT)
            ],
        none: () => [
              'kind',
              serializers.serialize('none', specifiedType: FullType(String)),
              'value',
              serializers.serialize(true, specifiedType: FullType(bool))
            ]);
  }

  @override
  Option deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final iterator = serialized.iterator;
    iterator.moveNext();
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    iterator.moveNext();
    final dynamic value$ = iterator.current;
    switch (key) {
      case 'some':
        return Option.some(
            serializers.deserialize(value$, specifiedType: paramT));
      case 'none':
        return Option.none();
    }
    throw FallThroughError();
  }
}

abstract class OptionBase<T> {
  bool get isSome;
  bool get isNone;
  void whenSome(void Function(T) handler);
  void whenNone(void Function() handler);
  WHEN when<WHEN>(
      {@required WHEN Function(T) some, @required WHEN Function() none});
  WHEN wheno<WHEN>(
      {WHEN Function() otherwise, WHEN Function(T) some, WHEN Function() none});
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
              _isComputed.hashCode),
          _isPrivate.hashCode),
      _serialableField.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        isPrivate == other.isPrivate &&
        serialableField == other.serialableField;
  }

  String toString() {
    return "SumField (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField)";
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

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Option<SerializableField> get serialableField {
    return _serialableField;
  }

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

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _returnType.hashCode), _name.hashCode),
                  _isComputed.hashCode),
              _isPrivate.hashCode),
          _serialableField.hashCode),
      _value.hashCode));
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

  String toString() {
    return "SumValue (returnType: $returnType, name: $name, isComputed: $isComputed, isPrivate: $isPrivate, serialableField: $serialableField, value: $value)";
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

  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterface<T, Sum<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get typeParameters {
    return _typeParameters;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<Method> get methods {
    return _methods;
  }

  bool get serializable {
    return _serializable;
  }

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

  String toString() {
    return "Sum (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, typeParameters: $typeParameters, fields: $fields, methods: $methods, serializable: $serializable, implementsBase: $implementsBase)";
  }
}
