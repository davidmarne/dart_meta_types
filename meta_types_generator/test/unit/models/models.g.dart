// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

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
  T get value;
  BinaryTree<T> get left;
  BinaryTree<T> get right;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<T>("value"),
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
  final T _value;
  final BinaryTree<T> _left;
  final BinaryTree<T> _right;

  Branch({
    @required T value,
    @required BinaryTree<T> left,
    @required BinaryTree<T> right,
  })  : _value = value,
        _left = left,
        _right = right,
        super() {
    assert(this.value != null, "null value provided for field value");
    assert(this.left != null, "null value provided for field left");
    assert(this.right != null, "null value provided for field right");
  }

  Branch clone({
    T value,
    BinaryTree<T> left,
    BinaryTree<T> right,
  }) =>
      new Branch<T>(
        value: value ?? _value,
        left: left ?? _left,
        right: right ?? _right,
      );

  @override
  T get value => _value;
  @override
  BinaryTree<T> get left => _left;
  @override
  BinaryTree<T> get right => _right;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Branch) return false;
    return value == other.value && left == other.left && right == other.right;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, value.hashCode), left.hashCode), right.hashCode));
  }
}

abstract class _GenericDataClassBase<T> extends DataClass {
  int get foo;
  T get bar;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("foo"), new DataClassField<T>("bar")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class GenericDataClass<T> extends _GenericDataClassBase<T> {
  final int _foo;
  final T _bar;

  GenericDataClass({
    @required int foo,
    @required T bar,
  })  : _foo = foo,
        _bar = bar,
        super() {
    assert(this.foo != null, "null value provided for field foo");
    assert(this.bar != null, "null value provided for field bar");
  }

  GenericDataClass clone({
    int foo,
    T bar,
  }) =>
      new GenericDataClass<T>(
        foo: foo ?? _foo,
        bar: bar ?? _bar,
      );

  @override
  int get foo => _foo;
  @override
  T get bar => _bar;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), bar.hashCode));
  }
}

abstract class _GenericsDataClassBase<T, P> extends DataClass {
  int get foo;
  T get bar;
  P get baz;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<int>("foo"),
        new DataClassField<T>("bar"),
        new DataClassField<P>("baz")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class GenericsDataClass<T, P> extends _GenericsDataClassBase<T, P> {
  final int _foo;
  final T _bar;
  final P _baz;

  GenericsDataClass({
    @required int foo,
    @required T bar,
    @required P baz,
  })  : _foo = foo,
        _bar = bar,
        _baz = baz,
        super() {
    assert(this.foo != null, "null value provided for field foo");
    assert(this.bar != null, "null value provided for field bar");
    assert(this.baz != null, "null value provided for field baz");
  }

  GenericsDataClass clone({
    int foo,
    T bar,
    P baz,
  }) =>
      new GenericsDataClass<T, P>(
        foo: foo ?? _foo,
        bar: bar ?? _bar,
        baz: baz ?? _baz,
      );

  @override
  int get foo => _foo;
  @override
  T get bar => _bar;
  @override
  P get baz => _baz;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericsDataClass) return false;
    return foo == other.foo && bar == other.bar && baz == other.baz;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, foo.hashCode), bar.hashCode), baz.hashCode));
  }
}

abstract class _BaseDataClassBase extends SuperDataClass
    implements OtherDataClass {
  _BaseDataClassBase({
    @required int bar,
    @required String baz,
  }) : super(
          bar: bar,
          baz: baz,
        );
  int get foo;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("foo"), new DataClassField<int>("other")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class BaseDataClass extends _BaseDataClassBase implements OtherDataClass {
  final int _foo;
  final int _other;

  BaseDataClass({
    @required int foo,
    @required int other,
    @required int bar,
    @required String baz,
  })  : _foo = foo,
        _other = other,
        super(
          bar: bar,
          baz: baz,
        ) {
    assert(this.foo != null, "null value provided for field foo");
    assert(this.other != null, "null value provided for field other");
  }

  BaseDataClass clone({
    int foo,
    int other,
    int bar,
    String baz,
  }) =>
      new BaseDataClass(
        foo: foo ?? _foo,
        other: other ?? _other,
        bar: bar ?? _bar,
        baz: baz ?? _baz,
      );

  @override
  BaseDataClass cloneOtherDataClass({
    int other,
  }) =>
      clone(
        other: other ?? _other,
      );

  @override
  BaseDataClass cloneSuperDataClass({
    int bar,
    String baz,
  }) =>
      clone(
        bar: bar ?? _bar,
        baz: baz ?? _baz,
      );

  @override
  BaseDataClass cloneSuper2DataClass({
    String baz,
  }) =>
      clone(
        baz: baz ?? _baz,
      );

  @override
  int get foo => _foo;
  @override
  int get other => _other;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BaseDataClass) return false;
    return foo == other.foo && other == other.other;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), other.hashCode));
  }
}

