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
        _branch = null;

  BinaryTree({T leaf, Branch<T> branch})
      : _leaf = leaf,
        _branch = branch {
    var found = false;
    if (leaf != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (branch != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final T _leaf;

  final Branch<T> _branch;

  T get leaf {
    if (_leaf != null) return _leaf;
    throw Exception('TODO name htis');
  }

  Branch<T> get branch {
    if (_branch != null) return _branch;
    throw Exception('TODO name htis');
  }

  bool get isLeaf {
    return _leaf != null;
  }

  bool get isBranch {
    return _branch != null;
  }

  void whenLeaf(void Function(T) handler) {
    if (_leaf != null) handler(_leaf);
  }

  void whenBranch(void Function(Branch<T>) handler) {
    if (_branch != null) handler(_branch);
  }

  WHEN when<WHEN>({WHEN Function(T) leaf, WHEN Function(Branch<T>) branch}) {
    if (_leaf != null) {
      return leaf(_leaf);
    }
    if (_branch != null) {
      return branch(_branch);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) leaf,
      WHENO Function(Branch<T>) branch}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _leaf.hashCode), _branch.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BinaryTree) return false;
    return _leaf == other._leaf && _branch == other._branch;
  }

  String toString() {
    final value = when(
      leaf: (leaf) => 'leaf $leaf',
      branch: (branch) => 'branch $branch',
    );
    return 'BinaryTree( $value )';
  }
}

abstract class IBinaryTree<T> {
  void whenLeaf(void Function(T) handler);
  void whenBranch(void Function(Branch<T>) handler);
  WHEN when<WHEN>({WHEN Function(T) leaf, WHEN Function(Branch<T>) branch});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) leaf,
      WHENO Function(Branch<T>) branch});
}

class Branch<T> extends $Branch<T> {
  Branch({T value, BinaryTree<T> left, BinaryTree<T> right})
      : _value = value,
        assert(value != null),
        _left = left,
        assert(left != null),
        _right = right,
        assert(right != null);

  factory Branch.load(Iterable<DataLoader> loaders) => Branch(
        value: loaders.firstWhere((l) => l.name == 'value').value as T,
        left:
            loaders.firstWhere((l) => l.name == 'left').value as BinaryTree<T>,
        right:
            loaders.firstWhere((l) => l.name == 'right').value as BinaryTree<T>,
      );

  final T _value;

  final BinaryTree<T> _left;

  final BinaryTree<T> _right;

  Data<DataValue> _meta$;

