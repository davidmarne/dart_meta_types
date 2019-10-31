// GENERATED CODE - DO NOT MODIFY BY HAND

part of m2;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class IMPORTDataClass extends $IMPORTDataClass {
  IMPORTDataClass({int foo, int ref})
      : _foo = foo,
        assert(foo != null),
        _ref = ref,
        assert(ref != null);

  factory IMPORTDataClass.load(Iterable<DataLoader> loaders) => IMPORTDataClass(
        foo: loaders.firstWhere((l) => l.name == 'foo').value as int,
        ref: loaders.firstWhere((l) => l.name == 'ref').value as int,
      );

  final int _foo;

  final int _ref;

  Data<DataValue> _meta$;

  IMPORTDataClass clone({int foo, int ref}) {
    return IMPORTDataClass(
      foo: foo ?? _foo,
      ref: ref ?? _ref,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: true,
        isInterface: false,
        isConst: null,
        name: 'IMPORTDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'foo',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: false,
            value: _foo,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'ref',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: false,
            value: _ref,
            isAbstract: false,
            isDefaulted: true,
          )
        ],
        interfaces: [],
        generics: [],
      );
  int get foo {
    return _foo;
  }

  int get ref {
    return _ref ?? super.ref;
  }

  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), ref.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! IMPORTDataClass) return false;
    return foo == other.foo && ref == other.ref;
  }

  String toString() {
    return "IMPORTDataClass (foo: $foo)";
  }
}

class Option<T> extends $Option<T> {
  Option.some(T some)
      : assert(some != null),
        _some = some,
        _none = null;

  Option.none(void none)
      : _some = null,
        assert(none != null),
        _none = none;

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

class Either<A, B> extends $Either<A, B> {
  Either.a(A a)
      : assert(a != null),
        _a = a,
        _b = null;

  Either.b(B b)
      : _a = null,
        assert(b != null),
        _b = b;

  Either({A a, B b})
      : _a = a,
        _b = b {
    var found = false;
    if (a != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (b != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final A _a;

  final B _b;

  A get a {
    if (_a != null) return _a;
    throw Exception('TODO name htis');
  }

  B get b {
    if (_b != null) return _b;
    throw Exception('TODO name htis');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(A) handler) {
    if (_a != null) handler(_a);
  }

  void whenB(void Function(B) handler) {
    if (_b != null) handler(_b);
  }

  WHEN when<WHEN>({WHEN Function(A) a, WHEN Function(B) b}) {
    if (_a != null) {
      return a(_a);
    }
    if (_b != null) {
      return b(_b);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise, WHENO Function(A) a, WHENO Function(B) b}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Either) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    final value = when(
      a: (a) => 'a $a',
      b: (b) => 'b $b',
    );
    return 'Either( $value )';
  }
}

abstract class IEither<A, B> {
  void whenA(void Function(A) handler);
  void whenB(void Function(B) handler);
  WHEN when<WHEN>({WHEN Function(A) a, WHEN Function(B) b});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise, WHENO Function(A) a, WHENO Function(B) b});
}

class Result<S, F> extends $Result<S, F> {
  Result.success(S success)
      : assert(success != null),
        _success = success,
        _failure = null;

  Result.failure(F failure)
      : _success = null,
        assert(failure != null),
        _failure = failure;

  Result({S success, F failure})
      : _success = success,
        _failure = failure {
    var found = false;
    if (success != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (failure != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final S _success;

  final F _failure;

  S get success {
    if (_success != null) return _success;
    throw Exception('TODO name htis');
  }

  F get failure {
    if (_failure != null) return _failure;
    throw Exception('TODO name htis');
  }

  bool get isSuccess {
    return _success != null;
  }

  bool get isFailure {
    return _failure != null;
  }

  void whenSuccess(void Function(S) handler) {
    if (_success != null) handler(_success);
  }

  void whenFailure(void Function(F) handler) {
    if (_failure != null) handler(_failure);
  }

  WHEN when<WHEN>({WHEN Function(S) success, WHEN Function(F) failure}) {
    if (_success != null) {
      return success(_success);
    }
    if (_failure != null) {
      return failure(_failure);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(S) success,
      WHENO Function(F) failure}) {
    if (_success != null) {
      if (success != null)
        return success(_success);
      else
        return otherwise();
    }
    if (_failure != null) {
      if (failure != null)
        return failure(_failure);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _success.hashCode), _failure.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    return _success == other._success && _failure == other._failure;
  }

  String toString() {
    final value = when(
      success: (success) => 'success $success',
      failure: (failure) => 'failure $failure',
    );
    return 'Result( $value )';
  }
}

abstract class IResult<S, F> {
  void whenSuccess(void Function(S) handler);
  void whenFailure(void Function(F) handler);
  WHEN when<WHEN>({WHEN Function(S) success, WHEN Function(F) failure});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(S) success,
      WHENO Function(F) failure});
}

class Json extends $Json {
  Json.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _string = null,
        _boolean = null,
        _float = null,
        _list = null,
        _map = null;

