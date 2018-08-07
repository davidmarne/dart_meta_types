// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

abstract class _ExampleDataClassBase extends DataClass {
  int get fieldWithNoDefault;
  int get fieldWithDefault => 10;
  Nullable<int> get nullable;
  @computed
  int get computedField => fieldWithDefault + 5;
  @override
  Iterable<ComputedField> get computedFields =>
      [new ComputedField<int>("computedField")];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<int>("fieldWithNoDefault"),
        new DataClassField<Nullable<int>>("nullable")
      ];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<int>("fieldWithDefault")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class ExampleDataClass extends _ExampleDataClassBase {
  final int _fieldWithNoDefault;
  final Nullable<int> _nullable;
  final int _fieldWithDefault;
  int _computedField;

  ExampleDataClass({
    @required int fieldWithNoDefault,
    @required Nullable<int> nullable,
    int fieldWithDefault,
  })  : _fieldWithNoDefault = fieldWithNoDefault,
        _fieldWithDefault = fieldWithDefault,
        _nullable = nullable,
        super() {
    assert(this.fieldWithNoDefault != null,
        "null value provided for field fieldWithNoDefault");
    assert(this.fieldWithDefault != null,
        "null value provided for field fieldWithDefault");
    assert(this.nullable != null, "null value provided for field nullable");
  }

  ExampleDataClass clone({
    int fieldWithNoDefault,
    int fieldWithDefault,
    Nullable<int> nullable,
  }) =>
      new ExampleDataClass(
        fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
        fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
        nullable: nullable ?? _nullable,
      );

  @override
  int get fieldWithNoDefault => _fieldWithNoDefault;
  @override
  Nullable<int> get nullable => _nullable;
  @override
  int get fieldWithDefault => _fieldWithDefault ?? super.fieldWithDefault;
  @override
  int get computedField => _computedField ??= super.computedField;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault &&
        nullable == other.nullable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, fieldWithNoDefault.hashCode), fieldWithDefault.hashCode),
        nullable.hashCode));
  }
}

abstract class _ImplementorDataClassBase extends DataClass
    implements InterfaceDataClass {
  int get foo;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("foo"), new DataClassField<String>("bar")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class ImplementorDataClass extends _ImplementorDataClassBase
    implements InterfaceDataClass {
  final int _foo;
  final String _bar;

  ImplementorDataClass({
    @required int foo,
    @required String bar,
  })  : _foo = foo,
        _bar = bar,
        super() {
    assert(this.foo != null, "null value provided for field foo");
    assert(this.bar != null, "null value provided for field bar");
  }

  ImplementorDataClass clone({
    int foo,
    String bar,
  }) =>
      new ImplementorDataClass(
        foo: foo ?? _foo,
        bar: bar ?? _bar,
      );

  @override
  ImplementorDataClass cloneInterfaceDataClass({
    String bar,
  }) =>
      clone(
        bar: bar ?? _bar,
      );

  @override
  int get foo => _foo;
  @override
  String get bar => _bar;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImplementorDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), bar.hashCode));
  }
}

abstract class InterfaceDataClass {
  String get bar;
  InterfaceDataClass cloneInterfaceDataClass({
    String bar,
  });
}

abstract class _BaseDataClassBase extends ParentDataClass {
  _BaseDataClassBase({
    @required int bar,
    String baz,
  }) : super(
          bar: bar,
          baz: baz,
        );
  int get foo;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("foo")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class BaseDataClass extends _BaseDataClassBase {
  final int _foo;

  BaseDataClass({
    @required int foo,
    @required int bar,
    String baz,
  })  : _foo = foo,
        super(
          bar: bar,
          baz: baz,
        ) {
    assert(this.foo != null, "null value provided for field foo");
  }

  BaseDataClass clone({
    int foo,
    int bar,
    String baz,
  }) =>
      new BaseDataClass(
        foo: foo ?? _foo,
        bar: bar ?? _bar,
        baz: baz ?? _baz,
      );

  @override
  BaseDataClass cloneParentDataClass({
    int bar,
    String baz,
  }) =>
      clone(
        bar: bar ?? _bar,
        baz: baz ?? _baz,
      );

  @override
  BaseDataClass cloneGrandparentDataClass({
    String baz,
  }) =>
      clone(
        baz: baz ?? _baz,
      );

  @override
  int get foo => _foo;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BaseDataClass) return false;
    return foo == other.foo;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foo.hashCode));
  }
}

abstract class _ParentDataClassBase extends GrandparentDataClass {
  _ParentDataClassBase({
    String baz,
  }) : super(
          baz: baz,
        );
  int get bar;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("bar")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

abstract class ParentDataClass extends _ParentDataClassBase {
  final int _bar;

  ParentDataClass({
    @required int bar,
    String baz,
  })  : _bar = bar,
        super(
          baz: baz,
        ) {
    assert(this.bar != null, "null value provided for field bar");
  }

  ParentDataClass cloneParentDataClass({
    int bar,
    String baz,
  });

