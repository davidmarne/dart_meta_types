// GENERATED CODE - DO NOT MODIFY BY HAND

part of data;

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

  int get concreteValue {
    return _concreteValue;
  }

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

  int get hashCode =>
      $jf($jc($jc(0, _concreteValue.hashCode), _inheritedValue.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceBasicImplementation) return false;
    return concreteValue == other.concreteValue &&
        inheritedValue == other.inheritedValue;
  }

  String toString() {
    return "DataInterfaceBasicImplementation (concreteValue: $concreteValue, inheritedValue: $inheritedValue)";
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

class DataInterfaceGenericsImplementationUnset<T>
    extends $DataInterfaceGenericsImplementationUnset<T> {
  DataInterfaceGenericsImplementationUnset(
      {@required T concreteValue, @required T inheritedValue})
      : _concreteValue = concreteValue,
        assert(concreteValue != null),
        _inheritedValue = inheritedValue,
        assert(inheritedValue != null);

  final T _concreteValue;

  final T _inheritedValue;

  T get concreteValue {
    return _concreteValue;
  }

  T get inheritedValue {
    return _inheritedValue;
  }

  DataInterfaceGenericsImplementationUnset<T> copy(
      {T concreteValue, T inheritedValue}) {
    return DataInterfaceGenericsImplementationUnset(
      concreteValue: concreteValue ?? _concreteValue,
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  DataInterfaceGenericsImplementationUnset<T> copyDataInterfaceGenerics(
      {T inheritedValue}) {
    return copy(
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  int get hashCode =>
      $jf($jc($jc(0, _concreteValue.hashCode), _inheritedValue.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceGenericsImplementationUnset) return false;
    return concreteValue == other.concreteValue &&
        inheritedValue == other.inheritedValue;
  }

  String toString() {
    return "DataInterfaceGenericsImplementationUnset (concreteValue: $concreteValue, inheritedValue: $inheritedValue)";
  }
}

class DataInterfaceGenericsImplementationUnsetSerializer
    extends StructuredSerializer<DataInterfaceGenericsImplementationUnset> {
  @override
  final Iterable<Type> types = const [DataInterfaceGenericsImplementationUnset];

  @override
  final String wireName = 'DataInterfaceGenericsImplementationUnset';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataInterfaceGenericsImplementationUnset object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    return <Object>[
      'concreteValue',
      serializers.serialize(object.concreteValue, specifiedType: paramT),
      'inheritedValue',
      serializers.serialize(object.inheritedValue, specifiedType: paramT)
    ];
  }

  @override
  DataInterfaceGenericsImplementationUnset deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

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
              serializers.deserialize(value$, specifiedType: paramT);
          break;
        case 'inheritedValue':
          inheritedValue =
              serializers.deserialize(value$, specifiedType: paramT);
          break;
      }
    }

    return DataInterfaceGenericsImplementationUnset<Object>(
      concreteValue: concreteValue as Object,
      inheritedValue: inheritedValue as Object,
    );
  }
}

class DataInterfaceGenericsImplementationSet
    extends $DataInterfaceGenericsImplementationSet {
  DataInterfaceGenericsImplementationSet(
      {@required int concreteValue, @required int inheritedValue})
      : _concreteValue = concreteValue,
        assert(concreteValue != null),
        _inheritedValue = inheritedValue,
        assert(inheritedValue != null);

  final int _concreteValue;

  final int _inheritedValue;

  int get concreteValue {
    return _concreteValue;
  }

  int get inheritedValue {
    return _inheritedValue;
  }

  DataInterfaceGenericsImplementationSet copy(
      {int concreteValue, int inheritedValue}) {
    return DataInterfaceGenericsImplementationSet(
      concreteValue: concreteValue ?? _concreteValue,
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  DataInterfaceGenericsImplementationSet copyDataInterfaceGenerics(
      {int inheritedValue}) {
    return copy(
      inheritedValue: inheritedValue ?? _inheritedValue,
    );
  }

  int get hashCode =>
      $jf($jc($jc(0, _concreteValue.hashCode), _inheritedValue.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataInterfaceGenericsImplementationSet) return false;
    return concreteValue == other.concreteValue &&
        inheritedValue == other.inheritedValue;
  }

  String toString() {
    return "DataInterfaceGenericsImplementationSet (concreteValue: $concreteValue, inheritedValue: $inheritedValue)";
  }
}

class DataInterfaceGenericsImplementationSetSerializer
    extends StructuredSerializer<DataInterfaceGenericsImplementationSet> {
  @override
  final Iterable<Type> types = const [DataInterfaceGenericsImplementationSet];

  @override
  final String wireName = 'DataInterfaceGenericsImplementationSet';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataInterfaceGenericsImplementationSet object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'concreteValue',
      serializers.serialize(object.concreteValue, specifiedType: FullType(int)),
      'inheritedValue',
      serializers.serialize(object.inheritedValue, specifiedType: FullType(int))
    ];
  }

  @override
  DataInterfaceGenericsImplementationSet deserialize(
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

    return DataInterfaceGenericsImplementationSet(
      concreteValue: concreteValue as int,
      inheritedValue: inheritedValue as int,
    );
  }
}

class DataClassGenerics<A, B extends DataInterfaceBasic>
    extends $DataClassGenerics<A, B> {
  DataClassGenerics(
      {@required A genericNoExtension, @required B genericDataClassExtension})
      : _genericNoExtension = genericNoExtension,
        assert(genericNoExtension != null),
        _genericDataClassExtension = genericDataClassExtension,
        assert(genericDataClassExtension != null);

  final A _genericNoExtension;

  final B _genericDataClassExtension;

  A get genericNoExtension {
    return _genericNoExtension;
  }

  B get genericDataClassExtension {
    return _genericDataClassExtension;
  }

  DataClassGenerics<A, B> copy(
      {A genericNoExtension, B genericDataClassExtension}) {
    return DataClassGenerics(
      genericNoExtension: genericNoExtension ?? _genericNoExtension,
      genericDataClassExtension:
          genericDataClassExtension ?? _genericDataClassExtension,
    );
  }

  int get hashCode => $jf($jc($jc(0, _genericNoExtension.hashCode),
      _genericDataClassExtension.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataClassGenerics) return false;
    return genericNoExtension == other.genericNoExtension &&
        genericDataClassExtension == other.genericDataClassExtension;
  }

  String toString() {
    return "DataClassGenerics (genericNoExtension: $genericNoExtension, genericDataClassExtension: $genericDataClassExtension)";
  }
}

class DataClassGenericsSerializer
    extends StructuredSerializer<DataClassGenerics> {
  @override
  final Iterable<Type> types = const [DataClassGenerics];

  @override
  final String wireName = 'DataClassGenerics';

  @override
  Iterable<Object> serialize(Serializers serializers, DataClassGenerics object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];

    return <Object>[
      'genericNoExtension',
      serializers.serialize(object.genericNoExtension, specifiedType: paramA),
      'genericDataClassExtension',
      serializers.serialize(object.genericDataClassExtension,
          specifiedType: paramB)
    ];
  }

  @override
  DataClassGenerics deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    final paramA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];
    final paramB =
        isUnderspecified ? FullType.object : specifiedType.parameters[1];

    Object genericNoExtension;
    Object genericDataClassExtension;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'genericNoExtension':
          genericNoExtension =
              serializers.deserialize(value$, specifiedType: paramA);
          break;
        case 'genericDataClassExtension':
          genericDataClassExtension =
              serializers.deserialize(value$, specifiedType: paramB);
          break;
      }
    }

    return DataClassGenerics<Object, DataInterfaceBasic>(
      genericNoExtension: genericNoExtension as Object,
      genericDataClassExtension:
          genericDataClassExtension as DataInterfaceBasic,
    );
  }
}

