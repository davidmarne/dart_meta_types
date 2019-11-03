// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class ExampleDataClass extends $ExampleDataClass {
  ExampleDataClass(
      {int fieldWithNoDefault, int fieldWithDefault, Nullable<int> nullable})
      : _fieldWithNoDefault = fieldWithNoDefault,
        assert(fieldWithNoDefault != null),
        _fieldWithDefault = fieldWithDefault,
        assert(fieldWithDefault != null),
        _nullable = nullable,
        assert(nullable != null);

  factory ExampleDataClass.load(Iterable<DataLoader> loaders) =>
      ExampleDataClass(
        fieldWithNoDefault: loaders
            .firstWhere((l) => l.name == 'fieldWithNoDefault')
            .value as int,
        fieldWithDefault: loaders
            .firstWhere((l) => l.name == 'fieldWithDefault')
            .value as int,
        nullable: loaders.firstWhere((l) => l.name == 'nullable').value
            as Nullable<int>,
      );

  int _computedField;

  final int _fieldWithNoDefault;

  final int _fieldWithDefault;

  final Nullable<int> _nullable;

  Data<DataValue> _meta$;

  ExampleDataClass clone(
      {int fieldWithNoDefault, int fieldWithDefault, Nullable<int> nullable}) {
    return ExampleDataClass(
      fieldWithNoDefault: fieldWithNoDefault ?? _fieldWithNoDefault,
      fieldWithDefault: fieldWithDefault ?? _fieldWithDefault,
      nullable: nullable ?? _nullable,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'ExampleDataClass',
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
            name: 'nullable',
            returnType: FieldType(
              type: 'Nullable',
            ),
            isComputed: false,
            value: _nullable,
            isAbstract: true,
            isDefaulted: false,
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

  Nullable<int> get nullable {
    return _nullable;
  }

  int get fieldWithDefault {
    return _fieldWithDefault ?? super.fieldWithDefault;
  }

  int get computedField {
    return _computedField ??= super.computedField;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, fieldWithNoDefault.hashCode), fieldWithDefault.hashCode),
        nullable.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ExampleDataClass) return false;
    return fieldWithNoDefault == other.fieldWithNoDefault &&
        fieldWithDefault == other.fieldWithDefault &&
        nullable == other.nullable;
  }

  String toString() {
    return "ExampleDataClass (fieldWithNoDefault: $fieldWithNoDefault, nullable: $nullable)";
  }
}

class ImplementorDataClass extends $ImplementorDataClass {
  ImplementorDataClass({int foo, String bar})
      : _foo = foo,
        assert(foo != null),
        _bar = bar,
        assert(bar != null);

  factory ImplementorDataClass.load(Iterable<DataLoader> loaders) =>
      ImplementorDataClass(
        foo: loaders.firstWhere((l) => l.name == 'foo').value as int,
        bar: loaders.firstWhere((l) => l.name == 'bar').value as String,
      );

  final int _foo;

  final String _bar;

  Data<DataValue> _meta$;