  Branch<T> clone({T value, BinaryTree<T> left, BinaryTree<T> right}) {
    return Branch(
      value: value ?? _value,
      left: left ?? _left,
      right: right ?? _right,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'Branch',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'value',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _value,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'left',
            returnType: FieldType(
              type: 'BinaryTree',
            ),
            isComputed: false,
            value: _left,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'right',
            returnType: FieldType(
              type: 'BinaryTree',
            ),
            isComputed: false,
            value: _right,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  T get value {
    return _value;
  }

  BinaryTree<T> get left {
    return _left;
  }

  BinaryTree<T> get right {
    return _right;
  }

  int get hashCode {
    return $jf($jc($jc($jc(0, value.hashCode), left.hashCode), right.hashCode));
  }

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
  GenericDataClass({int foo, T bar})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null);

  factory GenericDataClass.load(Iterable<DataLoader> loaders) =>
      GenericDataClass(
        foo: loaders.firstWhere((l) => l.name == 'foo').value as int,
        bar: loaders.firstWhere((l) => l.name == 'bar').value as T,
      );

  final int _foo;

  final T _bar;

  Data<DataValue> _meta$;

  GenericDataClass<T> clone({int foo, T bar}) {
    return GenericDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'GenericDataClass',
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
            name: 'bar',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _bar,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  int get foo {
    return _foo;
  }

  T get bar {
    return _bar;
  }

  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), bar.hashCode));
  }

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
  GenericsDataClass({int foo, T bar, P baz})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null),
        _baz = baz,
        assert(baz != null);

  factory GenericsDataClass.load(Iterable<DataLoader> loaders) =>
      GenericsDataClass(
        foo: loaders.firstWhere((l) => l.name == 'foo').value as int,
        bar: loaders.firstWhere((l) => l.name == 'bar').value as T,
        baz: loaders.firstWhere((l) => l.name == 'baz').value as P,
      );

  final int _foo;

  final T _bar;

  final P _baz;

  Data<DataValue> _meta$;

  GenericsDataClass<T, P> clone({int foo, T bar, P baz}) {
    return GenericsDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
      baz: baz ?? _baz,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'GenericsDataClass',
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
            name: 'bar',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _bar,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'baz',
            returnType: FieldType(
              type: 'P',
            ),
            isComputed: false,
            value: _baz,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  int get foo {
    return _foo;
  }

  T get bar {
    return _bar;
  }

  P get baz {
    return _baz;
  }

  int get hashCode {
    return $jf($jc($jc($jc(0, foo.hashCode), bar.hashCode), baz.hashCode));
  }

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
  ImplementorDataClass({int implementor, int one, String two, int three})
      : _implementor = implementor,
        assert(implementor != null),
        _one = one,
        assert(one != null),
        _two = two,
        assert(two != null),
        _three = three,
        assert(three != null);

  factory ImplementorDataClass.load(Iterable<DataLoader> loaders) =>
      ImplementorDataClass(
        implementor:
            loaders.firstWhere((l) => l.name == 'implementor').value as int,
        one: loaders.firstWhere((l) => l.name == 'one').value as int,
        two: loaders.firstWhere((l) => l.name == 'two').value as String,
        three: loaders.firstWhere((l) => l.name == 'three').value as int,
      );

  final int _implementor;

  final int _one;

  final String _two;

  final int _three;

  Data<DataValue> _meta$;

  ImplementorDataClass clone(
      {int implementor, int one, String two, int three}) {
    return ImplementorDataClass(
      implementor: implementor ?? _implementor,
      one: one ?? _one,
      two: two ?? _two,
      three: three ?? _three,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'ImplementorDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'implementor',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: false,
            value: _implementor,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'InterfaceOne',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'one',
                  returnType: FieldType(
                    type: 'int',
                  ),
                  isComputed: false,
                  value: _one,
                  isAbstract: true,
                  isDefaulted: false,
                )
              ],
              interfaces: [
                MetaInterfaceType<Data<DataValue>>(
                  meta: Data<DataValue>(
                    isFinal: false,
                    isInterface: true,
                    isConst: null,
                    name: 'InterfaceTwo',
                    isPrivate: null,
                    fields: [
                      DataValue(
                        name: 'two',
                        returnType: FieldType(
                          type: 'String',
                        ),
                        isComputed: false,
                        value: _two,
                        isAbstract: true,
                        isDefaulted: false,
                      )
                    ],
                    interfaces: [],
                    generics: [],
                  ),
                  generics: [],
                )
              ],
              generics: [],
            ),
            generics: [],
          ),
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'InterfaceTwo',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'two',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _two,
                  isAbstract: true,
                  isDefaulted: false,
                )
              ],
              interfaces: [],
              generics: [],
            ),
            generics: [],
          ),
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'InterfaceThree',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'three',
                  returnType: FieldType(
                    type: 'int',
                  ),
                  isComputed: false,
                  value: _three,
                  isAbstract: true,
                  isDefaulted: false,
                )
              ],
              interfaces: [],
              generics: [],
            ),
            generics: [],
          )
        ],
        generics: [],
      );
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

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, implementor.hashCode), one.hashCode), two.hashCode),
        three.hashCode));
  }

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

