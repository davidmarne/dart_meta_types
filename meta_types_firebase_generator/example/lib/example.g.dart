// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class User extends $User {
  const User({@required String name})
      : _name = name,
        assert(name != null);

  final String _name;

  String get name {
    return _name;
  }

  User copy({String name}) {
    return User(
      name: name ?? _name,
    );
  }

  int get hashCode => $jf($jc(0, _name.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    return name == other.name;
  }

  String toString() {
    return "User (name: $name)";
  }
}

class UserSerializer extends StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User];

  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: FullType(String))
    ];
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object name;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'name':
          name =
              serializers.deserialize(value$, specifiedType: FullType(String));
          break;
      }
    }

    return User(
      name: name as String,
    );
  }
}

class Room extends $Room {
  const Room({@required String name})
      : _name = name,
        assert(name != null);

  final String _name;

  String get name {
    return _name;
  }

  Room copy({String name}) {
    return Room(
      name: name ?? _name,
    );
  }

  int get hashCode => $jf($jc(0, _name.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Room) return false;
    return name == other.name;
  }

  String toString() {
    return "Room (name: $name)";
  }
}

class RoomSerializer extends StructuredSerializer<Room> {
  @override
  final Iterable<Type> types = const [Room];

  @override
  final String wireName = 'Room';

  @override
  Iterable<Object> serialize(Serializers serializers, Room object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: FullType(String))
    ];
  }

  @override
  Room deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object name;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'name':
          name =
              serializers.deserialize(value$, specifiedType: FullType(String));
          break;
      }
    }

    return Room(
      name: name as String,
    );
  }
}

class Message extends $Message {
  const Message(
      {@required User user, @required String message, @required DateTime stamp})
      : _user = user,
        assert(user != null),
        _message = message,
        assert(message != null),
        _stamp = stamp,
        assert(stamp != null);

  final User _user;

  final String _message;

  final DateTime _stamp;

  User get user {
    return _user;
  }

  String get message {
    return _message;
  }

  DateTime get stamp {
    return _stamp;
  }

  Message copy({User user, String message, DateTime stamp}) {
    return Message(
      user: user ?? _user,
      message: message ?? _message,
      stamp: stamp ?? _stamp,
    );
  }

  int get hashCode =>
      $jf($jc($jc($jc(0, _user.hashCode), _message.hashCode), _stamp.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Message) return false;
    return user == other.user &&
        message == other.message &&
        stamp == other.stamp;
  }

  String toString() {
    return "Message (user: $user, message: $message, stamp: $stamp)";
  }
}

class MessageSerializer extends StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message];

  @override
  final String wireName = 'Message';

  @override
  Iterable<Object> serialize(Serializers serializers, Message object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: FullType(User)),
      'message',
      serializers.serialize(object.message, specifiedType: FullType(String)),
      'stamp',
      serializers.serialize(object.stamp, specifiedType: FullType(DateTime))
    ];
  }

  @override
  Message deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object user;
    Object message;
    Object stamp;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'user':
          user = serializers.deserialize(value$, specifiedType: FullType(User));
          break;
        case 'message':
          message =
              serializers.deserialize(value$, specifiedType: FullType(String));
          break;
        case 'stamp':
          stamp = serializers.deserialize(value$,
              specifiedType: FullType(DateTime));
          break;
      }
    }

    return Message(
      user: user as User,
      message: message as String,
      stamp: stamp as DateTime,
    );
  }
}

class TestStuff<T> extends $TestStuff<T> {
  const TestStuff(
      {@required int integer,
      @required double dubley,
      @required DateTime date,
      @required BuiltMap<String, int> map,
      @required BuiltList<int> list,
      @required NestedData data,
      @required NestedSum sum,
      @required T generic})
      : _integer = integer,
        assert(integer != null),
        _dubley = dubley,
        assert(dubley != null),
        _date = date,
        assert(date != null),
        _map = map,
        assert(map != null),
        _list = list,
        assert(list != null),
        _data = data,
        assert(data != null),
        _sum = sum,
        assert(sum != null),
        _generic = generic,
        assert(generic != null);

  final int _integer;

  final double _dubley;

  final DateTime _date;

  final BuiltMap<String, int> _map;

  final BuiltList<int> _list;

  final NestedData _data;

  final NestedSum _sum;

  final T _generic;

  int get integer {
    return _integer;
  }

  double get dubley {
    return _dubley;
  }

  DateTime get date {
    return _date;
  }

  BuiltMap<String, int> get map {
    return _map;
  }

  BuiltList<int> get list {
    return _list;
  }

  NestedData get data {
    return _data;
  }

  NestedSum get sum {
    return _sum;
  }

  T get generic {
    return _generic;
  }

  TestStuff<T> copy(
      {int integer,
      double dubley,
      DateTime date,
      BuiltMap<String, int> map,
      BuiltList<int> list,
      NestedData data,
      NestedSum sum,
      T generic}) {
    return TestStuff(
      integer: integer ?? _integer,
      dubley: dubley ?? _dubley,
      date: date ?? _date,
      map: map ?? _map,
      list: list ?? _list,
      data: data ?? _data,
      sum: sum ?? _sum,
      generic: generic ?? _generic,
    );
  }

  int get hashCode => $jf($jc(
      $jc(
          $jc(
              $jc(
                  $jc(
                      $jc($jc($jc(0, _integer.hashCode), _dubley.hashCode),
                          _date.hashCode),
                      _map.hashCode),
                  _list.hashCode),
              _data.hashCode),
          _sum.hashCode),
      _generic.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestStuff) return false;
    return integer == other.integer &&
        dubley == other.dubley &&
        date == other.date &&
        map == other.map &&
        list == other.list &&
        data == other.data &&
        sum == other.sum &&
        generic == other.generic;
  }