abstract class _SuperDataClassBase extends Super2DataClass {
  _SuperDataClassBase({
    @required String baz,
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

abstract class SuperDataClass extends _SuperDataClassBase {
  final int _bar;

  SuperDataClass({
    @required int bar,
    @required String baz,
  })  : _bar = bar,
        super(
          baz: baz,
        ) {
    assert(this.bar != null, "null value provided for field bar");
  }

  SuperDataClass cloneSuperDataClass({
    int bar,
    String baz,
  });

  @override
  SuperDataClass cloneSuper2DataClass({
    String baz,
  });

  @override
  int get bar => _bar;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SuperDataClass) return false;
    return bar == other.bar;
  }

  @override
  int get hashCode {
    return $jf($jc(0, bar.hashCode));
  }
}

abstract class _Super2DataClassBase extends DataClass {
  String get baz;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<String>("baz")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

abstract class Super2DataClass extends _Super2DataClassBase {
  final String _baz;

  Super2DataClass({
    @required String baz,
  })  : _baz = baz,
        super() {
    assert(this.baz != null, "null value provided for field baz");
  }

  Super2DataClass cloneSuper2DataClass({
    String baz,
  });

  @override
  String get baz => _baz;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Super2DataClass) return false;
    return baz == other.baz;
  }

  @override
  int get hashCode {
    return $jf($jc(0, baz.hashCode));
  }
}

abstract class OtherDataClass {
  int get other;
  OtherDataClass cloneOtherDataClass({
    int other,
  });
}

abstract class _ImplementorDataClassBase extends DataClass
    implements InterfaceOne, InterfaceThree {
  int get implementor;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<int>("implementor"),
        new DataClassField<int>("one"),
        new DataClassField<String>("two"),
        new DataClassField<int>("three")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class ImplementorDataClass extends _ImplementorDataClassBase
    implements InterfaceOne, InterfaceThree {
  final int _implementor;
  final int _one;
  final String _two;
  final int _three;

  ImplementorDataClass({
    @required int implementor,
    @required int one,
    @required String two,
    @required int three,
  })  : _implementor = implementor,
        _one = one,
        _two = two,
        _three = three,
        super() {
    assert(
        this.implementor != null, "null value provided for field implementor");
    assert(this.one != null, "null value provided for field one");
    assert(this.two != null, "null value provided for field two");
    assert(this.three != null, "null value provided for field three");
  }

  ImplementorDataClass clone({
    int implementor,
    int one,
    String two,
    int three,
  }) =>
      new ImplementorDataClass(
        implementor: implementor ?? _implementor,
        one: one ?? _one,
        two: two ?? _two,
        three: three ?? _three,
      );

  @override
  ImplementorDataClass cloneInterfaceOne({
    int one,
    String two,
  }) =>
      clone(
        one: one ?? _one,
        two: two ?? _two,
      );

  @override
  ImplementorDataClass cloneInterfaceThree({
    int three,
  }) =>
      clone(
        three: three ?? _three,
      );

  @override
  int get implementor => _implementor;
  @override
  int get one => _one;
  @override
  String get two => _two;
  @override
  int get three => _three;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImplementorDataClass) return false;
    return implementor == other.implementor &&
        one == other.one &&
        two == other.two &&
        three == other.three;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, implementor.hashCode), one.hashCode), two.hashCode),
        three.hashCode));
  }
}

abstract class InterfaceOne implements $InterfaceTwo {
  int get one;
  InterfaceOne cloneInterfaceOne({
    int one,
    String two,
  });
}

abstract class InterfaceTwo {
  String get two;
  InterfaceTwo cloneInterfaceTwo({
    String two,
  });
}

