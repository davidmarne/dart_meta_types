// GENERATED CODE - DO NOT MODIFY BY HAND

part of seal;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class DataInterfaceBasicImplementationA
    extends $DataInterfaceBasicImplementationA {
  const DataInterfaceBasicImplementationA(
      {@required int a, @required int inheritedValue})
      : _a = a,
        assert(a != null),
        _inheritedValue = inheritedValue,
        assert(inheritedValue != null);

  final int _a;

  final int _inheritedValue;

  int get a {
    return _a;
  }

  int get inheritedValue {
    return _inheritedValue;
  }

  DataInterfaceBasicImplementationA copy({int a, int inheritedValue}) {
    return DataInterfaceBasicImplementationA(
      a: a ?? _a,
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  DataInterfaceBasicImplementationA copyDataInterfaceBasic(
      {int inheritedValue}) {
    return copy(
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  int get hashCode => $jf($jc($jc(0, _a.hashCode), _inheritedValue.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceBasicImplementationA) return false;
    return a == other.a && inheritedValue == other.inheritedValue;
  }

  String toString() {
    return "DataInterfaceBasicImplementationA (a: $a, inheritedValue: $inheritedValue)";
  }
}

class DataInterfaceBasicImplementationASerializer
    extends StructuredSerializer<DataInterfaceBasicImplementationA> {
  @override
  final Iterable<Type> types = const [DataInterfaceBasicImplementationA];

  @override
  final String wireName = 'DataInterfaceBasicImplementationA';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataInterfaceBasicImplementationA object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'a',
      serializers.serialize(object.a, specifiedType: FullType(int)),
      'inheritedValue',
      serializers.serialize(object.inheritedValue, specifiedType: FullType(int))
    ];
  }

  @override
  DataInterfaceBasicImplementationA deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object a;
    Object inheritedValue;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'a':
          a = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
        case 'inheritedValue':
          inheritedValue =
              serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataInterfaceBasicImplementationA(
      a: a as int,
      inheritedValue: inheritedValue as int,
    );
  }
}

class DataInterfaceBasicImplementationB
    extends $DataInterfaceBasicImplementationB {
  const DataInterfaceBasicImplementationB(
      {@required int b, @required int inheritedValue})
      : _b = b,
        assert(b != null),
        _inheritedValue = inheritedValue,
        assert(inheritedValue != null);

  final int _b;

  final int _inheritedValue;

  int get b {
    return _b;
  }

  int get inheritedValue {
    return _inheritedValue;
  }

  DataInterfaceBasicImplementationB copy({int b, int inheritedValue}) {
    return DataInterfaceBasicImplementationB(
      b: b ?? _b,
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  DataInterfaceBasicImplementationB copyDataInterfaceBasic(
      {int inheritedValue}) {
    return copy(
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  int get hashCode => $jf($jc($jc(0, _b.hashCode), _inheritedValue.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceBasicImplementationB) return false;
    return b == other.b && inheritedValue == other.inheritedValue;
  }

  String toString() {
    return "DataInterfaceBasicImplementationB (b: $b, inheritedValue: $inheritedValue)";
  }
}

class DataInterfaceBasicImplementationBSerializer
    extends StructuredSerializer<DataInterfaceBasicImplementationB> {
  @override
  final Iterable<Type> types = const [DataInterfaceBasicImplementationB];

  @override
  final String wireName = 'DataInterfaceBasicImplementationB';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataInterfaceBasicImplementationB object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'b',
      serializers.serialize(object.b, specifiedType: FullType(int)),
      'inheritedValue',
      serializers.serialize(object.inheritedValue, specifiedType: FullType(int))
    ];
  }

  @override
  DataInterfaceBasicImplementationB deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object b;
    Object inheritedValue;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'b':
          b = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
        case 'inheritedValue':
          inheritedValue =
              serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataInterfaceBasicImplementationB(
      b: b as int,
      inheritedValue: inheritedValue as int,
    );
  }
}

class Seal extends $Seal {
  Seal.a(DataInterfaceBasicImplementationA a)
      : assert(a != null),
        _a = a,
        _b = null;

  Seal.b(DataInterfaceBasicImplementationB b)
      : _a = null,
        assert(b != null),
        _b = b;

  final DataInterfaceBasicImplementationA _a;

  final DataInterfaceBasicImplementationB _b;

  int get inheritedValue {
    return when(
      a: (a) => a.inheritedValue,
      b: (b) => b.inheritedValue,
    );
  }

  DataInterfaceBasicImplementationA get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sealed field, a is not set');
  }

  DataInterfaceBasicImplementationB get b {
    if (_b != null) return _b;
    throw Exception('Illegal access of sealed field, b is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(DataInterfaceBasicImplementationA) handler) {
    if (_a != null) return handler(_a);
  }

  void whenB(void Function(DataInterfaceBasicImplementationB) handler) {
    if (_b != null) return handler(_b);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(DataInterfaceBasicImplementationA) a,
      @required WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
      WHEN Function(DataInterfaceBasicImplementationA) a,
      WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
    if (other is! Seal) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    return "Seal (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))";
  }
}

class SealSerializer extends StructuredSerializer<Seal> {
  @override
  final Iterable<Type> types = const [Seal];

  @override
  final String wireName = 'Seal';

  @override
  Iterable<Object> serialize(Serializers serializers, Seal object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationA))
            ],
        b: (object) => [
              'kind',
              serializers.serialize('b', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationB))
            ]);
  }

  @override
  Seal deserialize(Serializers serializers, Iterable<Object> serialized,
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
        return Seal.a(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationA))
            as DataInterfaceBasicImplementationA);
      case 'b':
        return Seal.b(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationB))
            as DataInterfaceBasicImplementationB);
    }
    throw FallThroughError();
  }
}

