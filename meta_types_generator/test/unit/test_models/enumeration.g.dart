// GENERATED CODE - DO NOT MODIFY BY HAND

part of enumeration;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class TestEnum<EGN> extends $TestEnum {
  const TestEnum._(this._value) : assert(_value != null);

  final EGN _value;

  static const TestEnum<int> a = TestEnum._($TestEnum.a);

  static const TestEnum<String> b = TestEnum._($TestEnum.b);

  static const values = <TestEnum>[TestEnum.a, TestEnum.b];

  EGN get value => _value;
  int get ordinal => values.indexOf(this);
  bool get isA {
    return a == this;
  }

  bool get isB {
    return b == this;
  }

  void whenA(void Function(int) handler) {
    if (TestEnum.a == this) {
      handler(TestEnum.a._value);
    }
  }

  void whenB(void Function(String) handler) {
    if (TestEnum.b == this) {
      handler(TestEnum.b._value);
    }
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(String) b}) {
    if (this == TestEnum.a) {
      return a(TestEnum.a._value);
    }
    if (this == TestEnum.b) {
      return b(TestEnum.b._value);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) a,
      WHEN Function(String) b}) {
    if (this == TestEnum.a) {
      if (a != null) {
        return a(TestEnum.a._value);
      } else {
        return otherwise();
      }
    }
    if (this == TestEnum.b) {
      if (b != null) {
        return b(TestEnum.b._value);
      } else {
        return otherwise();
      }
    }
    return otherwise();
  }

  @override
  int get hashCode => $jf($jc(_value.hashCode, 'TestEnum'.hashCode));
  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TestEnum) return false;
    return _value == other._value;
  }

  @override
  String toString() {
    return 'TestEnum ($_value)';
  }
}

class TestEnumSerializer extends StructuredSerializer<TestEnum> {
  @override
  final Iterable<Type> types = const [TestEnum];

  @override
  final String wireName = 'TestEnum';

  @override
  Iterable<Object> serialize(Serializers serializers, TestEnum object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      object.when(
          a: (object) =>
              serializers.serialize('a', specifiedType: FullType(String)),
          b: (object) =>
              serializers.serialize('b', specifiedType: FullType(String)))
    ];
  }

  @override
  TestEnum deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    switch (serialized.first as String) {
      case 'a':
        return TestEnum.a;
      case 'b':
        return TestEnum.b;
    }
    throw FallThroughError();
  }
}