abstract class InterfaceThree {
  int get three;
  InterfaceThree cloneInterfaceThree({
    int three,
  });
}

abstract class _FinalDataClassBase extends DataClass
    implements NonFinalInterfaceDataClass {
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

class FinalDataClass extends _FinalDataClassBase
    implements NonFinalInterfaceDataClass {
  final int _foo;
  final String _bar;

  FinalDataClass({
    @required int foo,
    @required String bar,
  })  : _foo = foo,
        _bar = bar,
        super() {
    assert(this.foo != null, "null value provided for field foo");
    assert(this.bar != null, "null value provided for field bar");
  }

  FinalDataClass clone({
    int foo,
    String bar,
  }) =>
      new FinalDataClass(
        foo: foo ?? _foo,
        bar: bar ?? _bar,
      );

  @override
  FinalDataClass cloneNonFinalInterfaceDataClass({
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
    if (other is! FinalDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), bar.hashCode));
  }
}

abstract class NonFinalInterfaceDataClass {
  String get bar;
  NonFinalInterfaceDataClass cloneNonFinalInterfaceDataClass({
    String bar,
  });
}

abstract class _DataClassMixinBaseBase extends DataClass {
  int get implementor;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("implementor")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class DataClassMixinBase extends _DataClassMixinBaseBase
    with DataClassMixinBaseDCM {
  final int _implementor;

  DataClassMixinBase({
    @required int implementor,
  })  : _implementor = implementor,
        super() {
    assert(
        this.implementor != null, "null value provided for field implementor");
  }

  DataClassMixinBase clone({
    int implementor,
  }) =>
      new DataClassMixinBase(
        implementor: implementor ?? _implementor,
      );

  @override
  int get implementor => _implementor;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataClassMixinBase) return false;
    return implementor == other.implementor;
  }

  @override
  int get hashCode {
    return $jf($jc(0, implementor.hashCode));
  }
}

abstract class _NestingDataClassBase<T> extends DataClass {
  NestedDataClass get nested;
  GenericNestedDataClass<T> get genericNested;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<NestedDataClass>("nested"),
        new DataClassField<GenericNestedDataClass<T>>("genericNested")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class NestingDataClass<T> extends _NestingDataClassBase<T> {
  final NestedDataClass _nested;
  final GenericNestedDataClass<T> _genericNested;

  NestingDataClass({
    @required NestedDataClass nested,
    @required GenericNestedDataClass<T> genericNested,
  })  : _nested = nested,
        _genericNested = genericNested,
        super() {
    assert(this.nested != null, "null value provided for field nested");
    assert(this.genericNested != null,
        "null value provided for field genericNested");
  }

  NestingDataClass clone({
    NestedDataClass nested,
    GenericNestedDataClass<T> genericNested,
  }) =>
      new NestingDataClass<T>(
        nested: nested ?? _nested,
        genericNested: genericNested ?? _genericNested,
      );

  @override
  NestedDataClass get nested => _nested;
  @override
  GenericNestedDataClass<T> get genericNested => _genericNested;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestingDataClass) return false;
    return nested == other.nested && genericNested == other.genericNested;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nested.hashCode), genericNested.hashCode));
  }
}

abstract class _NestedDataClassBase extends DataClass {
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

class NestedDataClass extends _NestedDataClassBase {
  final String _baz;

  NestedDataClass({
    String baz,
  })  : _baz = baz,
        super() {
    assert(this.baz != null, "null value provided for field baz");
  }

  NestedDataClass clone({
    String baz,
  }) =>
      new NestedDataClass(
        baz: baz ?? _baz,
      );

  @override
  String get baz => _baz ?? super.baz;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedDataClass) return false;
    return baz == other.baz;
  }

  @override
  int get hashCode {
    return $jf($jc(0, baz.hashCode));
  }
}

abstract class _GenericNestedDataClassBase<T> extends DataClass {
  T get nested;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<T>("nested")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class GenericNestedDataClass<T> extends _GenericNestedDataClassBase<T> {
  final T _nested;

  GenericNestedDataClass({
    @required T nested,
  })  : _nested = nested,
        super() {
    assert(this.nested != null, "null value provided for field nested");
  }

  GenericNestedDataClass clone({
    T nested,
  }) =>
      new GenericNestedDataClass<T>(
        nested: nested ?? _nested,
      );

  @override
  T get nested => _nested;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericNestedDataClass) return false;
    return nested == other.nested;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nested.hashCode));
  }
}