class SealConst extends $SealConst {
  const SealConst.a(DataInterfaceBasicImplementationA a)
      : assert(a != null),
        _a = a,
        _b = null;

  const SealConst.b(DataInterfaceBasicImplementationB b)
      : _a = null,
        assert(b != null),
        _b = b;

  final DataInterfaceBasicImplementationA _a;

  final DataInterfaceBasicImplementationB _b;

  int get inheritedValue {
    return when(
      a: (a) => a.inheritedValue,
      b: (b) => b.inheritedValue,
    );
  }

  DataInterfaceBasicImplementationA get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sealed field, a is not set');
  }

  DataInterfaceBasicImplementationB get b {
    if (_b != null) return _b;
    throw Exception('Illegal access of sealed field, b is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(DataInterfaceBasicImplementationA) handler) {
    if (_a != null) return handler(_a);
  }

  void whenB(void Function(DataInterfaceBasicImplementationB) handler) {
    if (_b != null) return handler(_b);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(DataInterfaceBasicImplementationA) a,
      @required WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
      WHEN Function(DataInterfaceBasicImplementationA) a,
      WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
    if (other is! SealConst) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    return "SealConst (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))";
  }
}

class SealConstSerializer extends StructuredSerializer<SealConst> {
  @override
  final Iterable<Type> types = const [SealConst];

  @override
  final String wireName = 'SealConst';

  @override
  Iterable<Object> serialize(Serializers serializers, SealConst object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationA))
            ],
        b: (object) => [
              'kind',
              serializers.serialize('b', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationB))
            ]);
  }

  @override
  SealConst deserialize(Serializers serializers, Iterable<Object> serialized,
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
        return SealConst.a(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationA))
            as DataInterfaceBasicImplementationA);
      case 'b':
        return SealConst.b(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationB))
            as DataInterfaceBasicImplementationB);
    }
    throw FallThroughError();
  }
}

class SealComputedFields extends $SealComputedFields {
  SealComputedFields.a(DataInterfaceBasicImplementationA a)
      : assert(a != null),
        _a = a,
        _b = null;

  SealComputedFields.b(DataInterfaceBasicImplementationB b)
      : _a = null,
        assert(b != null),
        _b = b;

  int _value;

  final DataInterfaceBasicImplementationA _a;

  final DataInterfaceBasicImplementationB _b;

  @override
  int get value {
    return _value ??= super.value;
  }

  DataInterfaceBasicImplementationA get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sealed field, a is not set');
  }

  DataInterfaceBasicImplementationB get b {
    if (_b != null) return _b;
    throw Exception('Illegal access of sealed field, b is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isB {
    return _b != null;
  }

  void whenA(void Function(DataInterfaceBasicImplementationA) handler) {
    if (_a != null) return handler(_a);
  }

  void whenB(void Function(DataInterfaceBasicImplementationB) handler) {
    if (_b != null) return handler(_b);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(DataInterfaceBasicImplementationA) a,
      @required WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
      WHEN Function(DataInterfaceBasicImplementationA) a,
      WHEN Function(DataInterfaceBasicImplementationB) b}) {
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
    if (other is! SealComputedFields) return false;
    return _a == other._a && _b == other._b;
  }

  String toString() {
    return "SealComputedFields (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))";
  }
}

class SealComputedFieldsSerializer
    extends StructuredSerializer<SealComputedFields> {
  @override
  final Iterable<Type> types = const [SealComputedFields];

  @override
  final String wireName = 'SealComputedFields';

  @override
  Iterable<Object> serialize(Serializers serializers, SealComputedFields object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationA))
            ],
        b: (object) => [
              'kind',
              serializers.serialize('b', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object,
                  specifiedType: FullType(DataInterfaceBasicImplementationB))
            ]);
  }

  @override
  SealComputedFields deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
        return SealComputedFields.a(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationA))
            as DataInterfaceBasicImplementationA);
      case 'b':
        return SealComputedFields.b(serializers.deserialize(value$,
                specifiedType: FullType(DataInterfaceBasicImplementationB))
            as DataInterfaceBasicImplementationB);
    }
    throw FallThroughError();
  }
}

abstract class SealComputedFieldsBase {
  bool get isA;
  bool get isB;
  void whenA(void Function(DataInterfaceBasicImplementationA) handler);
  void whenB(void Function(DataInterfaceBasicImplementationB) handler);
  WHEN when<WHEN>(
      {@required WHEN Function(DataInterfaceBasicImplementationA) a,
      @required WHEN Function(DataInterfaceBasicImplementationB) b});
  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(DataInterfaceBasicImplementationA) a,
      WHEN Function(DataInterfaceBasicImplementationB) b});
}
