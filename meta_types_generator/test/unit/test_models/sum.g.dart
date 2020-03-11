// GENERATED CODE - DO NOT MODIFY BY HAND

part of sum;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class DataInterfaceBasicImplementation
    extends $DataInterfaceBasicImplementation {
  DataInterfaceBasicImplementation(
      {@required int concreteValue, @required int inheritedValue})
      : _concreteValue = concreteValue,
        assert(concreteValue != null),
        _inheritedValue = inheritedValue,
        assert(inheritedValue != null);

  final int _concreteValue;

  final int _inheritedValue;

  @override
  int get concreteValue {
    return _concreteValue;
  }

  @override
  int get inheritedValue {
    return _inheritedValue;
  }

  DataInterfaceBasicImplementation copy(
      {int concreteValue, int inheritedValue}) {
    return DataInterfaceBasicImplementation(
      concreteValue: concreteValue ?? _concreteValue,
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  DataInterfaceBasicImplementation copyDataInterfaceBasic(
      {int inheritedValue}) {
    return copy(
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  @override
  int get hashCode =>
      $jf($jc($jc(0, _concreteValue.hashCode), _inheritedValue.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceBasicImplementation) return false;
    return concreteValue == other.concreteValue &&
        inheritedValue == other.inheritedValue;
  }

  @override
  String toString() {
    return 'DataInterfaceBasicImplementation (concreteValue: $concreteValue, inheritedValue: $inheritedValue)';
  }
}

class DataInterfaceBasicImplementationSerializer
    extends StructuredSerializer<DataInterfaceBasicImplementation> {
  @override
  final Iterable<Type> types = const [DataInterfaceBasicImplementation];

  @override
  final String wireName = 'DataInterfaceBasicImplementation';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataInterfaceBasicImplementation object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'concreteValue',
      serializers.serialize(object.concreteValue, specifiedType: FullType(int)),
      'inheritedValue',
      serializers.serialize(object.inheritedValue, specifiedType: FullType(int))
    ];
  }

  @override
  DataInterfaceBasicImplementation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object concreteValue;
    Object inheritedValue;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'concreteValue':
          concreteValue =
              serializers.deserialize(value$, specifiedType: FullType(int));
          break;
        case 'inheritedValue':
          inheritedValue =
              serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataInterfaceBasicImplementation(
      concreteValue: concreteValue as int,
      inheritedValue: inheritedValue as int,
    );
  }
}

class SumGenerics<A, B extends DataInterfaceBasic> extends $SumGenerics<A, B> {
  SumGenerics.genericNoExtension(A genericNoExtension)
      : assert(genericNoExtension != null),
        _genericNoExtension = genericNoExtension,
        _genericSumExtension = null;

  SumGenerics.genericSumExtension(B genericSumExtension)
      : _genericNoExtension = null,
        assert(genericSumExtension != null),
        _genericSumExtension = genericSumExtension;

  final A _genericNoExtension;

  final B _genericSumExtension;

  @override
  A get genericNoExtension {
    if (_genericNoExtension != null) return _genericNoExtension;
    throw Exception(
        'Illegal access of sum field, genericNoExtension is not set');
  }

  @override
  B get genericSumExtension {
    if (_genericSumExtension != null) return _genericSumExtension;
    throw Exception(
        'Illegal access of sum field, genericSumExtension is not set');
  }

  bool get isGenericNoExtension {
    return _genericNoExtension != null;
  }

  bool get isGenericSumExtension {
    return _genericSumExtension != null;
  }

  void whenGenericNoExtension(void Function(A) handler) {
    if (_genericNoExtension != null) {
      return handler(_genericNoExtension);
    }
  }

  void whenGenericSumExtension(void Function(B) handler) {
    if (_genericSumExtension != null) {
      return handler(_genericSumExtension);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(A) genericNoExtension,
      @required WHEN Function(B) genericSumExtension}) {
    if (_genericNoExtension != null) {
      return genericNoExtension(_genericNoExtension);
    }
    if (_genericSumExtension != null) {
      return genericSumExtension(_genericSumExtension);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(A) genericNoExtension,
      WHEN Function(B) genericSumExtension}) {
    if (_genericNoExtension != null) {
      if (genericNoExtension != null) {
        return genericNoExtension(_genericNoExtension);
      } else {
        return otherwise();
      }
    }
    if (_genericSumExtension != null) {
      if (genericSumExtension != null) {
        return genericSumExtension(_genericSumExtension);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf(
      $jc($jc(0, _genericNoExtension.hashCode), _genericSumExtension.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumGenerics) return false;
    return _genericNoExtension == other._genericNoExtension &&
        _genericSumExtension == other._genericSumExtension;
  }

  @override
  String toString() {
    return 'SumGenerics (${when(genericNoExtension: (genericNoExtension) => 'genericNoExtension $genericNoExtension', genericSumExtension: (genericSumExtension) => 'genericSumExtension $genericSumExtension')}))';
  }
}

class SumGenericsSerializer extends StructuredSerializer<SumGenerics> {
  @override
  final Iterable<Type> types = const [SumGenerics];

  @override
  final String wireName = 'SumGenerics';

  @override
  Iterable<Object> serialize(Serializers serializers, SumGenerics object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];
    return object.when(
        genericNoExtension: (object) => [
              'kind',
              serializers.serialize('genericNoExtension',
                  specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: paramA)
            ],
        genericSumExtension: (object) => [
              'kind',
              serializers.serialize('genericSumExtension',
                  specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: paramB)
            ]);
  }

  @override
  SumGenerics deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];
    final iterator = serialized.iterator;
    iterator.moveNext();
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    iterator.moveNext();
    final dynamic value$ = iterator.current;
    switch (key) {
      case 'genericNoExtension':
        return SumGenerics.genericNoExtension(
            serializers.deserialize(value$, specifiedType: paramA));
      case 'genericSumExtension':
        return SumGenerics.genericSumExtension(
            serializers.deserialize(value$, specifiedType: paramB));
    }
    throw FallThroughError();
  }
}

class SumConst extends $SumConst {
  const SumConst.a(int a)
      : assert(a != null),
        _a = a,
        _b = null;

  const SumConst.b(double b)
      : _a = null,
        assert(b != null),
        _b = b;

  final int _a;

  final double _b;

  @override
  int get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  @override
  double get b {
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
    if (_a != null) {
      return handler(_a);
    }
  }

  void whenB(void Function(double) handler) {
    if (_b != null) {
      return handler(_b);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(double) b}) {
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
      WHEN Function(double) b}) {
    if (_a != null) {
      if (a != null) {
        return a(_a);
      } else {
        return otherwise();
      }
    }
    if (_b != null) {
      if (b != null) {
        return b(_b);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumConst) return false;
    return _a == other._a && _b == other._b;
  }

  @override
  String toString() {
    return 'SumConst (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))';
  }
}

class SumConstSerializer extends StructuredSerializer<SumConst> {
  @override
  final Iterable<Type> types = const [SumConst];

  @override
  final String wireName = 'SumConst';

  @override
  Iterable<Object> serialize(Serializers serializers, SumConst object,
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
              serializers.serialize(object, specifiedType: FullType(double))
            ]);
  }

  @override
  SumConst deserialize(Serializers serializers, Iterable<Object> serialized,
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
        return SumConst.a(
            serializers.deserialize(value$, specifiedType: FullType(int)));
      case 'b':
        return SumConst.b(
            serializers.deserialize(value$, specifiedType: FullType(double)));
    }
    throw FallThroughError();
  }
}