abstract class _TestDataClassBase extends DataClass {
  int get fieldWithNoDefault;
  int get fieldWithDefault => 10;
  @computed
  int get computedField => fieldWithDefault;
  @override
  Iterable<ComputedField> get computedFields =>
      [new ComputedField<int>("computedField")];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<int>("fieldWithNoDefault")];

  @override
  Iterable<DataClassField> get defaultedFields =>
      [new DataClassField<int>("fieldWithDefault")];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class TestDataClass extends _TestDataClassBase {
  final int _fieldWithNoDefault;
  final int _fieldWithDefault;
  int _computedField;

  TestDataClass({
    @required int fieldWithNoDefault,
    int fieldWithDefault,
  })  : _fieldWithNoDefault = fieldWithNoDefault,
        _fieldWithDefault = fieldWithDefault,
        super() {
    assert(this.fieldWithNoDefault != null,
        "null value provided for field fieldWithNoDefault");
    assert(this.fieldWithDefault != null,
        "null value provided for field fieldWithDefault");
  }

  TestDataClass clone({
    int fieldWithNoDefault,
    int fieldWithDefault,
  }) =>
      new TestDataClass(
        fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
        fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
      );

  @override
  int get fieldWithNoDefault => _fieldWithNoDefault;
  @override
  int get fieldWithDefault => _fieldWithDefault ?? super.fieldWithDefault;
  @override
  int get computedField => _computedField ??= super.computedField;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, fieldWithNoDefault.hashCode), fieldWithDefault.hashCode));
  }
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

class EnumClassMixinBase extends _EnumClassMixinBaseBase {
  final int _value;

  static final values = Set<EnumClassMixinBase>.from(
    <EnumClassMixinBase>[
      EnumClassMixinBase.a,
      EnumClassMixinBase.b,
    ],
  );

  static EnumClassMixinBase valueOf(int v) {
    if (EnumClassMixinBase.a.value == v) return EnumClassMixinBase.a;
    if (EnumClassMixinBase.b.value == v) return EnumClassMixinBase.b;
    return null;
  }

  EnumClassMixinBase._(this._value) : super._(int);

  static final EnumClassMixinBase a =
      new EnumClassMixinBase._(_EnumClassMixinBaseBase.a ?? 0);
  static final EnumClassMixinBase b =
      new EnumClassMixinBase._(_EnumClassMixinBaseBase.b ?? 1);

  @override
  int get value => _value;

  @override
  EnumClassMixinBase valueOfOther(int v) => EnumClassMixinBase.valueOf(v);

  @override
  Set<EnumClassMixinBase> get allValues => EnumClassMixinBase.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumClassMixinBase) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == EnumClassMixinBase.a) return 'EnumClassMixinBase.a: $_value';
    if (this == EnumClassMixinBase.b) return 'EnumClassMixinBase.b: $_value';
    return '';
  }
}

abstract class _EnumClassMixinBaseBase
    extends EnumClass<EnumClassMixinBase, int> {
  _EnumClassMixinBaseBase._(Type type) : super(type);
  static int a;
  static int b;
}

class DoubleEnum extends _DoubleEnumBase {
  final double _value;

  static final values = Set<DoubleEnum>.from(
    <DoubleEnum>[
      DoubleEnum.a,
      DoubleEnum.b,
    ],
  );

  static DoubleEnum valueOf(double v) {
    if (DoubleEnum.a.value == v) return DoubleEnum.a;
    if (DoubleEnum.b.value == v) return DoubleEnum.b;
    return null;
  }

  DoubleEnum._(this._value) : super._(double);

  static final DoubleEnum a = new DoubleEnum._(_DoubleEnumBase.a);
  static final DoubleEnum b = new DoubleEnum._(_DoubleEnumBase.b);

  @override
  double get value => _value;

  @override
  DoubleEnum valueOfOther(double v) => DoubleEnum.valueOf(v);

  @override
  Set<DoubleEnum> get allValues => DoubleEnum.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DoubleEnum) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == DoubleEnum.a) return 'DoubleEnum.a: $_value';
    if (this == DoubleEnum.b) return 'DoubleEnum.b: $_value';
    return '';
  }
}

