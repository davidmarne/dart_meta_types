// GENERATED CODE - DO NOT MODIFY BY HAND

part of core;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

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

  @override
  A get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  @override
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
    if (_a != null) {
      return handler(_a);
    }
  }

  void whenB(void Function(B) handler) {
    if (_b != null) {
      return handler(_b);
    }
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
      if (a != null) {
        return a(_a);
      } else {
        return otherwise();
      }
    }
    if (_b != null) {
      if (b != null) {
        return b(_b);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Either) return false;
    return _a == other._a && _b == other._b;
  }

  @override
  String toString() {
    return 'Either (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))';
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

  @override
  Map<String, Json> get object {
    if (_object != null) return _object;
    throw Exception('Illegal access of sum field, object is not set');
  }

  @override
  List<Json> get array {
    if (_array != null) return _array;
    throw Exception('Illegal access of sum field, array is not set');
  }

  @override
  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sum field, string is not set');
  }

  @override
  num get number {
    if (_number != null) return _number;
    throw Exception('Illegal access of sum field, number is not set');
  }

  @override
  bool get boolean {
    if (_boolean != null) return _boolean;
    throw Exception('Illegal access of sum field, boolean is not set');
  }

  @override
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
    if (_object != null) {
      return handler(_object);
    }
  }

  void whenArray(void Function(List<Json>) handler) {
    if (_array != null) {
      return handler(_array);
    }
  }

  void whenString(void Function(String) handler) {
    if (_string != null) {
      return handler(_string);
    }
  }

  void whenNumber(void Function(num) handler) {
    if (_number != null) {
      return handler(_number);
    }
  }

  void whenBoolean(void Function(bool) handler) {
    if (_boolean != null) {
      return handler(_boolean);
    }
  }

  void whenNil(void Function(Null) handler) {
    if (_nil != null) {
      return handler(_nil);
    }
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
      if (object != null) {
        return object(_object);
      } else {
        return otherwise();
      }
    }
    if (_array != null) {
      if (array != null) {
        return array(_array);
      } else {
        return otherwise();
      }
    }
    if (_string != null) {
      if (string != null) {
        return string(_string);
      } else {
        return otherwise();
      }
    }
    if (_number != null) {
      if (number != null) {
        return number(_number);
      } else {
        return otherwise();
      }
    }
    if (_boolean != null) {
      if (boolean != null) {
        return boolean(_boolean);
      } else {
        return otherwise();
      }
    }
    if (_nil != null) {
      if (nil != null) {
        return nil(_nil);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc($jc($jc(0, _object.hashCode), _array.hashCode),
                  _string.hashCode),
              _number.hashCode),
          _boolean.hashCode),
      _nil.hashCode));
  @override
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

  @override
  String toString() {
    return 'Json (${when(object: (object) => 'object $object', array: (array) => 'array $array', string: (string) => 'string $string', number: (number) => 'number $number', boolean: (boolean) => 'boolean $boolean', nil: (nil) => 'nil $nil')}))';
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

  @override
  T get some {
    if (_some != null) return _some;
    throw Exception('Illegal access of sum field, some is not set');
  }

  @override
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
    if (_some != null) {
      return handler(_some);
    }
  }

  void whenNone(void Function() handler) {
    if (_none != null) {
      return handler();
    }
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
      if (some != null) {
        return some(_some);
      } else {
        return otherwise();
      }
    }
    if (_none != null) {
      if (none != null) {
        return none();
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _some.hashCode), _none.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Option) return false;
    return _some == other._some && _none == other._none;
  }

  @override
  String toString() {
    return 'Option (${when(some: (some) => 'some $some', none: () => 'none')}))';
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

  @override
  S get success {
    if (_success != null) return _success;
    throw Exception('Illegal access of sum field, success is not set');
  }

  @override
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
    if (_success != null) {
      return handler(_success);
    }
  }

  void whenError(void Function(Err<E>) handler) {
    if (_error != null) {
      return handler(_error);
    }
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
      if (success != null) {
        return success(_success);
      } else {
        return otherwise();
      }
    }
    if (_error != null) {
      if (error != null) {
        return error(_error);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _success.hashCode), _error.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    return _success == other._success && _error == other._error;
  }

  @override
  String toString() {
    return 'Result (${when(success: (success) => 'success $success', error: (error) => 'error $error')}))';
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

  @override
  E get error {
    return _error;
  }

  @override
  StackTrace get trace {
    return _trace;
  }

  Err<E> copy({E error, StackTrace trace}) {
    return Err(
      error: error ?? _error,
      trace: trace ?? _trace,
    );
  }

  @override
  int get hashCode => $jf($jc($jc(0, _error.hashCode), _trace.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Err) return false;
    return error == other.error && trace == other.trace;
  }

  @override
  String toString() {
    return 'Err (error: $error, trace: $trace)';
  }
}