class SumComputedFields extends $SumComputedFields {
  SumComputedFields.a(int a)
      : assert(a != null),
        _a = a,
        _b = null;

  SumComputedFields.b(double b)
      : _a = null,
        assert(b != null),
        _b = b;

  int _doubled;

  final int _a;

  final double _b;

  @override
  int get doubled {
    return _doubled ??= super.doubled;
  }

  @override
  int get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  @override
  double get b {
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
    if (_a != null) {
      return handler(_a);
    }
  }

  void whenB(void Function(double) handler) {
    if (_b != null) {
      return handler(_b);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(double) b}) {
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
      WHEN Function(double) b}) {
    if (_a != null) {
      if (a != null) {
        return a(_a);
      } else {
        return otherwise();
      }
    }
    if (_b != null) {
      if (b != null) {
        return b(_b);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _a.hashCode), _b.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumComputedFields) return false;
    return _a == other._a && _b == other._b;
  }

  @override
  String toString() {
    return 'SumComputedFields (${when(a: (a) => 'a $a', b: (b) => 'b $b')}))';
  }
}

class SumComputedFieldsSerializer
    extends StructuredSerializer<SumComputedFields> {
  @override
  final Iterable<Type> types = const [SumComputedFields];

  @override
  final String wireName = 'SumComputedFields';

  @override
  Iterable<Object> serialize(Serializers serializers, SumComputedFields object,
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
              serializers.serialize(object, specifiedType: FullType(double))
            ]);
  }

  @override
  SumComputedFields deserialize(
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
        return SumComputedFields.a(
            serializers.deserialize(value$, specifiedType: FullType(int)));
      case 'b':
        return SumComputedFields.b(
            serializers.deserialize(value$, specifiedType: FullType(double)));
    }
    throw FallThroughError();
  }
}

