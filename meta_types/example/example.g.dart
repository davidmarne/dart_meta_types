// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class ExampleSumClass extends $ExampleSumClass {
  ExampleSumClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _string = null;

  ExampleSumClass.string(String string)
      : _integer = null,
        assert(string != null),
        _string = string;

  final int _integer;

  final String _string;

  @override
  int get integer {
    if (_integer != null) return _integer;
    throw Exception('Illegal access of sum field, integer is not set');
  }

  @override
  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sum field, string is not set');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) {
      return handler(_integer);
    }
  }

  void whenString(void Function(String) handler) {
    if (_string != null) {
      return handler(_string);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) integer,
      @required WHEN Function(String) string}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_string != null) {
      return string(_string);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) integer,
      WHEN Function(String) string}) {
    if (_integer != null) {
      if (integer != null) {
        return integer(_integer);
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
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _integer.hashCode), _string.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleSumClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  @override
  String toString() {
    return 'ExampleSumClass (${when(integer: (integer) => 'integer $integer', string: (string) => 'string $string')}))';
  }
}

class ExampleDataClass extends $ExampleDataClass {
  ExampleDataClass(
      {@required int fieldWithNoDefault,
      int fieldWithDefault,
      @required Option<int> nullable})
      : _fieldWithNoDefault = fieldWithNoDefault,
        assert(fieldWithNoDefault != null),
        _fieldWithDefault = fieldWithDefault,
        _nullable = nullable,
        assert(nullable != null);

  int _computedField;

  final int _fieldWithNoDefault;

  final int _fieldWithDefault;

  final Option<int> _nullable;

  @override
  int get fieldWithNoDefault {
    return _fieldWithNoDefault;
  }

  @override
  Option<int> get nullable {
    return _nullable;
  }

  @override
  int get fieldWithDefault {
    return _fieldWithDefault ?? super.fieldWithDefault;
  }

  @override
  int get computedField {
    return _computedField ??= super.computedField;
  }

  ExampleDataClass copy(
      {int fieldWithNoDefault, int fieldWithDefault, Option<int> nullable}) {
    return ExampleDataClass(
      fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
      fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
      nullable: nullable ?? _nullable,
    );
  }

  @override
  int get hashCode => $jf($jc(
      $jc($jc(0, _fieldWithNoDefault.hashCode), fieldWithDefault.hashCode),
      _nullable.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault &&
        nullable == other.nullable;
  }

  @override
  String toString() {
    return 'ExampleDataClass (fieldWithNoDefault: $fieldWithNoDefault, fieldWithDefault: $fieldWithDefault, nullable: $nullable)';
  }
}

class ImplementorDataClass extends $ImplementorDataClass {
  ImplementorDataClass({@required int baz, @required String foo})
      : _baz = baz,
        assert(baz != null),
        _foo = foo,
        assert(foo != null);

  final int _baz;

  final String _foo;

  @override
  int get baz {
    return _baz;
  }

  @override
  String get foo {
    return _foo;
  }

  ImplementorDataClass copy({int baz, String foo}) {
    return ImplementorDataClass(
      baz: baz ?? _baz,
      foo: foo ?? _foo,
    );
  }

  ImplementorDataClass copyInterfaceDataClass({String foo}) {
    return copy(
      foo: foo ?? _foo,
    );
  }

  @override
  int get hashCode => $jf($jc($jc(0, _baz.hashCode), _foo.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImplementorDataClass) return false;
    return baz == other.baz && foo == other.foo;
  }

  @override
  String toString() {
    return 'ImplementorDataClass (baz: $baz, foo: $foo)';
  }
}

class ImplementorDataClass2 extends $ImplementorDataClass2 {
  ImplementorDataClass2({@required int bar, @required String foo})
      : _bar = bar,
        assert(bar != null),
        _foo = foo,
        assert(foo != null);

  final int _bar;

  final String _foo;

  @override
  int get bar {
    return _bar;
  }

  @override
  String get foo {
    return _foo;
  }

  ImplementorDataClass2 copy({int bar, String foo}) {
    return ImplementorDataClass2(
      bar: bar ?? _bar,
      foo: foo ?? _foo,
    );
  }

  ImplementorDataClass2 copyInterfaceDataClass({String foo}) {
    return copy(
      foo: foo ?? _foo,
    );
  }

  @override
  int get hashCode => $jf($jc($jc(0, _bar.hashCode), _foo.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImplementorDataClass2) return false;
    return bar == other.bar && foo == other.foo;
  }

  @override
  String toString() {
    return 'ImplementorDataClass2 (bar: $bar, foo: $foo)';
  }
}

class SealedDataClass extends $SealedDataClass {
  SealedDataClass.one(ImplementorDataClass one)
      : assert(one != null),
        _one = one,
        _two = null;

  SealedDataClass.two(ImplementorDataClass2 two)
      : _one = null,
        assert(two != null),
        _two = two;

  final ImplementorDataClass _one;

  final ImplementorDataClass2 _two;

  @override
  String get foo {
    return when(
      one: (one) => one.foo,
      two: (two) => two.foo,
    );
  }

  @override
  ImplementorDataClass get one {
    if (_one != null) return _one;
    throw Exception('Illegal access of sealed field, one is not set');
  }

  @override
  ImplementorDataClass2 get two {
    if (_two != null) return _two;
    throw Exception('Illegal access of sealed field, two is not set');
  }

  bool get isOne {
    return _one != null;
  }

  bool get isTwo {
    return _two != null;
  }

  void whenOne(void Function(ImplementorDataClass) handler) {
    if (_one != null) {
      return handler(_one);
    }
  }

  void whenTwo(void Function(ImplementorDataClass2) handler) {
    if (_two != null) {
      return handler(_two);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(ImplementorDataClass) one,
      @required WHEN Function(ImplementorDataClass2) two}) {
    if (_one != null) {
      return one(_one);
    }
    if (_two != null) {
      return two(_two);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(ImplementorDataClass) one,
      WHEN Function(ImplementorDataClass2) two}) {
    if (_one != null) {
      if (one != null) {
        return one(_one);
      } else {
        return otherwise();
      }
    }
    if (_two != null) {
      if (two != null) {
        return two(_two);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _one.hashCode), _two.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedDataClass) return false;
    return _one == other._one && _two == other._two;
  }

  @override
  String toString() {
    return 'SealedDataClass (${when(one: (one) => 'one $one', two: (two) => 'two $two')}))';
  }
}

class ExampleEnumString<EGN> extends $ExampleEnumString {
  const ExampleEnumString._(this._value) : assert(_value != null);

  final EGN _value;

  static const ExampleEnumString<String> a =
      ExampleEnumString._($ExampleEnumString.a);

  static const ExampleEnumString<String> b =
      ExampleEnumString._($ExampleEnumString.b);

  static const ExampleEnumString<String> c =
      ExampleEnumString._($ExampleEnumString.c);

  static const values = <ExampleEnumString>[
    ExampleEnumString.a,
    ExampleEnumString.b,
    ExampleEnumString.c
  ];

  EGN get value => _value;
  int get ordinal => values.indexOf(this);
  bool get isA {
    return a == this;
  }

  bool get isB {
    return b == this;
  }

  bool get isC {
    return c == this;
  }

  void whenA(void Function(String) handler) {
    if (ExampleEnumString.a == this) {
      handler(ExampleEnumString.a._value);
    }
  }

  void whenB(void Function(String) handler) {
    if (ExampleEnumString.b == this) {
      handler(ExampleEnumString.b._value);
    }
  }

  void whenC(void Function(String) handler) {
    if (ExampleEnumString.c == this) {
      handler(ExampleEnumString.c._value);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(String) a,
      @required WHEN Function(String) b,
      @required WHEN Function(String) c}) {
    if (this == ExampleEnumString.a) {
      return a(ExampleEnumString.a._value);
    }
    if (this == ExampleEnumString.b) {
      return b(ExampleEnumString.b._value);
    }
    if (this == ExampleEnumString.c) {
      return c(ExampleEnumString.c._value);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(String) a,
      WHEN Function(String) b,
      WHEN Function(String) c}) {
    if (this == ExampleEnumString.a) {
      if (a != null) {
        return a(ExampleEnumString.a._value);
      } else {
        return otherwise();
      }
    }
    if (this == ExampleEnumString.b) {
      if (b != null) {
        return b(ExampleEnumString.b._value);
      } else {
        return otherwise();
      }
    }
    if (this == ExampleEnumString.c) {
      if (c != null) {
        return c(ExampleEnumString.c._value);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc(_value.hashCode, 'ExampleEnumString'.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleEnumString) return false;
    return _value == other._value;
  }

  @override
  String toString() {
    return 'ExampleEnumString ($_value)';
  }
}

class BinaryTree<T> extends $BinaryTree<T> {
  BinaryTree.leaf(T leaf)
      : assert(leaf != null),
        _leaf = leaf,
        _branch = null;

  BinaryTree.branch(Branch<T> branch)
      : _leaf = null,
        assert(branch != null),
        _branch = branch;

  final T _leaf;

  final Branch<T> _branch;

  @override
  T get leaf {
    if (_leaf != null) return _leaf;
    throw Exception('Illegal access of sum field, leaf is not set');
  }

  @override
  Branch<T> get branch {
    if (_branch != null) return _branch;
    throw Exception('Illegal access of sum field, branch is not set');
  }

  bool get isLeaf {
    return _leaf != null;
  }

  bool get isBranch {
    return _branch != null;
  }

  void whenLeaf(void Function(T) handler) {
    if (_leaf != null) {
      return handler(_leaf);
    }
  }

  void whenBranch(void Function(Branch<T>) handler) {
    if (_branch != null) {
      return handler(_branch);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(T) leaf,
      @required WHEN Function(Branch<T>) branch}) {
    if (_leaf != null) {
      return leaf(_leaf);
    }
    if (_branch != null) {
      return branch(_branch);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(T) leaf,
      WHEN Function(Branch<T>) branch}) {
    if (_leaf != null) {
      if (leaf != null) {
        return leaf(_leaf);
      } else {
        return otherwise();
      }
    }
    if (_branch != null) {
      if (branch != null) {
        return branch(_branch);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _leaf.hashCode), _branch.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BinaryTree) return false;
    return _leaf == other._leaf && _branch == other._branch;
  }

  @override
  String toString() {
    return 'BinaryTree (${when(leaf: (leaf) => 'leaf $leaf', branch: (branch) => 'branch $branch')}))';
  }
}

class Branch<T> extends $Branch<T> {
  Branch(
      {@required T val,
      @required BinaryTree<T> left,
      @required BinaryTree<T> right})
      : _val = val,
        assert(val != null),
        _left = left,
        assert(left != null),
        _right = right,
        assert(right != null);

  final T _val;

  final BinaryTree<T> _left;

  final BinaryTree<T> _right;

  @override
  T get val {
    return _val;
  }

  @override
  BinaryTree<T> get left {
    return _left;
  }

  @override
  BinaryTree<T> get right {
    return _right;
  }

  Branch<T> copy({T val, BinaryTree<T> left, BinaryTree<T> right}) {
    return Branch(
      val: val ?? _val,
      left: left ?? _left,
      right: right ?? _right,
    );
  }

  @override
  int get hashCode =>
      $jf($jc($jc($jc(0, _val.hashCode), _left.hashCode), _right.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Branch) return false;
    return val == other.val && left == other.left && right == other.right;
  }

  @override
  String toString() {
    return 'Branch (val: $val, left: $left, right: $right)';
  }
}
