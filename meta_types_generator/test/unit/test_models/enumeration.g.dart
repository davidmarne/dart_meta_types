// GENERATED CODE - DO NOT MODIFY BY HAND

part of enumeration;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class Enum<EGN> extends $Enum {
  const Enum._(this._value) : assert(_value != null);

  final EGN _value;

  static const Enum<int> a = Enum._($Enum.a);

  static const Enum<String> b = Enum._($Enum.b);

  static const values = <Enum>[Enum.a, Enum.b];

  EGN get value => _value;
  int get ordinal => values.indexOf(this);
  bool get isA {
    return a == this;
  }

  bool get isB {
    return b == this;
  }

  void whenA(void Function(int) handler) {
    if (Enum.a == this) handler(Enum.a._value as int);
  }

  void whenB(void Function(String) handler) {
    if (Enum.b == this) handler(Enum.b._value as String);
  }

  WHEN when<WHEN>(
      {@required WHEN Function(int) a, @required WHEN Function(String) b}) {
    if (this == Enum.a) {
      return a(Enum.a._value as int);
    }
    if (this == Enum.b) {
      return b(Enum.b._value as String);
    }
    throw FallThroughError();
  }

  WHEN wheno<WHEN>(
      {WHEN Function() otherwise,
      WHEN Function(int) a,
      WHEN Function(String) b}) {
    if (this == Enum.a) {
      if (a != null)
        return a(Enum.a._value as int);
      else
        return otherwise();
    }
    if (this == Enum.b) {
      if (b != null)
        return b(Enum.b._value as String);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode => $jf($jc(_value.hashCode, 'Enum'.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Enum) return false;
    return _value == other._value;
  }

  String toString() {
    return "Enum ($_value)";
  }
}

class EnumSerializer extends StructuredSerializer<Enum> {
  @override
  final Iterable<Type> types = const [Enum];

  @override
  final String wireName = 'Enum';

  @override
  Iterable<Object> serialize(Serializers serializers, Enum object,
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
  Enum deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    switch (serialized.first as String) {
      case 'a':
        return Enum.a;
      case 'b':
        return Enum.b;
    }
    throw FallThroughError();
  }
}