abstract class _DoubleEnumBase extends EnumClass<DoubleEnum, double> {
  _DoubleEnumBase._(Type type) : super(type);
  static double a = 0.1;
  static double b = 0.2;
}

class IntEnum extends _IntEnumBase {
  final int _value;

  static final values = Set<IntEnum>.from(
    <IntEnum>[
      IntEnum.a,
      IntEnum.b,
    ],
  );

  static IntEnum valueOf(int v) {
    if (IntEnum.a.value == v) return IntEnum.a;
    if (IntEnum.b.value == v) return IntEnum.b;
    return null;
  }

  IntEnum._(this._value) : super._(int);

  static final IntEnum a = new IntEnum._(_IntEnumBase.a ?? 0);
  static final IntEnum b = new IntEnum._(_IntEnumBase.b ?? 1);

  @override
  int get value => _value;

  @override
  IntEnum valueOfOther(int v) => IntEnum.valueOf(v);

  @override
  Set<IntEnum> get allValues => IntEnum.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! IntEnum) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == IntEnum.a) return 'IntEnum.a: $_value';
    if (this == IntEnum.b) return 'IntEnum.b: $_value';
    return '';
  }
}

abstract class _IntEnumBase extends EnumClass<IntEnum, int> {
  _IntEnumBase._(Type type) : super(type);
  static int a = 7000;
  static int b;
}

class StringEnum extends _StringEnumBase {
  final String _value;

  static final values = Set<StringEnum>.from(
    <StringEnum>[
      StringEnum.a,
      StringEnum.b,
    ],
  );

  static StringEnum valueOf(String v) {
    if (StringEnum.a.value == v) return StringEnum.a;
    if (StringEnum.b.value == v) return StringEnum.b;
    return null;
  }

  StringEnum._(this._value) : super._(String);

  static final StringEnum a = new StringEnum._(_StringEnumBase.a ?? 'a');
  static final StringEnum b = new StringEnum._(_StringEnumBase.b ?? 'b');

  @override
  String get value => _value;

  @override
  StringEnum valueOfOther(String v) => StringEnum.valueOf(v);

  @override
  Set<StringEnum> get allValues => StringEnum.values;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! StringEnum) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    if (this == StringEnum.a) return 'StringEnum.a: $_value';
    if (this == StringEnum.b) return 'StringEnum.b: $_value';
    return '';
  }
}

abstract class _StringEnumBase extends EnumClass<StringEnum, String> {
  _StringEnumBase._(Type type) : super(type);
  static String a = 'a';
  static String b;
}

class SealedClassMixinBase extends _SealedClassMixinBaseBase
    with SealedClassMixinBaseSCM {
  final int _a;
  final bool _aSet;

  final int _b;
  final bool _bSet;

  SealedClassMixinBase.aFactory(this._a)
      : _bSet = false,
        _b = null,
        _aSet = true;

  SealedClassMixinBase.bFactory(this._b)
      : _aSet = false,
        _a = null,
        _bSet = true;

  int get a => _a;
  bool get aSet => _aSet;

  int get b => _b;
  bool get bSet => _bSet;

  W when<W>({
    @required W a(int a),
    @required W b(int b),
  }) {
    if (_aSet) return a(this.a);
    return b(this.b);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedClassMixinBase) return false;
    return a == other.a && b == other.b;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, a.hashCode), b.hashCode));
  }
}

abstract class _SealedClassMixinBaseBase extends SealedClass {
  int get a;
  int get b;
  bool get aSet;

  bool get bSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields =>
      [new SealedClassField<int>("a"), new SealedClassField<int>("b")];
  W when<W>({
    @required W a(int a),
    @required W b(int b),
  });
}

class TestSealedClass extends _TestSealedClassBase {
  final int _integer;
  final bool _integerSet;

  final String _string;
  final bool _stringSet;

  TestSealedClass.integerFactory(this._integer)
      : _stringSet = false,
        _string = null,
        _integerSet = true;

  TestSealedClass.stringFactory(this._string)
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
    if (other is! TestSealedClass) return false;
    return integer == other.integer && string == other.string;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, integer.hashCode), string.hashCode));
  }
}

abstract class _TestSealedClassBase extends SealedClass {
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

class Generic1SealedClass<T> extends _Generic1SealedClassBase<T> {
  final T _t;
  final bool _tSet;