abstract class SumComputedFieldsBase {
  bool get isA;
  bool get isB;
  void whenA(void Function(int) handler);
  void whenB(void Function(double) handler);
  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(double) b});
  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) a,
      WHEN Function(double) b});
}

class SumWithVoid extends $SumWithVoid {
  const SumWithVoid.a(int a)
      : assert(a != null),
        _a = a,
        _v = null;

  const SumWithVoid.v()
      : _a = null,
        _v = true;

  final int _a;

  final bool _v;

  @override
  int get a {
    if (_a != null) return _a;
    throw Exception('Illegal access of sum field, a is not set');
  }

  @override
  void get v {
    if (_v != null) return;
    throw Exception('Illegal access of sum field, v is not set');
  }

  bool get isA {
    return _a != null;
  }

  bool get isV {
    return _v != null;
  }

  void whenA(void Function(int) handler) {
    if (_a != null) {
      return handler(_a);
    }
  }

  void whenV(void Function() handler) {
    if (_v != null) {
      return handler();
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function() v}) {
    if (_a != null) {
      return a(_a);
    }
    if (_v != null) {
      return v();
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise, WHEN Function(int) a, WHEN Function() v}) {
    if (_a != null) {
      if (a != null) {
        return a(_a);
      } else {
        return otherwise();
      }
    }
    if (_v != null) {
      if (v != null) {
        return v();
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc($jc(0, _a.hashCode), _v.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumWithVoid) return false;
    return _a == other._a && _v == other._v;
  }

  @override
  String toString() {
    return 'SumWithVoid (${when(a: (a) => 'a $a', v: () => 'v')}))';
  }
}

class SumWithVoidSerializer extends StructuredSerializer<SumWithVoid> {
  @override
  final Iterable<Type> types = const [SumWithVoid];

  @override
  final String wireName = 'SumWithVoid';

  @override
  Iterable<Object> serialize(Serializers serializers, SumWithVoid object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.when(
        a: (object) => [
              'kind',
              serializers.serialize('a', specifiedType: FullType(String)),
              'value',
              serializers.serialize(object, specifiedType: FullType(int))
            ],
        v: () => [
              'kind',
              serializers.serialize('v', specifiedType: FullType(String)),
              'value',
              serializers.serialize(true, specifiedType: FullType(bool))
            ]);
  }

  @override
  SumWithVoid deserialize(Serializers serializers, Iterable<Object> serialized,
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
        return SumWithVoid.a(
            serializers.deserialize(value$, specifiedType: FullType(int)));
      case 'v':
        return SumWithVoid.v();
    }
    throw FallThroughError();
  }
}