  Json.string(String string)
      : _integer = null,
        assert(string != null),
        _string = string,
        _boolean = null,
        _float = null,
        _list = null,
        _map = null;

  Json.boolean(bool boolean)
      : _integer = null,
        _string = null,
        assert(boolean != null),
        _boolean = boolean,
        _float = null,
        _list = null,
        _map = null;

  Json.float(double float)
      : _integer = null,
        _string = null,
        _boolean = null,
        assert(float != null),
        _float = float,
        _list = null,
        _map = null;

  Json.list(List<Json> list)
      : _integer = null,
        _string = null,
        _boolean = null,
        _float = null,
        _list = null,
        _map = null;

  Json.map(Map<String, Json> map)
      : _integer = null,
        _string = null,
        _boolean = null,
        _float = null,
        _list = null,
        _map = null;

  Json(
      {int integer,
      String string,
      bool boolean,
      double float,
      List<Json> list,
      Map<String, Json> map})
      : _integer = integer,
        _string = string,
        _boolean = boolean,
        _float = float,
        _list = list,
        _map = map {
    var found = false;
    if (integer != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (string != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (boolean != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (float != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (list != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (map != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final int _integer;

  final String _string;

  final bool _boolean;

  final double _float;

  final List<Json> _list;

  final Map<String, Json> _map;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('TODO name htis');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('TODO name htis');
  }

  bool get boolean {
    if (_boolean != null) return _boolean;
    throw Exception('TODO name htis');
  }

  double get float {
    if (_float != null) return _float;
    throw Exception('TODO name htis');
  }

  List<Json> get list {
    if (_list != null) return _list;
    throw Exception('TODO name htis');
  }

  Map<String, Json> get map {
    if (_map != null) return _map;
    throw Exception('TODO name htis');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  bool get isBoolean {
    return _boolean != null;
  }

  bool get isFloat {
    return _float != null;
  }

  bool get isList {
    return _list != null;
  }

  bool get isMap {
    return _map != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) handler(_integer);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) handler(_string);
  }

  void whenBoolean(void Function(bool) handler) {
    if (_boolean != null) handler(_boolean);
  }

  void whenFloat(void Function(double) handler) {
    if (_float != null) handler(_float);
  }

  void whenList(void Function(List<Json>) handler) {
    if (_list != null) handler(_list);
  }

  void whenMap(void Function(Map<String, Json>) handler) {
    if (_map != null) handler(_map);
  }

  WHEN when<WHEN>(
      {WHEN Function(int) integer,
      WHEN Function(String) string,
      WHEN Function(bool) boolean,
      WHEN Function(double) float,
      WHEN Function(List<Json>) list,
      WHEN Function(Map<String, Json>) map}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_string != null) {
      return string(_string);
    }
    if (_boolean != null) {
      return boolean(_boolean);
    }
    if (_float != null) {
      return float(_float);
    }
    if (_list != null) {
      return list(_list);
    }
    if (_map != null) {
      return map(_map);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string,
      WHENO Function(bool) boolean,
      WHENO Function(double) float,
      WHENO Function(List<Json>) list,
      WHENO Function(Map<String, Json>) map}) {
    if (_integer != null) {
      if (integer != null)
        return integer(_integer);
      else
        return otherwise();
    }
    if (_string != null) {
      if (string != null)
        return string(_string);
      else
        return otherwise();
    }
    if (_boolean != null) {
      if (boolean != null)
        return boolean(_boolean);
      else
        return otherwise();
    }
    if (_float != null) {
      if (float != null)
        return float(_float);
      else
        return otherwise();
    }
    if (_list != null) {
      if (list != null)
        return list(_list);
      else
        return otherwise();
    }
    if (_map != null) {
      if (map != null)
        return map(_map);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, _integer.hashCode), _string.hashCode),
                    _boolean.hashCode),
                _float.hashCode),
            _list.hashCode),
        _map.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Json) return false;
    return _integer == other._integer &&
        _string == other._string &&
        _boolean == other._boolean &&
        _float == other._float &&
        _list == other._list &&
        _map == other._map;
  }

  String toString() {
    final value = when(
      integer: (integer) => 'integer $integer',
      string: (string) => 'string $string',
      boolean: (boolean) => 'boolean $boolean',
      float: (float) => 'float $float',
      list: (list) => 'list $list',
      map: (map) => 'map $map',
    );
    return 'Json( $value )';
  }
}

abstract class IJson {
  void whenInteger(void Function(int) handler);
  void whenString(void Function(String) handler);
  void whenBoolean(void Function(bool) handler);
  void whenFloat(void Function(double) handler);
  void whenList(void Function(List<Json>) handler);
  void whenMap(void Function(Map<String, Json>) handler);
  WHEN when<WHEN>(
      {WHEN Function(int) integer,
      WHEN Function(String) string,
      WHEN Function(bool) boolean,
      WHEN Function(double) float,
      WHEN Function(List<Json>) list,
      WHEN Function(Map<String, Json>) map});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string,
      WHENO Function(bool) boolean,
      WHENO Function(double) float,
      WHENO Function(List<Json>) list,
      WHENO Function(Map<String, Json>) map});
}