  @override
  ParentDataClass cloneGrandparentDataClass({
    String baz,
  });

  @override
  int get bar => _bar;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ParentDataClass) return false;
    return bar == other.bar;
  }

  @override
  int get hashCode {
    return $jf($jc(0, bar.hashCode));
  }
}

abstract class _GrandparentDataClassBase extends DataClass {
  String get baz => 'baz';
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<String>("baz")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

abstract class GrandparentDataClass extends _GrandparentDataClassBase {
  final String _baz;

  GrandparentDataClass({
    String baz,
  })  : _baz = baz,
        super() {
    assert(this.baz != null, "null value provided for field baz");
  }

  GrandparentDataClass cloneGrandparentDataClass({
    String baz,
  });

  @override
  String get baz => _baz ?? super.baz;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GrandparentDataClass) return false;
    return baz == other.baz;
  }

  @override
  int get hashCode {
    return $jf($jc(0, baz.hashCode));
  }
}

class ExampleSealedClass extends _ExampleSealedClassBase {
  final int _integer;
  final bool _integerSet;

  final String _string;
  final bool _stringSet;

  ExampleSealedClass.integerFactory(this._integer)
      : _stringSet = false,
        _string = null,
        _integerSet = true;

  ExampleSealedClass.stringFactory(this._string)
      : _integerSet = false,
        _integer = null,
        _stringSet = true;

  int get integer => _integer;
  bool get integerSet => _integerSet;

  String get string => _string;
  bool get stringSet => _stringSet;

  W when<W>({
    @required W integer(int integer),
    @required W string(String string),
  }) {
    if (_integerSet) return integer(this.integer);
    return string(this.string);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleSealedClass) return false;
    return integer == other.integer && string == other.string;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, integer.hashCode), string.hashCode));
  }
}

abstract class _ExampleSealedClassBase extends SealedClass {
  int get integer;
  String get string;
  bool get integerSet;

  bool get stringSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<int>("integer"),
        new SealedClassField<String>("string")
      ];
  W when<W>({
    @required W integer(int integer),
    @required W string(String string),
  });
}

class ExampleEnumInteger extends _ExampleEnumIntegerBase {
  final int _value;

  static final values = Set<ExampleEnumInteger>.from(
    <ExampleEnumInteger>[
      ExampleEnumInteger.a,
      ExampleEnumInteger.b,
      ExampleEnumInteger.c,
      ExampleEnumInteger.d,
    ],
  );

  static ExampleEnumInteger valueOf(int v) {
    if (ExampleEnumInteger.a.value == v) return ExampleEnumInteger.a;
    if (ExampleEnumInteger.b.value == v) return ExampleEnumInteger.b;
    if (ExampleEnumInteger.c.value == v) return ExampleEnumInteger.c;
    if (ExampleEnumInteger.d.value == v) return ExampleEnumInteger.d;
    return null;
  }

  ExampleEnumInteger._(this._value) : super._(int);

  static final ExampleEnumInteger a =
      new ExampleEnumInteger._(_ExampleEnumIntegerBase.a ?? 0);
  static final ExampleEnumInteger b =
      new ExampleEnumInteger._(_ExampleEnumIntegerBase.b ?? 1);
  static final ExampleEnumInteger c =
      new ExampleEnumInteger._(_ExampleEnumIntegerBase.c ?? 2);
  static final ExampleEnumInteger d =
      new ExampleEnumInteger._(_ExampleEnumIntegerBase.d ?? 3);

  @override
  int get value => _value;

  @override
  ExampleEnumInteger valueOfOther(int v) => ExampleEnumInteger.valueOf(v);

  @override
  Set<ExampleEnumInteger> get allValues => ExampleEnumInteger.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleEnumInteger) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == ExampleEnumInteger.a) return 'ExampleEnumInteger.a: $_value';
    if (this == ExampleEnumInteger.b) return 'ExampleEnumInteger.b: $_value';
    if (this == ExampleEnumInteger.c) return 'ExampleEnumInteger.c: $_value';
    if (this == ExampleEnumInteger.d) return 'ExampleEnumInteger.d: $_value';
    return '';
  }
}

abstract class _ExampleEnumIntegerBase
    extends EnumClass<ExampleEnumInteger, int> {
  _ExampleEnumIntegerBase._(Type type) : super(type);
  static int a;
  static int b;
  static int c = 1000;
  static int d;
}

class ExampleEnumString extends _ExampleEnumStringBase {
  final String _value;

  static final values = Set<ExampleEnumString>.from(
    <ExampleEnumString>[
      ExampleEnumString.a,
      ExampleEnumString.b,
      ExampleEnumString.c,
    ],
  );

  static ExampleEnumString valueOf(String v) {
    if (ExampleEnumString.a.value == v) return ExampleEnumString.a;
    if (ExampleEnumString.b.value == v) return ExampleEnumString.b;
    if (ExampleEnumString.c.value == v) return ExampleEnumString.c;
    return null;
  }

  ExampleEnumString._(this._value) : super._(String);

