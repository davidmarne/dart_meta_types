// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

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

  T get leaf {
    if (_leaf != null) return _leaf;
    throw Exception('Illegal access of sealed field, leaf is not set');
  }

  Branch<T> get branch {
    if (_branch != null) return _branch;
    throw Exception('Illegal access of sealed field, branch is not set');
  }

  bool get isLeaf {
    return _leaf != null;
  }

  bool get isBranch {
    return _branch != null;
  }

  void whenLeaf(void Function(T) handler) {
    if (_leaf != null) return handler(_leaf);
  }

  void whenBranch(void Function(Branch<T>) handler) {
    if (_branch != null) return handler(_branch);
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
      if (leaf != null)
        return leaf(_leaf);
      else
        return otherwise();
    }
    if (_branch != null) {
      if (branch != null)
        return branch(_branch);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _leaf.hashCode), _branch.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BinaryTree) return false;
    return _leaf == other._leaf && _branch == other._branch;
  }

  String toString() {
    return "BinaryTree (${when(leaf: (leaf) => 'leaf $leaf', branch: (branch) => 'branch $branch')}))";
  }
}

class Branch<T> extends $Branch<T> {
  Branch(
      {@required T value,
      @required BinaryTree<T> left,
      @required BinaryTree<T> right})
      : _value = value,
        assert(value != null),
        _left = left,
        assert(left != null),
        _right = right,
        assert(right != null);

  final T _value;

  final BinaryTree<T> _left;

  final BinaryTree<T> _right;

  T get value {
    return _value;
  }

  BinaryTree<T> get left {
    return _left;
  }

  BinaryTree<T> get right {
    return _right;
  }

  Branch<T> copy({T value, BinaryTree<T> left, BinaryTree<T> right}) {
    return Branch(
      value: value ?? _value,
      left: left ?? _left,
      right: right ?? _right,
    );
  }

  int get hashCode =>
      $jf($jc($jc($jc(0, _value.hashCode), _left.hashCode), _right.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Branch) return false;
    return value == other.value && left == other.left && right == other.right;
  }

  String toString() {
    return "Branch (value: $value, left: $left, right: $right)";
  }
}

class GenericDataClass<T> extends $GenericDataClass<T> {
  GenericDataClass({@required int foo, @required T bar})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null);

  final int _foo;

  final T _bar;

  int get foo {
    return _foo;
  }

  T get bar {
    return _bar;
  }

  GenericDataClass<T> copy({int foo, T bar}) {
    return GenericDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
    );
  }

  int get hashCode => $jf($jc($jc(0, _foo.hashCode), _bar.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  String toString() {
    return "GenericDataClass (foo: $foo, bar: $bar)";
  }
}

class GenericsDataClass<T, P> extends $GenericsDataClass<T, P> {
  GenericsDataClass({@required int foo, @required T bar, @required P baz})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null),
        _baz = baz,
        assert(baz != null);

  final int _foo;

  final T _bar;

  final P _baz;

  int get foo {
    return _foo;
  }

  T get bar {
    return _bar;
  }

  P get baz {
    return _baz;
  }

  GenericsDataClass<T, P> copy({int foo, T bar, P baz}) {
    return GenericsDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
      baz: baz ?? _baz,
    );
  }

  int get hashCode =>
      $jf($jc($jc($jc(0, _foo.hashCode), _bar.hashCode), _baz.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericsDataClass) return false;
    return foo == other.foo && bar == other.bar && baz == other.baz;
  }

  String toString() {
    return "GenericsDataClass (foo: $foo, bar: $bar, baz: $baz)";
  }
}

class ImplementorDataClass extends $ImplementorDataClass {
  ImplementorDataClass(
      {@required int implementor,
      @required int one,
      @required String two,
      @required int three})
      : _implementor = implementor,
        assert(implementor != null),
        _one = one,
        assert(one != null),
        _two = two,
        assert(two != null),
        _three = three,
        assert(three != null);

