// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class MyEnum extends _MyEnumBase with MyEnumMetaJson {
  final int _value;

  static final values = Set<MyEnum>.from(
    <MyEnum>[
      MyEnum.a,
      MyEnum.b,
    ],
  );

  static MyEnum valueOf(int v) {
    if (MyEnum.a.value == v) return MyEnum.a;
    if (MyEnum.b.value == v) return MyEnum.b;
    return null;
  }

  MyEnum._(this._value) : super._(int);

  static final MyEnum a = new MyEnum._(_MyEnumBase.a ?? 0);
  static final MyEnum b = new MyEnum._(_MyEnumBase.b ?? 1);

  @override
  int get value => _value;

  @override
  MyEnum valueOfOther(int v) => MyEnum.valueOf(v);

  @override
  Set<MyEnum> get allValues => MyEnum.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MyEnum) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == MyEnum.a) return 'MyEnum.a: $_value';
    if (this == MyEnum.b) return 'MyEnum.b: $_value';
    return '';
  }
}

abstract class _MyEnumBase extends EnumClass<MyEnum, int> {
  _MyEnumBase._(Type type) : super(type);
  static int a;
  static int b;
}

class MySealedClass extends _MySealedClassBase with MySealedClassMetaJson {
  final String _string;
  final bool _stringSet;

  final int _integer;
  final bool _integerSet;

  MySealedClass.stringFactory(this._string)
      : _integerSet = false,
        _integer = null,
        _stringSet = true;

  MySealedClass.integerFactory(this._integer)
      : _stringSet = false,
        _string = null,
        _integerSet = true;

  String get string => _string;
  bool get stringSet => _stringSet;

  int get integer => _integer;
  bool get integerSet => _integerSet;

  W when<W>({
    @required W string(String string),
    @required W integer(int integer),
  }) {
    if (_stringSet) return string(this.string);
    return integer(this.integer);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MySealedClass) return false;
    return string == other.string && integer == other.integer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, string.hashCode), integer.hashCode));
  }
}

abstract class _MySealedClassBase extends SealedClass {
  String get string;
  int get integer;
  bool get stringSet;

  bool get integerSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<String>("string"),
        new SealedClassField<int>("integer")
      ];
  W when<W>({
    @required W string(String string),
    @required W integer(int integer),
  });
}

abstract class _MyDataClassBase extends DataClass {
  int get value => 0;
  NestedObject get nested;
  List<int> get list;
  Set<int> get st;
  Map<String, int> get map;
  List<NestedObject> get listNested;
  Set<NestedObject> get setNested;
  Map<String, NestedObject> get mapNested;
  MyEnum get enumValue;
  MySealedClass get sealed;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<NestedObject>("nested"),
        new DataClassField<List<int>>("list"),
        new DataClassField<Set<int>>("st"),
        new DataClassField<Map<String, int>>("map"),
        new DataClassField<List<NestedObject>>("listNested"),
        new DataClassField<Set<NestedObject>>("setNested"),
        new DataClassField<Map<String, NestedObject>>("mapNested"),
        new DataClassField<MyEnum>("enumValue"),
        new DataClassField<MySealedClass>("sealed")
      ];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<int>("value")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class MyDataClass extends _MyDataClassBase with MyDataClassMetaJson {
  final NestedObject _nested;
  final List<int> _list;
  final Set<int> _st;
  final Map<String, int> _map;
  final List<NestedObject> _listNested;
  final Set<NestedObject> _setNested;
  final Map<String, NestedObject> _mapNested;
  final MyEnum _enumValue;
  final MySealedClass _sealed;
  final int _value;

  MyDataClass({
    @required NestedObject nested,
    @required List<int> list,
    @required Set<int> st,
    @required Map<String, int> map,
    @required List<NestedObject> listNested,
    @required Set<NestedObject> setNested,
    @required Map<String, NestedObject> mapNested,
    @required MyEnum enumValue,
    @required MySealedClass sealed,
    int value,
  })  : _value = value,
        _nested = nested,
        _list = list,
        _st = st,
        _map = map,
        _listNested = listNested,
        _setNested = setNested,
        _mapNested = mapNested,
        _enumValue = enumValue,
        _sealed = sealed,
        super() {
    assert(this.value != null, "null value provided for field value");
    assert(this.nested != null, "null value provided for field nested");
    assert(this.list != null, "null value provided for field list");
    assert(this.st != null, "null value provided for field st");
    assert(this.map != null, "null value provided for field map");
    assert(this.listNested != null, "null value provided for field listNested");
    assert(this.setNested != null, "null value provided for field setNested");
    assert(this.mapNested != null, "null value provided for field mapNested");
    assert(this.enumValue != null, "null value provided for field enumValue");
    assert(this.sealed != null, "null value provided for field sealed");
  }

  MyDataClass clone({
    int value,
    NestedObject nested,
    List<int> list,
    Set<int> st,
    Map<String, int> map,
    List<NestedObject> listNested,
    Set<NestedObject> setNested,
    Map<String, NestedObject> mapNested,
    MyEnum enumValue,
    MySealedClass sealed,
  }) =>
      new MyDataClass(
        value: value ?? _value,
        nested: nested ?? _nested,
        list: list ?? _list,
        st: st ?? _st,
        map: map ?? _map,
        listNested: listNested ?? _listNested,
        setNested: setNested ?? _setNested,
        mapNested: mapNested ?? _mapNested,
        enumValue: enumValue ?? _enumValue,
        sealed: sealed ?? _sealed,
      );

  @override
  NestedObject get nested => _nested;
  @override
  List<int> get list => _list;
  @override
  Set<int> get st => _st;
  @override
  Map<String, int> get map => _map;
  @override
  List<NestedObject> get listNested => _listNested;
  @override
  Set<NestedObject> get setNested => _setNested;
  @override
  Map<String, NestedObject> get mapNested => _mapNested;
  @override
  MyEnum get enumValue => _enumValue;
  @override
  MySealedClass get sealed => _sealed;
  @override
  int get value => _value ?? super.value;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MyDataClass) return false;
    return value == other.value &&
        nested == other.nested &&
        list == other.list &&
        st == other.st &&
        map == other.map &&
        listNested == other.listNested &&
        setNested == other.setNested &&
        mapNested == other.mapNested &&
        enumValue == other.enumValue &&
        sealed == other.sealed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, value.hashCode),
                                        nested.hashCode),
                                    list.hashCode),
                                st.hashCode),
                            map.hashCode),
                        listNested.hashCode),
                    setNested.hashCode),
                mapNested.hashCode),
            enumValue.hashCode),
        sealed.hashCode));
  }
}