  ImplementorDataClass clone({int foo, String bar}) {
    return ImplementorDataClass(
      foo: foo ?? _foo,
      bar: bar ?? _bar,
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
            name: 'foo',
            returnType: FieldType(
              type: 'int',
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
              name: 'InterfaceDataClass',
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
  int get foo {
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
    if (other is! ImplementorDataClass) return false;
    return foo == other.foo && bar == other.bar;
  }

  String toString() {
    return "ImplementorDataClass (foo: $foo, bar: $bar)";
  }
}

class BaseDataClass extends $BaseDataClass {
  BaseDataClass({int foo})
      : _foo = foo,
        assert(foo != null);

  factory BaseDataClass.load(Iterable<DataLoader> loaders) => BaseDataClass(
        foo: loaders.firstWhere((l) => l.name == 'foo').value as int,
      );

  final int _foo;

  Data<DataValue> _meta$;

  BaseDataClass clone({int foo}) {
    return BaseDataClass(
      foo: foo ?? _foo,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'BaseDataClass',
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
          )
        ],
        interfaces: [],
        generics: [],
      );
  int get foo {
    return _foo;
  }

  int get hashCode {
    return $jf($jc(0, foo.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BaseDataClass) return false;
    return foo == other.foo;
  }

  String toString() {
    return "BaseDataClass (foo: $foo)";
  }
}

class ParentDataClass extends $ParentDataClass {
  ParentDataClass({int bar})
      : _bar = bar,
        assert(bar != null);

  factory ParentDataClass.load(Iterable<DataLoader> loaders) => ParentDataClass(
        bar: loaders.firstWhere((l) => l.name == 'bar').value as int,
      );

  final int _bar;

  Data<DataValue> _meta$;

  ParentDataClass clone({int bar}) {
    return ParentDataClass(
      bar: bar ?? _bar,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'ParentDataClass',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'bar',
            returnType: FieldType(
              type: 'int',
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
  int get bar {
    return _bar;
  }

  int get hashCode {
    return $jf($jc(0, bar.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ParentDataClass) return false;
    return bar == other.bar;
  }

  String toString() {
    return "ParentDataClass (bar: $bar)";
  }
}

class GrandparentDataClass extends $GrandparentDataClass {
  GrandparentDataClass({String baz})
      : _baz = baz,
        assert(baz != null);

  factory GrandparentDataClass.load(Iterable<DataLoader> loaders) =>
      GrandparentDataClass(
        baz: loaders.firstWhere((l) => l.name == 'baz').value as String,
      );

  final String _baz;

  Data<DataValue> _meta$;

  GrandparentDataClass clone({String baz}) {
    return GrandparentDataClass(
      baz: baz ?? _baz,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'GrandparentDataClass',
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
    if (other is! GrandparentDataClass) return false;
    return baz == other.baz;
  }

  String toString() {
    return "GrandparentDataClass ()";
  }
}

class ExampleSealedClass extends $ExampleSealedClass {
  ExampleSealedClass.integer(int integer)
      : assert(integer != null),
        _integer = integer,
        _string = null;

  ExampleSealedClass.string(String string)
      : _integer = null,
        assert(string != null),
        _string = string;

  ExampleSealedClass({int integer, String string})
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
    if (other is! ExampleSealedClass) return false;
    return _integer == other._integer && _string == other._string;
  }

  String toString() {
    final value = when(
      integer: (integer) => 'integer $integer',
      string: (string) => 'string $string',
    );
    return 'ExampleSealedClass( $value )';
  }
}

abstract class IExampleSealedClass {
  void whenInteger(void Function(int) handler);
  void whenString(void Function(String) handler);
  WHEN when<WHEN>({WHEN Function(int) integer, WHEN Function(String) string});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(int) integer,
      WHENO Function(String) string});
}

class BinaryTree<T> extends $BinaryTree<T> {
  BinaryTree.leaf(T leaf)
      : assert(leaf != null),
        _leaf = leaf,
        _branch = null;

  BinaryTree.branch($Branch<T> branch)
      : _leaf = null,
        _branch = null;

  BinaryTree({T leaf, $Branch<T> branch})
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

  final $Branch<T> _branch;

  T get leaf {
    if (_leaf != null) return _leaf;
    throw Exception('TODO name htis');
  }

  $Branch<T> get branch {
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

  void whenBranch(void Function($Branch<T>) handler) {
    if (_branch != null) handler(_branch);
  }

  WHEN when<WHEN>({WHEN Function(T) leaf, WHEN Function($Branch<T>) branch}) {
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
      WHENO Function($Branch<T>) branch}) {
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
  void whenBranch(void Function($Branch<T>) handler);
  WHEN when<WHEN>({WHEN Function(T) leaf, WHEN Function($Branch<T>) branch});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) leaf,
      WHENO Function($Branch<T>) branch});
}

class Branch<T> extends $Branch<T> {
  Branch({T val, $BinaryTree<T> left, $BinaryTree<T> right})
      : _val = val,
        assert(val != null),
        _left = left,
        assert(left != null),
        _right = right,
        assert(right != null);

  factory Branch.load(Iterable<DataLoader> loaders) => Branch(
        val: loaders.firstWhere((l) => l.name == 'val').value as T,
        left:
            loaders.firstWhere((l) => l.name == 'left').value as $BinaryTree<T>,
        right: loaders.firstWhere((l) => l.name == 'right').value
            as $BinaryTree<T>,
      );

  final T _val;

  final $BinaryTree<T> _left;

  final $BinaryTree<T> _right;

  Data<DataValue> _meta$;

  Branch<T> clone({T val, $BinaryTree<T> left, $BinaryTree<T> right}) {
    return Branch(
      val: val ?? _val,
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
            name: 'val',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _val,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'left',
            returnType: FieldType(
              type: '$BinaryTree',
            ),
            isComputed: false,
            value: _left,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'right',
            returnType: FieldType(
              type: '$BinaryTree',
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
  T get val {
    return _val;
  }

  $BinaryTree<T> get left {
    return _left;
  }

  $BinaryTree<T> get right {
    return _right;
  }

  int get hashCode {
    return $jf($jc($jc($jc(0, val.hashCode), left.hashCode), right.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Branch) return false;
    return val == other.val && left == other.left && right == other.right;
  }

  String toString() {
    return "Branch (val: $val, left: $left, right: $right)";
  }
}