class FinalDataClass extends $FinalDataClass {
  FinalDataClass({IMPORTDataClass foo, String bar})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null);

  factory FinalDataClass.load(Iterable<DataLoader> loaders) => FinalDataClass(
        foo:
            loaders.firstWhere((l) => l.name == 'foo').value as IMPORTDataClass,
        bar: loaders.firstWhere((l) => l.name == 'bar').value as String,
      );

  final IMPORTDataClass _foo;

  final String _bar;

  Data<DataValue> _meta$;

  FinalDataClass clone({IMPORTDataClass foo, String bar}) {
    return FinalDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: true,
        isInterface: false,
        isConst: null,
        name: 'FinalDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'foo',
            returnType: FieldType(
              type: 'IMPORTDataClass',
            ),
            isComputed: false,
            value: _foo,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'NonFinalInterfaceDataClass',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'bar',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _bar,
                  isAbstract: true,
                  isDefaulted: false,
                )
              ],
              interfaces: [],
              generics: [],
            ),
            generics: [],
          )
        ],
        generics: [],
      );
  IMPORTDataClass get foo {
    return _foo;
  }

  String get bar {
    return _bar;
  }

  int get hashCode {
    return $jf($jc($jc(0, foo.hashCode), bar.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FinalDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  String toString() {
    return "FinalDataClass (foo: $foo, bar: $bar)";
  }
}

class NestingDataClass<T> extends $NestingDataClass<T> {
  NestingDataClass(
      {$NestedDataClass nested, $GenericNestedDataClass<T> genericNested})
      : _nested = nested,
        assert(nested != null),
        _genericNested = genericNested,
        assert(genericNested != null);

  factory NestingDataClass.load(Iterable<DataLoader> loaders) =>
      NestingDataClass(
        nested: loaders.firstWhere((l) => l.name == 'nested').value
            as $NestedDataClass,
        genericNested: loaders
            .firstWhere((l) => l.name == 'genericNested')
            .value as $GenericNestedDataClass<T>,
      );

  final $NestedDataClass _nested;

  final $GenericNestedDataClass<T> _genericNested;

  Data<DataValue> _meta$;

  NestingDataClass<T> clone(
      {$NestedDataClass nested, $GenericNestedDataClass<T> genericNested}) {
    return NestingDataClass(
      nested: nested ?? _nested,
      genericNested: genericNested ?? _genericNested,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'NestingDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'nested',
            returnType: FieldType(
              type: '$NestedDataClass',
            ),
            isComputed: false,
            value: _nested,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'genericNested',
            returnType: FieldType(
              type: '$GenericNestedDataClass',
            ),
            isComputed: false,
            value: _genericNested,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  $NestedDataClass get nested {
    return _nested;
  }

  $GenericNestedDataClass<T> get genericNested {
    return _genericNested;
  }

  int get hashCode {
    return $jf($jc($jc(0, nested.hashCode), genericNested.hashCode));
  }

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

  factory NestedDataClass.load(Iterable<DataLoader> loaders) => NestedDataClass(
        baz: loaders.firstWhere((l) => l.name == 'baz').value as String,
      );

  final String _baz;

  Data<DataValue> _meta$;

  NestedDataClass clone({String baz}) {
    return NestedDataClass(
      baz: baz ?? _baz,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'NestedDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'baz',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _baz,
            isAbstract: false,
            isDefaulted: true,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get baz {
    return _baz ?? super.baz;
  }

  int get hashCode {
    return $jf($jc(0, baz.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedDataClass) return false;
    return baz == other.baz;
  }

  String toString() {
    return "NestedDataClass ()";
  }
}

class GenericNestedDataClass<T> extends $GenericNestedDataClass<T> {
  GenericNestedDataClass({T nested})
      : _nested = nested,
        assert(nested != null);

  factory GenericNestedDataClass.load(Iterable<DataLoader> loaders) =>
      GenericNestedDataClass(
        nested: loaders.firstWhere((l) => l.name == 'nested').value as T,
      );

  final T _nested;

  Data<DataValue> _meta$;

  GenericNestedDataClass<T> clone({T nested}) {
    return GenericNestedDataClass(
      nested: nested ?? _nested,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'GenericNestedDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'nested',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _nested,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  T get nested {
    return _nested;
  }

  int get hashCode {
    return $jf($jc(0, nested.hashCode));
  }

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
  TestDataClass({int fieldWithNoDefault, int fieldWithDefault})
      : _fieldWithNoDefault = fieldWithNoDefault,
        assert(fieldWithNoDefault != null),
        _fieldWithDefault = fieldWithDefault,
        assert(fieldWithDefault != null);

  factory TestDataClass.load(Iterable<DataLoader> loaders) => TestDataClass(
        fieldWithNoDefault: loaders
            .firstWhere((l) => l.name == 'fieldWithNoDefault')
            .value as int,
        fieldWithDefault: loaders
            .firstWhere((l) => l.name == 'fieldWithDefault')
            .value as int,
      );

  int _computedField;

  final int _fieldWithNoDefault;

  final int _fieldWithDefault;

  Data<DataValue> _meta$;

  TestDataClass clone({int fieldWithNoDefault, int fieldWithDefault}) {
    return TestDataClass(
      fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
      fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'TestDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'fieldWithNoDefault',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: false,
            value: _fieldWithNoDefault,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'fieldWithDefault',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: false,
            value: _fieldWithDefault,
            isAbstract: false,
            isDefaulted: true,
          ),
          DataValue(
            name: 'computedField',
            returnType: FieldType(
              type: 'int',
            ),
            isComputed: true,
            value: _computedField,
            isAbstract: false,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  int get fieldWithNoDefault {
    return _fieldWithNoDefault;
  }

  int get fieldWithDefault {
    return _fieldWithDefault ?? super.fieldWithDefault;
  }

  int get computedField {
    return _computedField ??= super.computedField;
  }

  int get hashCode {
    return $jf(
        $jc($jc(0, fieldWithNoDefault.hashCode), fieldWithDefault.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault;
  }

  String toString() {
    return "TestDataClass (fieldWithNoDefault: $fieldWithNoDefault)";
  }
}

class StringEnum extends $StringEnum {
  const StringEnum._(this._value) : assert(_value != null);

  final Object _value;

  static const StringEnum a = const StringEnum._($StringEnum.a);

  static const StringEnum b = const StringEnum._($StringEnum.b);

  bool get isA {
    return a != null;
  }

  bool get isB {
    return b != null;
  }

  void whenA(void Function(String) handler) {
    if (a == this) handler(StringEnum.a._value as String);
  }

  void whenB(void Function(String) handler) {
    if (b == this) handler(StringEnum.b._value as String);
  }

  WHEN when<WHEN>({WHEN Function(String) a, WHEN Function(String) b}) {
    if (this == a) {
      return a(StringEnum.a._value as String);
    }
    if (this == b) {
      return b(StringEnum.b._value as String);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(String) a,
      WHENO Function(String) b}) {
    if (this == a) {
      if (a != null)
        return a(StringEnum.a._value as String);
      else
        return otherwise();
    }
    if (this == b) {
      if (b != null)
        return b(StringEnum.b._value as String);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(_value.hashCode, 'StringEnum'.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! StringEnum) return false;
    return _value == other._value;
  }

  String toString() {
    return 'StringEnum( $_value )';
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

  TestSealedClass({int integer, String string})
      : _integer = integer,
        _string = string {
    var found = false;
    if (integer != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (string != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final int _integer;

  final String _string;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('TODO name htis');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('TODO name htis');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) handler(_integer);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) handler(_string);
  }

  WHEN when<WHEN>({WHEN Function(int) integer, WHEN Function(String) string}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_string != null) {
      return string(_string);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _integer.hashCode), _string.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestSealedClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  String toString() {
    final value = when(
      integer: (integer) => 'integer $integer',
      string: (string) => 'string $string',
    );
    return 'TestSealedClass( $value )';
  }
}

abstract class ITestSealedClass {
  void whenInteger(void Function(int) handler);
  void whenString(void Function(String) handler);
  WHEN when<WHEN>({WHEN Function(int) integer, WHEN Function(String) string});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string});
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

  Generic1SealedClass({T t, String string})
      : _t = t,
        _string = string {
    var found = false;
    if (t != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (string != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final T _t;

  final String _string;

  T get t {
    if (_t != null) return _t;
    throw Exception('TODO name htis');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('TODO name htis');
  }

  bool get isT {
    return _t != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenT(void Function(T) handler) {
    if (_t != null) handler(_t);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) handler(_string);
  }

  WHEN when<WHEN>({WHEN Function(T) t, WHEN Function(String) string}) {
    if (_t != null) {
      return t(_t);
    }
    if (_string != null) {
      return string(_string);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) t,
      WHENO Function(String) string}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _t.hashCode), _string.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic1SealedClass) return false;
    return _t == other._t && _string == other._string;
  }

  String toString() {
    final value = when(
      t: (t) => 't $t',
      string: (string) => 'string $string',
    );
    return 'Generic1SealedClass( $value )';
  }
}

abstract class IGeneric1SealedClass<T> {
  void whenT(void Function(T) handler);
  void whenString(void Function(String) handler);
  WHEN when<WHEN>({WHEN Function(T) t, WHEN Function(String) string});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) t,
      WHENO Function(String) string});
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

  GenericSealedClass({T1 t1, T2 t2})
      : _t1 = t1,
        _t2 = t2 {
    var found = false;
    if (t1 != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (t2 != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final T1 _t1;

  final T2 _t2;

  T1 get t1 {
    if (_t1 != null) return _t1;
    throw Exception('TODO name htis');
  }

  T2 get t2 {
    if (_t2 != null) return _t2;
    throw Exception('TODO name htis');
  }

  bool get isT1 {
    return _t1 != null;
  }

  bool get isT2 {
    return _t2 != null;
  }

  void whenT1(void Function(T1) handler) {
    if (_t1 != null) handler(_t1);
  }

  void whenT2(void Function(T2) handler) {
    if (_t2 != null) handler(_t2);
  }

  WHEN when<WHEN>({WHEN Function(T1) t1, WHEN Function(T2) t2}) {
    if (_t1 != null) {
      return t1(_t1);
    }
    if (_t2 != null) {
      return t2(_t2);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T1) t1,
      WHENO Function(T2) t2}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _t1.hashCode), _t2.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericSealedClass) return false;
    return _t1 == other._t1 && _t2 == other._t2;
  }

  String toString() {
    final value = when(
      t1: (t1) => 't1 $t1',
      t2: (t2) => 't2 $t2',
    );
    return 'GenericSealedClass( $value )';
  }
}

abstract class IGenericSealedClass<T1, T2> {
  void whenT1(void Function(T1) handler);
  void whenT2(void Function(T2) handler);
  WHEN when<WHEN>({WHEN Function(T1) t1, WHEN Function(T2) t2});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T1) t1,
      WHENO Function(T2) t2});
}

class NestingSealedClass extends $NestingSealedClass {
  NestingSealedClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _nested = null;

  NestingSealedClass.nested($NestedSealedClass nested)
      : _integer = null,
        assert(nested != null),
        _nested = nested;

  NestingSealedClass({int integer, $NestedSealedClass nested})
      : _integer = integer,
        _nested = nested {
    var found = false;
    if (integer != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (nested != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final int _integer;

  final $NestedSealedClass _nested;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('TODO name htis');
  }

  $NestedSealedClass get nested {
    if (_nested != null) return _nested;
    throw Exception('TODO name htis');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isNested {
    return _nested != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) handler(_integer);
  }

  void whenNested(void Function($NestedSealedClass) handler) {
    if (_nested != null) handler(_nested);
  }

  WHEN when<WHEN>(
      {WHEN Function(int) integer, WHEN Function($NestedSealedClass) nested}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_nested != null) {
      return nested(_nested);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function($NestedSealedClass) nested}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _integer.hashCode), _nested.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestingSealedClass) return false;
    return _integer == other._integer && _nested == other._nested;
  }

  String toString() {
    final value = when(
      integer: (integer) => 'integer $integer',
      nested: (nested) => 'nested $nested',
    );
    return 'NestingSealedClass( $value )';
  }
}

abstract class INestingSealedClass {
  void whenInteger(void Function(int) handler);
  void whenNested(void Function($NestedSealedClass) handler);
  WHEN when<WHEN>(
      {WHEN Function(int) integer, WHEN Function($NestedSealedClass) nested});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function($NestedSealedClass) nested});
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

  NestedSealedClass({int integer, String string})
      : _integer = integer,
        _string = string {
    var found = false;
    if (integer != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (string != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final int _integer;

  final String _string;

  int get integer {
    if (_integer != null) return _integer;
    throw Exception('TODO name htis');
  }

  String get string {
    if (_string != null) return _string;
    throw Exception('TODO name htis');
  }

  bool get isInteger {
    return _integer != null;
  }

  bool get isString {
    return _string != null;
  }

  void whenInteger(void Function(int) handler) {
    if (_integer != null) handler(_integer);
  }

  void whenString(void Function(String) handler) {
    if (_string != null) handler(_string);
  }

  WHEN when<WHEN>({WHEN Function(int) integer, WHEN Function(String) string}) {
    if (_integer != null) {
      return integer(_integer);
    }
    if (_string != null) {
      return string(_string);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string}) {
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

  int get hashCode {
    return $jf($jc($jc(0, _integer.hashCode), _string.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedSealedClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  String toString() {
    final value = when(
      integer: (integer) => 'integer $integer',
      string: (string) => 'string $string',
    );
    return 'NestedSealedClass( $value )';
  }
}

abstract class INestedSealedClass {
  void whenInteger(void Function(int) handler);
  void whenString(void Function(String) handler);
  WHEN when<WHEN>({WHEN Function(int) integer, WHEN Function(String) string});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string});
}