  final String _string;
  final bool _stringSet;

  Generic1SealedClass.tFactory(this._t)
      : _stringSet = false,
        _string = null,
        _tSet = true;

  Generic1SealedClass.stringFactory(this._string)
      : _tSet = false,
        _t = null,
        _stringSet = true;

  T get t => _t;
  bool get tSet => _tSet;

  String get string => _string;
  bool get stringSet => _stringSet;

  W when<W>({
    @required W t(T t),
    @required W string(String string),
  }) {
    if (_tSet) return t(this.t);
    return string(this.string);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic1SealedClass) return false;
    return t == other.t && string == other.string;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, t.hashCode), string.hashCode));
  }
}

abstract class _Generic1SealedClassBase<T> extends SealedClass {
  T get t;
  String get string;
  bool get tSet;

  bool get stringSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields =>
      [new SealedClassField<T>("t"), new SealedClassField<String>("string")];
  W when<W>({
    @required W t(T t),
    @required W string(String string),
  });
}

class GenericSealedClass<T1, T2> extends _GenericSealedClassBase<T1, T2> {
  final T1 _t1;
  final bool _t1Set;

  final T2 _t2;
  final bool _t2Set;

  GenericSealedClass.t1Factory(this._t1)
      : _t2Set = false,
        _t2 = null,
        _t1Set = true;

  GenericSealedClass.t2Factory(this._t2)
      : _t1Set = false,
        _t1 = null,
        _t2Set = true;

  T1 get t1 => _t1;
  bool get t1Set => _t1Set;

  T2 get t2 => _t2;
  bool get t2Set => _t2Set;

  W when<W>({
    @required W t1(T1 t1),
    @required W t2(T2 t2),
  }) {
    if (_t1Set) return t1(this.t1);
    return t2(this.t2);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericSealedClass) return false;
    return t1 == other.t1 && t2 == other.t2;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, t1.hashCode), t2.hashCode));
  }
}

abstract class _GenericSealedClassBase<T1, T2> extends SealedClass {
  T1 get t1;
  T2 get t2;
  bool get t1Set;

  bool get t2Set;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields =>
      [new SealedClassField<T1>("t1"), new SealedClassField<T2>("t2")];
  W when<W>({
    @required W t1(T1 t1),
    @required W t2(T2 t2),
  });
}

class NestingSealedClass extends _NestingSealedClassBase {
  final int _integer;
  final bool _integerSet;

  final NestedSealedClass _nested;
  final bool _nestedSet;

  NestingSealedClass.integerFactory(this._integer)
      : _nestedSet = false,
        _nested = null,
        _integerSet = true;

  NestingSealedClass.nestedFactory(this._nested)
      : _integerSet = false,
        _integer = null,
        _nestedSet = true;

  int get integer => _integer;
  bool get integerSet => _integerSet;

  NestedSealedClass get nested => _nested;
  bool get nestedSet => _nestedSet;

  W when<W>({
    @required W integer(int integer),
    @required W nested(NestedSealedClass nested),
  }) {
    if (_integerSet) return integer(this.integer);
    return nested(this.nested);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestingSealedClass) return false;
    return integer == other.integer && nested == other.nested;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, integer.hashCode), nested.hashCode));
  }
}

abstract class _NestingSealedClassBase extends SealedClass {
  int get integer;
  NestedSealedClass get nested;
  bool get integerSet;

  bool get nestedSet;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<SealedClassField> get unionFields => [
        new SealedClassField<int>("integer"),
        new SealedClassField<NestedSealedClass>("nested")
      ];
  W when<W>({
    @required W integer(int integer),
    @required W nested(NestedSealedClass nested),
  });
}

class NestedSealedClass extends _NestedSealedClassBase {
  final int _integer;
  final bool _integerSet;

  final String _string;
  final bool _stringSet;

  NestedSealedClass.integerFactory(this._integer)
      : _stringSet = false,
        _string = null,
        _integerSet = true;

  NestedSealedClass.stringFactory(this._string)
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
    if (other is! NestedSealedClass) return false;
    return integer == other.integer && string == other.string;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, integer.hashCode), string.hashCode));
  }
}

abstract class _NestedSealedClassBase extends SealedClass {
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