  String toString() {
    return "TestStuff (integer: $integer, dubley: $dubley, date: $date, map: $map, list: $list, data: $data, sum: $sum, generic: $generic)";
  }
}

class TestStuffSerializer extends StructuredSerializer<TestStuff> {
  @override
  final Iterable<Type> types = const [TestStuff];

  @override
  final String wireName = 'TestStuff';

  @override
  Iterable<Object> serialize(Serializers serializers, TestStuff object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    return <Object>[
      'integer',
      serializers.serialize(object.integer, specifiedType: FullType(int)),
      'dubley',
      serializers.serialize(object.dubley, specifiedType: FullType(double)),
      'date',
      serializers.serialize(object.date, specifiedType: FullType(DateTime)),
      'map',
      serializers.serialize(object.map,
          specifiedType: FullType(BuiltMap, [FullType(String), FullType(int)])),
      'list',
      serializers.serialize(object.list,
          specifiedType: FullType(BuiltList, [FullType(int)])),
      'data',
      serializers.serialize(object.data, specifiedType: FullType(NestedData)),
      'sum',
      serializers.serialize(object.sum, specifiedType: FullType(NestedSum)),
      'generic',
      serializers.serialize(object.generic, specifiedType: paramT)
    ];
  }

  @override
  TestStuff deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    Object integer;
    Object dubley;
    Object date;
    Object map;
    Object list;
    Object data;
    Object sum;
    Object generic;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'integer':
          integer =
              serializers.deserialize(value$, specifiedType: FullType(int));
          break;
        case 'dubley':
          dubley =
              serializers.deserialize(value$, specifiedType: FullType(double));
          break;
        case 'date':
          date = serializers.deserialize(value$,
              specifiedType: FullType(DateTime));
          break;
        case 'map':
          map = serializers.deserialize(value$,
              specifiedType:
                  FullType(BuiltMap, [FullType(String), FullType(int)]));
          break;
        case 'list':
          list = serializers.deserialize(value$,
              specifiedType: FullType(BuiltList, [FullType(int)]));
          break;
        case 'data':
          data = serializers.deserialize(value$,
              specifiedType: FullType(NestedData));
          break;
        case 'sum':
          sum = serializers.deserialize(value$,
              specifiedType: FullType(NestedSum));
          break;
        case 'generic':
          generic = serializers.deserialize(value$, specifiedType: paramT);
          break;
      }
    }

    return TestStuff<Object>(
      integer: integer as int,
      dubley: dubley as double,
      date: date as DateTime,
      map: map as BuiltMap<String, int>,
      list: list as BuiltList<int>,
      data: data as NestedData,
      sum: sum as NestedSum,
      generic: generic as Object,
    );
  }
}

class NestedData extends $NestedData {
  const NestedData({@required int a, @required int b})
      : _a = a,
        assert(a != null),
        _b = b,
        assert(b != null);

  final int _a;

  final int _b;

  int get a {
    return _a;
  }

  int get b {
    return _b;
  }

  NestedData copy({int a, int b}) {
    return NestedData(
      a: a ?? _a,
      b: b ?? _b,
    );
  }

  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedData) return false;
    return a == other.a && b == other.b;
  }

  String toString() {
    return "NestedData (a: $a, b: $b)";
  }
}

class NestedDataSerializer extends StructuredSerializer<NestedData> {
  @override
  final Iterable<Type> types = const [NestedData];

  @override
  final String wireName = 'NestedData';

  @override
  Iterable<Object> serialize(Serializers serializers, NestedData object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'a',
      serializers.serialize(object.a, specifiedType: FullType(int)),
      'b',
      serializers.serialize(object.b, specifiedType: FullType(int))
    ];
  }

  @override
  NestedData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object a;
    Object b;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'a':
          a = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
        case 'b':
          b = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return NestedData(
      a: a as int,
      b: b as int,
    );
  }
}

class NestedSum extends $NestedSum {
  const NestedSum.a(int a)
      : assert(a != null),
        _a = a,
        _b = null;

  const NestedSum.b(String b)
      : _a = null,
        assert(b != null),
        _b = b;

  final int _a;

  final String _b;

  int get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  String get b {
    if (_b != null) return _b;
    throw Exception('Illegal access of sum field, b is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(int) handler) {
    if (_a != null) return handler(_a);
  }

  void whenB(void Function(String) handler) {
    if (_b != null) return handler(_b);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(String) b}) {
    if (_a != null) {
      return a(_a);
    }
    if (_b != null) {
      return b(_b);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) a,
      WHEN Function(String) b}) {
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
    if (other is! NestedSum) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    return "NestedSum (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))";
  }
}

class NestedSumSerializer extends StructuredSerializer<NestedSum> {
  @override
  final Iterable<Type> types = const [NestedSum];

  @override
  final String wireName = 'NestedSum';

  @override
  Iterable<Object> serialize(Serializers serializers, NestedSum object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: FullType(int))
            ],
        b: (object) => [
              'kind',
              serializers.serialize('b', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: FullType(String))
            ]);
  }

  @override
  NestedSum deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final iterator = serialized.iterator;
    iterator.moveNext();
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    iterator.moveNext();
    final dynamic value$ = iterator.current;
    switch (key) {
      case 'a':
        return NestedSum.a(serializers.deserialize(value$,
            specifiedType: FullType(int)) as int);
      case 'b':
        return NestedSum.b(serializers.deserialize(value$,
            specifiedType: FullType(String)) as String);
    }
    throw FallThroughError();
  }
}