class Pair<A, B> extends $Pair<A, B> {
  Pair({@required A a, @required B b})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null);

  final A _a;

  final B _b;

  @override
  A get a {
    return _a;
  }

  @override
  B get b {
    return _b;
  }

  Pair<A, B> copy({A a, B b}) {
    return Pair(
      a: a ?? _a,
      b: b ?? _b,
    );
  }

  @override
  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Pair) return false;
    return a == other.a && b == other.b;
  }

  @override
  String toString() {
    return 'Pair (a: $a, b: $b)';
  }
}

class Triplet<A, B, C> extends $Triplet<A, B, C> {
  Triplet({@required A a, @required B b, @required C c})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null),
        _c = c,
        assert(c != null);

  final A _a;

  final B _b;

  final C _c;

  @override
  A get a {
    return _a;
  }

  @override
  B get b {
    return _b;
  }

  @override
  C get c {
    return _c;
  }

  Triplet<A, B, C> copy({A a, B b, C c}) {
    return Triplet(
      a: a ?? _a,
      b: b ?? _b,
      c: c ?? _c,
    );
  }

  @override
  int get hashCode =>
      $jf($jc($jc($jc(0, _a.hashCode), _b.hashCode), _c.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Triplet) return false;
    return a == other.a && b == other.b && c == other.c;
  }

  @override
  String toString() {
    return 'Triplet (a: $a, b: $b, c: $c)';
  }
}

class Quartet<A, B, C, D> extends $Quartet<A, B, C, D> {
  Quartet({@required A a, @required B b, @required C c, @required D d})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null),
        _c = c,
        assert(c != null),
        _d = d,
        assert(d != null);

  final A _a;

  final B _b;

  final C _c;

  final D _d;

  @override
  A get a {
    return _a;
  }

  @override
  B get b {
    return _b;
  }

  @override
  C get c {
    return _c;
  }

  @override
  D get d {
    return _d;
  }

  Quartet<A, B, C, D> copy({A a, B b, C c, D d}) {
    return Quartet(
      a: a ?? _a,
      b: b ?? _b,
      c: c ?? _c,
      d: d ?? _d,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _a.hashCode), _b.hashCode), _c.hashCode), _d.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Quartet) return false;
    return a == other.a && b == other.b && c == other.c && d == other.d;
  }

  @override
  String toString() {
    return 'Quartet (a: $a, b: $b, c: $c, d: $d)';
  }
}

class Quintet<A, B, C, D, E> extends $Quintet<A, B, C, D, E> {
  Quintet(
      {@required A a,
      @required B b,
      @required C c,
      @required D d,
      @required E e})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null),
        _c = c,
        assert(c != null),
        _d = d,
        assert(d != null),
        _e = e,
        assert(e != null);

  final A _a;

  final B _b;

  final C _c;

  final D _d;

  final E _e;

  @override
  A get a {
    return _a;
  }

  @override
  B get b {
    return _b;
  }

  @override
  C get c {
    return _c;
  }

  @override
  D get d {
    return _d;
  }

  @override
  E get e {
    return _e;
  }

  Quintet<A, B, C, D, E> copy({A a, B b, C c, D d, E e}) {
    return Quintet(
      a: a ?? _a,
      b: b ?? _b,
      c: c ?? _c,
      d: d ?? _d,
      e: e ?? _e,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc($jc($jc(0, _a.hashCode), _b.hashCode), _c.hashCode), _d.hashCode),
      _e.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Quintet) return false;
    return a == other.a &&
        b == other.b &&
        c == other.c &&
        d == other.d &&
        e == other.e;
  }

  @override
  String toString() {
    return 'Quintet (a: $a, b: $b, c: $c, d: $d, e: $e)';
  }
}

class Sextet<A, B, C, D, E, F> extends $Sextet<A, B, C, D, E, F> {
  Sextet(
      {@required A a,
      @required B b,
      @required C c,
      @required D d,
      @required E e,
      @required F f})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null),
        _c = c,
        assert(c != null),
        _d = d,
        assert(d != null),
        _e = e,
        assert(e != null),
        _f = f,
        assert(f != null);

  final A _a;

  final B _b;

  final C _c;

  final D _d;

  final E _e;

  final F _f;

  @override
  A get a {
    return _a;
  }

  @override
  B get b {
    return _b;
  }

  @override
  C get c {
    return _c;
  }

  @override
  D get d {
    return _d;
  }

  @override
  E get e {
    return _e;
  }

  @override
  F get f {
    return _f;
  }

  Sextet<A, B, C, D, E, F> copy({A a, B b, C c, D d, E e, F f}) {
    return Sextet(
      a: a ?? _a,
      b: b ?? _b,
      c: c ?? _c,
      d: d ?? _d,
      e: e ?? _e,
      f: f ?? _f,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc(
          $jc($jc($jc($jc(0, _a.hashCode), _b.hashCode), _c.hashCode),
              _d.hashCode),
          _e.hashCode),
      _f.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sextet) return false;
    return a == other.a &&
        b == other.b &&
        c == other.c &&
        d == other.d &&
        e == other.e &&
        f == other.f;
  }

  @override
  String toString() {
    return 'Sextet (a: $a, b: $b, c: $c, d: $d, e: $e, f: $f)';
  }
}