abstract class _NestedObjectBase extends DataClass {
  int get value => 0;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<int>("value")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class NestedObject extends _NestedObjectBase with NestedObjectMetaJson {
  final int _value;

  NestedObject({
    int value,
  })  : _value = value,
        super() {
    assert(this.value != null, "null value provided for field value");
  }

  NestedObject clone({
    int value,
  }) =>
      new NestedObject(
        value: value ?? _value,
      );

  @override
  int get value => _value ?? super.value;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedObject) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }
}

// **************************************************************************
// _MetaTypesjsonGenerator
// **************************************************************************

abstract class MyEnumMetaJson implements _MyEnumBase, ToJson {
  static MyEnum fromJson(dynamic j) => MyEnum.valueOf(j as int);
  dynamic toJson() => value;
}

abstract class MySealedClassMetaJson implements _MySealedClassBase, ToJson {
  static MySealedClass fromJson(dynamic j) {
    final m = j as Map<String, dynamic>;
    switch (m.keys.first) {
      case 'string':
        return MySealedClass.stringFactory(m.values.first as String);
      case 'integer':
        return MySealedClass.integerFactory(m.values.first as int);
      default:
        throw Exception('invalid key ${m.keys.first}');
    }
  }

  dynamic toJson() => when(
        string: (v) => <String, dynamic>{'string': v},
        integer: (v) => <String, dynamic>{'integer': v},
      );
}

abstract class MyDataClassMetaJson implements _MyDataClassBase, ToJson {
  static MyDataClass fromJson(dynamic j) {
    final m = j as Map<String, dynamic>;
    return MyDataClass(
      value: m['value'] as int,
      nested: NestedObjectMetaJson.fromJson(m['nested']),
      list: List<int>.unmodifiable((m['list'] as List<dynamic>).cast<int>()),
      st: Set<int>.from((m['st'] as List<dynamic>).cast<int>().toSet()),
      map: Map<String, int>.unmodifiable(
          (m['map'] as Map<dynamic, dynamic>).cast<String, int>()),
      listNested: List<NestedObject>.unmodifiable(
          (m['listNested'] as List<dynamic>)
              .map((dynamic v) =>
                  NestedObjectMetaJson.fromJson(v as Map<String, dynamic>))
              .toList()),
      setNested: Set<NestedObject>.from((m['setNested'] as List<dynamic>)
          .map((dynamic v) =>
              NestedObjectMetaJson.fromJson(v as Map<String, dynamic>))
          .toSet()),
      mapNested: Map<String, NestedObject>.unmodifiable(
          Map<String, NestedObject>.fromIterables(
              (m['mapNested'] as Map<dynamic, dynamic>).keys.cast<String>(),
              (m['mapNested'] as Map<dynamic, dynamic>).values.map((dynamic
                      k) =>
                  NestedObjectMetaJson.fromJson(k as Map<String, dynamic>)))),
      enumValue: MyEnumMetaJson.fromJson(m['enumValue']),
      sealed: MySealedClassMetaJson.fromJson(m['sealed']),
    );
  }

  dynamic toJson() => <String, dynamic>{
        'value': $toJson(value),
        'nested': $toJson(nested),
        'list': $toJson(list),
        'st': $toJson(st),
        'map': $toJson(map),
        'listNested': $toJson(listNested),
        'setNested': $toJson(setNested),
        'mapNested': $toJson(mapNested),
        'enumValue': $toJson(enumValue),
        'sealed': $toJson(sealed),
      };
}

abstract class NestedObjectMetaJson implements _NestedObjectBase, ToJson {
  static NestedObject fromJson(dynamic j) {
    final m = j as Map<String, dynamic>;
    return NestedObject(
      value: m['value'] as int,
    );
  }

  dynamic toJson() => <String, dynamic>{
        'value': $toJson(value),
      };
}