  final int _implementor;

  final int _one;

  final String _two;

  final int _three;

  int get implementor {
    return _implementor;
  }

  int get one {
    return _one;
  }

  String get two {
    return _two;
  }

  int get three {
    return _three;
  }

  ImplementorDataClass copy({int implementor, int one, String two, int three}) {
    return ImplementorDataClass(
      implementor: implementor ?? _implementor,
      one: one ?? _one,
      two: two ?? _two,
      three: three ?? _three,
    );
  }

  ImplementorDataClass copyInterfaceOne({int one, String two}) {
    return copy(
      one: one ?? _one,
      two: two ?? _two,
    );
  }

  ImplementorDataClass copyInterfaceTwo({String two}) {
    return copy(
      two: two ?? _two,
    );
  }

  ImplementorDataClass copyInterfaceThree({int three}) {
    return copy(
      three: three ?? _three,
    );
  }

  int get hashCode => $jf($jc(
      $jc($jc($jc(0, _implementor.hashCode), _one.hashCode), _two.hashCode),
      _three.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImplementorDataClass) return false;
    return implementor == other.implementor &&
        one == other.one &&
        two == other.two &&
        three == other.three;
  }

  String toString() {
    return "ImplementorDataClass (implementor: $implementor, one: $one, two: $two, three: $three)";
  }
}

class NestingDataClass<T> extends $NestingDataClass<T> {
  NestingDataClass(
      {@required NestedDataClass nested,
      @required GenericNestedDataClass<T> genericNested})
      : _nested = nested,
        assert(nested != null),
        _genericNested = genericNested,
        assert(genericNested != null);

  final NestedDataClass _nested;

  final GenericNestedDataClass<T> _genericNested;

  NestedDataClass get nested {
    return _nested;
  }

  GenericNestedDataClass<T> get genericNested {
    return _genericNested;
  }

  NestingDataClass<T> copy(
      {NestedDataClass nested, GenericNestedDataClass<T> genericNested}) {
    return NestingDataClass(
      nested: nested ?? _nested,
      genericNested: genericNested ?? _genericNested,
    );
  }

  int get hashCode =>
      $jf($jc($jc(0, _nested.hashCode), _genericNested.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestingDataClass) return false;
    return nested == other.nested && genericNested == other.genericNested;
  }

  String toString() {
    return "NestingDataClass (nested: $nested, genericNested: $genericNested)";
  }
}

class NestedDataClass extends $NestedDataClass {
  NestedDataClass({String baz})
      : _baz = baz,
        assert(baz != null);

  final String _baz;

  String get baz {
    return _baz ?? super.baz;
  }

  NestedDataClass copy({String baz}) {
    return NestedDataClass(
      baz: baz ?? _baz,
    );
  }

  int get hashCode => $jf($jc(0, _baz.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedDataClass) return false;
    return baz == other.baz;
  }

  String toString() {
    return "NestedDataClass (baz: $baz)";
  }
}

class GenericNestedDataClass<T> extends $GenericNestedDataClass<T> {
  GenericNestedDataClass({@required T nested})
      : _nested = nested,
        assert(nested != null);

  final T _nested;

  T get nested {
    return _nested;
  }

  GenericNestedDataClass<T> copy({T nested}) {
    return GenericNestedDataClass(
      nested: nested ?? _nested,
    );
  }

  int get hashCode => $jf($jc(0, _nested.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericNestedDataClass) return false;
    return nested == other.nested;
  }

  String toString() {
    return "GenericNestedDataClass (nested: $nested)";
  }
}

class TestDataClass extends $TestDataClass {
  TestDataClass(
      {@required int fieldWithNoDefault,
      int fieldWithDefault,
      int computedField})
      : _fieldWithNoDefault = fieldWithNoDefault,
        assert(fieldWithNoDefault != null),
        _fieldWithDefault = fieldWithDefault,
        assert(fieldWithDefault != null),
        _computedField = computedField,
        assert(computedField != null);