class DataClassConst extends $DataClassConst {
  const DataClassConst({@required int value})
      : _value = value,
        assert(value != null);

  final int _value;

  int get value {
    return _value;
  }

  DataClassConst copy({int value}) {
    return DataClassConst(
      value: value ?? _value,
    );
  }

  int get hashCode => $jf($jc(0, _value.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataClassConst) return false;
    return value == other.value;
  }

  String toString() {
    return "DataClassConst (value: $value)";
  }
}

class DataClassConstSerializer extends StructuredSerializer<DataClassConst> {
  @override
  final Iterable<Type> types = const [DataClassConst];

  @override
  final String wireName = 'DataClassConst';

  @override
  Iterable<Object> serialize(Serializers serializers, DataClassConst object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: FullType(int))
    ];
  }

  @override
  DataClassConst deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object value;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'value':
          value = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataClassConst(
      value: value as int,
    );
  }
}

class DataClassDefaultFields extends $DataClassDefaultFields {
  DataClassDefaultFields({int value}) : _value = value;

  final int _value;

  int get value {
    return _value ?? super.value;
  }

  DataClassDefaultFields copy({int value}) {
    return DataClassDefaultFields(
      value: value ?? _value,
    );
  }

  int get hashCode => $jf($jc(0, value.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataClassDefaultFields) return false;
    return value == other.value;
  }

  String toString() {
    return "DataClassDefaultFields (value: $value)";
  }
}

class DataClassDefaultFieldsSerializer
    extends StructuredSerializer<DataClassDefaultFields> {
  @override
  final Iterable<Type> types = const [DataClassDefaultFields];

  @override
  final String wireName = 'DataClassDefaultFields';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataClassDefaultFields object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: FullType(int))
    ];
  }

  @override
  DataClassDefaultFields deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object value;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'value':
          value = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataClassDefaultFields(
      value: value as int,
    );
  }
}

class DataClassComputedFields extends $DataClassComputedFields {
  DataClassComputedFields({@required int value})
      : _value = value,
        assert(value != null);

  int _doubled;

  final int _value;

  int get value {
    return _value;
  }

  @override
  int get doubled {
    return _doubled ??= super.doubled;
  }

  DataClassComputedFields copy({int value}) {
    return DataClassComputedFields(
      value: value ?? _value,
    );
  }

  int get hashCode => $jf($jc(0, _value.hashCode));
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataClassComputedFields) return false;
    return value == other.value;
  }

  String toString() {
    return "DataClassComputedFields (value: $value)";
  }
}

class DataClassComputedFieldsSerializer
    extends StructuredSerializer<DataClassComputedFields> {
  @override
  final Iterable<Type> types = const [DataClassComputedFields];

  @override
  final String wireName = 'DataClassComputedFields';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DataClassComputedFields object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: FullType(int))
    ];
  }

  @override
  DataClassComputedFields deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    Object value;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value$ = iterator.current;
      switch (key) {
        case 'value':
          value = serializers.deserialize(value$, specifiedType: FullType(int));
          break;
      }
    }

    return DataClassComputedFields(
      value: value as int,
    );
  }
}