  static final ExampleEnumString a =
      new ExampleEnumString._(_ExampleEnumStringBase.a ?? 'a');
  static final ExampleEnumString b =
      new ExampleEnumString._(_ExampleEnumStringBase.b ?? 'b');
  static final ExampleEnumString c =
      new ExampleEnumString._(_ExampleEnumStringBase.c ?? 'c');

  @override
  String get value => _value;

  @override
  ExampleEnumString valueOfOther(String v) => ExampleEnumString.valueOf(v);

  @override
  Set<ExampleEnumString> get allValues => ExampleEnumString.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleEnumString) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == ExampleEnumString.a) return 'ExampleEnumString.a: $_value';
    if (this == ExampleEnumString.b) return 'ExampleEnumString.b: $_value';
    if (this == ExampleEnumString.c) return 'ExampleEnumString.c: $_value';
    return '';
  }
}

abstract class _ExampleEnumStringBase
    extends EnumClass<ExampleEnumString, String> {
  _ExampleEnumStringBase._(Type type) : super(type);
  static String a;
  static String b;
  static String c = 'custom';
}

class ProtocolState extends _ProtocolStateBase {
  final Signal _value;

  static final values = Set<ProtocolState>.from(
    <ProtocolState>[
      ProtocolState.waiting,
      ProtocolState.talking,
    ],
  );

  static ProtocolState valueOf(Signal v) {
    if (ProtocolState.waiting.value == v) return ProtocolState.waiting;
    if (ProtocolState.talking.value == v) return ProtocolState.talking;
    return null;
  }

  ProtocolState._(this._value) : super._(Signal);

  static final ProtocolState waiting =
      new ProtocolState._(_ProtocolStateBase.waiting);
  static final ProtocolState talking =
      new ProtocolState._(_ProtocolStateBase.talking);

  @override
  Signal get value => _value;

  @override
  ProtocolState valueOfOther(Signal v) => ProtocolState.valueOf(v);

  @override
  Set<ProtocolState> get allValues => ProtocolState.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ProtocolState) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == ProtocolState.waiting) return 'ProtocolState.waiting: $_value';
    if (this == ProtocolState.talking) return 'ProtocolState.talking: $_value';
    return '';
  }
}

abstract class _ProtocolStateBase extends EnumClass<ProtocolState, Signal> {
  _ProtocolStateBase._(Type type) : super(type);
  static const Waiting waiting = Waiting();
  static const Talking talking = Talking();
}

class BinaryTree<T> extends _BinaryTreeBase<T> {
  final T _leaf;
  final bool _leafSet;

  final Branch<T> _branch;
  final bool _branchSet;

  BinaryTree.leafFactory(this._leaf)
      : _branchSet = false,
        _branch = null,
        _leafSet = true;

  BinaryTree.branchFactory(this._branch)
      : _leafSet = false,
        _leaf = null,
        _branchSet = true;

  T get leaf => _leaf;
  bool get leafSet => _leafSet;

  Branch<T> get branch => _branch;
  bool get branchSet => _branchSet;

  W when<W>({
    @required W leaf(T leaf),
    @required W branch(Branch<T> branch),
  }) {
    if (_leafSet) return leaf(this.leaf);
    return branch(this.branch);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BinaryTree) return false;
    return leaf == other.leaf && branch == other.branch;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, leaf.hashCode), branch.hashCode));
  }
}

abstract class _BinaryTreeBase<T> extends SealedClass {
  T get leaf;
  Branch<T> get branch;
  bool get leafSet;

  bool get branchSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<T>("leaf"),
        new SealedClassField<Branch<T>>("branch")
      ];
  W when<W>({
    @required W leaf(T leaf),
    @required W branch(Branch<T> branch),
  });
}

abstract class _BranchBase<T> extends DataClass {
  T get val;
  BinaryTree<T> get left;
  BinaryTree<T> get right;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<T>("val"),
        new DataClassField<BinaryTree<T>>("left"),
        new DataClassField<BinaryTree<T>>("right")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class Branch<T> extends _BranchBase<T> {
  final T _val;
  final BinaryTree<T> _left;
  final BinaryTree<T> _right;

  Branch({
    @required T val,
    @required BinaryTree<T> left,
    @required BinaryTree<T> right,
  })  : _val = val,
        _left = left,
        _right = right,
        super() {
    assert(this.val != null, "null value provided for field val");
    assert(this.left != null, "null value provided for field left");
    assert(this.right != null, "null value provided for field right");
  }

  Branch clone({
    T val,
    BinaryTree<T> left,
    BinaryTree<T> right,
  }) =>
      new Branch<T>(
        val: val ?? _val,
        left: left ?? _left,
        right: right ?? _right,
      );

  @override
  T get val => _val;
  @override
  BinaryTree<T> get left => _left;
  @override
  BinaryTree<T> get right => _right;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Branch) return false;
    return val == other.val && left == other.left && right == other.right;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, val.hashCode), left.hashCode), right.hashCode));
  }
}