  final int _fieldWithNoDefault;

  final int _fieldWithDefault;

  final int _computedField;

  int get fieldWithNoDefault {
    return _fieldWithNoDefault;
  }

  int get fieldWithDefault {
    return _fieldWithDefault ?? super.fieldWithDefault;
  }

  int get computedField {
    return _computedField ?? super.computedField;
  }

  TestDataClass copy(
      {int fieldWithNoDefault, int fieldWithDefault, int computedField}) {
    return TestDataClass(
      fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
      fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
      computedField: computedField ?? _computedField,
    );
  }

  int get hashCode => $jf($jc(
      $jc($jc(0, _fieldWithNoDefault.hashCode), _fieldWithDefault.hashCode),
      _computedField.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault &&
        computedField == other.computedField;
  }

  String toString() {
    return "TestDataClass (fieldWithNoDefault: $fieldWithNoDefault, fieldWithDefault: $fieldWithDefault, computedField: $computedField)";
  }
}

class StringEnum<EGN> extends $StringEnum {
  const StringEnum._(this._value) : assert(_value != null);

  final EGN _value;

  static const StringEnum<String> a = StringEnum._($StringEnum.a);

  static const StringEnum<String> b = StringEnum._($StringEnum.b);

  static final values = <StringEnum>{StringEnum.a, StringEnum.b};

  EGN get value => _value;
  bool get isA {
    return a != this;
  }

  bool get isB {
    return b != this;
  }

  void whenA(void Function(String) handler) {
    if (StringEnum.a == this) handler(StringEnum.a._value as String);
  }

  void whenB(void Function(String) handler) {
    if (StringEnum.b == this) handler(StringEnum.b._value as String);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(String) a, @required WHEN Function(String) b}) {
    if (this == StringEnum.a) {
      return a(StringEnum.a._value as String);
    }
    if (this == StringEnum.b) {
      return b(StringEnum.b._value as String);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(String) a,
      WHEN Function(String) b}) {
    if (this == StringEnum.a) {
      if (a != null)
        return a(StringEnum.a._value as String);
      else
        return otherwise();
    }
    if (this == StringEnum.b) {
      if (b != null)
        return b(StringEnum.b._value as String);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc(_value.hashCode, 'StringEnum'.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! StringEnum) return false;
    return _value == other._value;
  }

  String toString() {
    return "StringEnum ($_value)";
  }
}

class TestSealedClass extends $TestSealedClass {
  TestSealedClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _string = null;

  TestSealedClass.string(String string)
      : _integer = null,
        assert(string != null),
        _string = string;

  final int _integer;

  final String _string;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('Illegal access of sealed field, integer is not set');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sealed field, string is not set');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) return handler(_integer);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) return handler(_string);
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
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _integer.hashCode), _string.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestSealedClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  String toString() {
    return "TestSealedClass (${when(integer: (integer) => 'integer $integer', string: (string) => 'string $string')}))";
  }
}

class Generic1SealedClass<T> extends $Generic1SealedClass<T> {
  Generic1SealedClass.t(T t)
      : assert(t != null),
        _t = t,
        _string = null;

  Generic1SealedClass.string(String string)
      : _t = null,
        assert(string != null),
        _string = string;

  final T _t;

  final String _string;

  T get t {
    if (_t != null) return _t;
    throw Exception('Illegal access of sealed field, t is not set');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sealed field, string is not set');
  }

  bool get isT {
    return _t != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenT(void Function(T) handler) {
    if (_t != null) return handler(_t);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) return handler(_string);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(T) t, @required WHEN Function(String) string}) {
    if (_t != null) {
      return t(_t);
    }
    if (_string != null) {
      return string(_string);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(T) t,
      WHEN Function(String) string}) {
    if (_t != null) {
      if (t != null)
        return t(_t);
      else
        return otherwise();
    }
    if (_string != null) {
      if (string != null)
        return string(_string);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _t.hashCode), _string.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic1SealedClass) return false;
    return _t == other._t && _string == other._string;
  }

  String toString() {
    return "Generic1SealedClass (${when(t: (t) => 't $t', string: (string) => 'string $string')}))";
  }
}

class GenericSealedClass<T1, T2> extends $GenericSealedClass<T1, T2> {
  GenericSealedClass.t1(T1 t1)
      : assert(t1 != null),
        _t1 = t1,
        _t2 = null;

  GenericSealedClass.t2(T2 t2)
      : _t1 = null,
        assert(t2 != null),
        _t2 = t2;

  final T1 _t1;

  final T2 _t2;

  T1 get t1 {
    if (_t1 != null) return _t1;
    throw Exception('Illegal access of sealed field, t1 is not set');
  }

  T2 get t2 {
    if (_t2 != null) return _t2;
    throw Exception('Illegal access of sealed field, t2 is not set');
  }

  bool get isT1 {
    return _t1 != null;
  }

  bool get isT2 {
    return _t2 != null;
  }

  void whenT1(void Function(T1) handler) {
    if (_t1 != null) return handler(_t1);
  }

  void whenT2(void Function(T2) handler) {
    if (_t2 != null) return handler(_t2);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(T1) t1, @required WHEN Function(T2) t2}) {
    if (_t1 != null) {
      return t1(_t1);
    }
    if (_t2 != null) {
      return t2(_t2);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise, WHEN Function(T1) t1, WHEN Function(T2) t2}) {
    if (_t1 != null) {
      if (t1 != null)
        return t1(_t1);
      else
        return otherwise();
    }
    if (_t2 != null) {
      if (t2 != null)
        return t2(_t2);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _t1.hashCode), _t2.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericSealedClass) return false;
    return _t1 == other._t1 && _t2 == other._t2;
  }

  String toString() {
    return "GenericSealedClass (${when(t1: (t1) => 't1 $t1', t2: (t2) => 't2 $t2')}))";
  }
}

class NestingSealedClass extends $NestingSealedClass {
  NestingSealedClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _nested = null;

  NestingSealedClass.nested(NestedSealedClass nested)
      : _integer = null,
        assert(nested != null),
        _nested = nested;

  final int _integer;

  final NestedSealedClass _nested;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('Illegal access of sealed field, integer is not set');
  }

  NestedSealedClass get nested {
    if (_nested != null) return _nested;
    throw Exception('Illegal access of sealed field, nested is not set');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isNested {
    return _nested != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) return handler(_integer);
  }

  void whenNested(void Function(NestedSealedClass) handler) {
    if (_nested != null) return handler(_nested);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) integer,
      @required WHEN Function(NestedSealedClass) nested}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_nested != null) {
      return nested(_nested);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) integer,
      WHEN Function(NestedSealedClass) nested}) {
    if (_integer != null) {
      if (integer != null)
        return integer(_integer);
      else
        return otherwise();
    }
    if (_nested != null) {
      if (nested != null)
        return nested(_nested);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _integer.hashCode), _nested.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestingSealedClass) return false;
    return _integer == other._integer && _nested == other._nested;
  }

  String toString() {
    return "NestingSealedClass (${when(integer: (integer) => 'integer $integer', nested: (nested) => 'nested $nested')}))";
  }
}

class NestedSealedClass extends $NestedSealedClass {
  NestedSealedClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _string = null;

  NestedSealedClass.string(String string)
      : _integer = null,
        assert(string != null),
        _string = string;

  final int _integer;

  final String _string;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('Illegal access of sealed field, integer is not set');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('Illegal access of sealed field, string is not set');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) return handler(_integer);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) return handler(_string);
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
    return otherwise();
  }

  int get hashCode => $jf($jc($jc(0, _integer.hashCode), _string.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedSealedClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  String toString() {
    return "NestedSealedClass (${when(integer: (integer) => 'integer $integer', string: (string) => 'string $string')}))";
  }
}
