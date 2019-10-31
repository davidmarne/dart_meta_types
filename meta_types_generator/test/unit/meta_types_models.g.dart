// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta_types_models;

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

class SealedField extends $SealedField {
  SealedField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  factory SealedField.load(Iterable<DataLoader> loaders) => SealedField(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  Data<DataValue> _meta$;

  SealedField clone({FieldType returnType, String name, bool isComputed}) {
    return SealedField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SealedField',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SealedField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class SealedValue extends $SealedValue {
  SealedValue(
      {FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  factory SealedValue.load(Iterable<DataLoader> loaders) => SealedValue(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  Data<DataValue> _meta$;

  SealedValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return SealedValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SealedValue',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: false,
              isConst: null,
              name: 'SealedField',
              isPrivate: null,
              fields: [],
              interfaces: [
                MetaInterfaceType<Data<DataValue>>(
                  meta: Data<DataValue>(
                    isFinal: false,
                    isInterface: true,
                    isConst: null,
                    name: 'Field',
                    isPrivate: null,
                    fields: [
                      DataValue(
                        name: 'returnType',
                        returnType: FieldType(
                          type: 'FieldType',
                        ),
                        isComputed: false,
                        value: _returnType,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'name',
                        returnType: FieldType(
                          type: 'String',
                        ),
                        isComputed: false,
                        value: _name,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'isComputed',
                        returnType: FieldType(
                          type: 'bool',
                        ),
                        isComputed: false,
                        value: _isComputed,
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
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
              name: 'Value',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'value',
                  returnType: FieldType(
                    type: 'Object',
                  ),
                  isComputed: false,
                  value: _value,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SealedValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sealed<T extends SealedField, D extends DataField> extends $Sealed<T, D> {
  Sealed(
      {bool isConst,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields})
      : _isConst = isConst,
        assert(isConst != null),
        _dataInterfaces = dataInterfaces,
        assert(dataInterfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  factory Sealed.load(Iterable<DataLoader> loaders) => Sealed(
        isConst: loaders.firstWhere((l) => l.name == 'isConst').value as bool,
        dataInterfaces: loaders
            .firstWhere((l) => l.name == 'dataInterfaces')
            .value as Iterable<MetaInterfaceType<Data<D>>>,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isPrivate:
            loaders.firstWhere((l) => l.name == 'isPrivate').value as bool,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Iterable<TypeParameterDeclaration>,
        fields:
            loaders.firstWhere((l) => l.name == 'fields').value as Iterable<T>,
      );

  Iterable<T> _computedFields;

  Iterable<T> _nonComputedFields;

  Iterable<D> _dataFields;

  final bool _isConst;

  final Iterable<MetaInterfaceType<Data<D>>> _dataInterfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  Data<DataValue> _meta$;

  Sealed<T, D> clone(
      {bool isConst,
      Iterable<MetaInterfaceType<Data<D>>> dataInterfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields}) {
    return Sealed(
      isConst: isConst ?? _isConst,
      dataInterfaces: dataInterfaces ?? _dataInterfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'Sealed',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'isConst',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isConst,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'dataInterfaces',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: false,
            value: _dataInterfaces,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'computedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _computedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'nonComputedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _nonComputedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'dataFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _dataFields,
            isAbstract: false,
            isDefaulted: false,
          )
        ],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Meta',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isPrivate',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isPrivate,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'generics',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _generics,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'fields',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _fields,
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
  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterfaceType<Data<D>>> get dataInterfaces {
    return _dataInterfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<D> get dataFields {
    return _dataFields ??= super.dataFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isConst.hashCode), dataInterfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sealed) return false;
    return isConst == other.isConst &&
        dataInterfaces == other.dataInterfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Sealed (isConst: $isConst, dataInterfaces: $dataInterfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class SealedLoader extends $SealedLoader {
  SealedLoader({String name, Object value})
      : _name = name,
        assert(name != null),
        _value = value,
        assert(value != null);

  factory SealedLoader.load(Iterable<DataLoader> loaders) => SealedLoader(
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final String _name;

  final Object _value;

  Data<DataValue> _meta$;

  SealedLoader clone({String name, Object value}) {
    return SealedLoader(
      name: name ?? _name,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SealedLoader',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'name',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _name,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'value',
            returnType: FieldType(
              type: 'Object',
            ),
            isComputed: false,
            value: _value,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get name {
    return _name;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SealedLoader) return false;
    return name == other.name && value == other.value;
  }

  String toString() {
    return "SealedLoader (name: $name, value: $value)";
  }
}

class EnumField extends $EnumField {
  EnumField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  factory EnumField.load(Iterable<DataLoader> loaders) => EnumField(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  Data<DataValue> _meta$;

  EnumField clone({FieldType returnType, String name, bool isComputed}) {
    return EnumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'EnumField',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "EnumField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class EnumsValue extends $EnumsValue {
  EnumsValue({FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  factory EnumsValue.load(Iterable<DataLoader> loaders) => EnumsValue(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  Data<DataValue> _meta$;

  EnumsValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return EnumsValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'EnumsValue',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: false,
              isConst: null,
              name: 'EnumField',
              isPrivate: null,
              fields: [],
              interfaces: [
                MetaInterfaceType<Data<DataValue>>(
                  meta: Data<DataValue>(
                    isFinal: false,
                    isInterface: true,
                    isConst: null,
                    name: 'Field',
                    isPrivate: null,
                    fields: [
                      DataValue(
                        name: 'returnType',
                        returnType: FieldType(
                          type: 'FieldType',
                        ),
                        isComputed: false,
                        value: _returnType,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'name',
                        returnType: FieldType(
                          type: 'String',
                        ),
                        isComputed: false,
                        value: _name,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'isComputed',
                        returnType: FieldType(
                          type: 'bool',
                        ),
                        isComputed: false,
                        value: _isComputed,
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
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
              name: 'Value',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'value',
                  returnType: FieldType(
                    type: 'Object',
                  ),
                  isComputed: false,
                  value: _value,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumsValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "EnumsValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Enum<T extends EnumField> extends $Enum<T> {
  Enum(
      {String type,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields})
      : _type = type,
        assert(type != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  factory Enum.load(Iterable<DataLoader> loaders) => Enum(
        type: loaders.firstWhere((l) => l.name == 'type').value as String,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isPrivate:
            loaders.firstWhere((l) => l.name == 'isPrivate').value as bool,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Iterable<TypeParameterDeclaration>,
        fields:
            loaders.firstWhere((l) => l.name == 'fields').value as Iterable<T>,
      );

  final String _type;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  Data<DataValue> _meta$;

  Enum<T> clone(
      {String type,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields}) {
    return Enum(
      type: type ?? _type,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'Enum',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'type',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _type,
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
              name: 'Meta',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isPrivate',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isPrivate,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'generics',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _generics,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'fields',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _fields,
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
  String get type {
    return _type;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), name.hashCode), isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Enum) return false;
    return type == other.type &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Enum (type: $type, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class EnumLoader extends $EnumLoader {
  EnumLoader({String name, Object value})
      : _name = name,
        assert(name != null),
        _value = value,
        assert(value != null);

  factory EnumLoader.load(Iterable<DataLoader> loaders) => EnumLoader(
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final String _name;

  final Object _value;

  Data<DataValue> _meta$;

  EnumLoader clone({String name, Object value}) {
    return EnumLoader(
      name: name ?? _name,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'EnumLoader',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'name',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _name,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'value',
            returnType: FieldType(
              type: 'Object',
            ),
            isComputed: false,
            value: _value,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get name {
    return _name;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumLoader) return false;
    return name == other.name && value == other.value;
  }

  String toString() {
    return "EnumLoader (name: $name, value: $value)";
  }
}

class DataField extends $DataField {
  DataField(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed})
      : _isAbstract = isAbstract,
        assert(isAbstract != null),
        _isDefaulted = isDefaulted,
        assert(isDefaulted != null),
        _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  factory DataField.load(Iterable<DataLoader> loaders) => DataField(
        isAbstract:
            loaders.firstWhere((l) => l.name == 'isAbstract').value as bool,
        isDefaulted:
            loaders.firstWhere((l) => l.name == 'isDefaulted').value as bool,
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
      );

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  Data<DataValue> _meta$;

  DataField clone(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed}) {
    return DataField(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'DataField',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'isAbstract',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isAbstract,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'isDefaulted',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isDefaulted,
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
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
  bool get isAbstract {
    return _isAbstract;
  }

  bool get isDefaulted {
    return _isDefaulted;
  }

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                returnType.hashCode),
            name.hashCode),
        isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataField) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "DataField (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class DataValue extends $DataValue {
  DataValue(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      Object value})
      : _isAbstract = isAbstract,
        assert(isAbstract != null),
        _isDefaulted = isDefaulted,
        assert(isDefaulted != null),
        _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  factory DataValue.load(Iterable<DataLoader> loaders) => DataValue(
        isAbstract:
            loaders.firstWhere((l) => l.name == 'isAbstract').value as bool,
        isDefaulted:
            loaders.firstWhere((l) => l.name == 'isDefaulted').value as bool,
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final bool _isAbstract;

  final bool _isDefaulted;

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  Data<DataValue> _meta$;

  DataValue clone(
      {bool isAbstract,
      bool isDefaulted,
      FieldType returnType,
      String name,
      bool isComputed,
      Object value}) {
    return DataValue(
      isAbstract: isAbstract ?? _isAbstract,
      isDefaulted: isDefaulted ?? _isDefaulted,
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'DataValue',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: false,
              isConst: null,
              name: 'DataField',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'isAbstract',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isAbstract,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isDefaulted',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isDefaulted,
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
                    name: 'Field',
                    isPrivate: null,
                    fields: [
                      DataValue(
                        name: 'returnType',
                        returnType: FieldType(
                          type: 'FieldType',
                        ),
                        isComputed: false,
                        value: _returnType,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'name',
                        returnType: FieldType(
                          type: 'String',
                        ),
                        isComputed: false,
                        value: _name,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'isComputed',
                        returnType: FieldType(
                          type: 'bool',
                        ),
                        isComputed: false,
                        value: _isComputed,
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
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
              name: 'Value',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'value',
                  returnType: FieldType(
                    type: 'Object',
                  ),
                  isComputed: false,
                  value: _value,
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
  bool get isAbstract {
    return _isAbstract;
  }

  bool get isDefaulted {
    return _isDefaulted;
  }

  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isAbstract.hashCode), isDefaulted.hashCode),
                    returnType.hashCode),
                name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataValue) return false;
    return isAbstract == other.isAbstract &&
        isDefaulted == other.isDefaulted &&
        returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "DataValue (isAbstract: $isAbstract, isDefaulted: $isDefaulted, returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Data<T extends $DataField> extends $Data<T> {
  Data(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Data<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _isConst = isConst,
        assert(isConst != null),
        _interfaces = interfaces,
        assert(interfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  factory Data.load(Iterable<DataLoader> loaders) => Data(
        isFinal: loaders.firstWhere((l) => l.name == 'isFinal').value as bool,
        isInterface:
            loaders.firstWhere((l) => l.name == 'isInterface').value as bool,
        isConst: loaders.firstWhere((l) => l.name == 'isConst').value as bool,
        interfaces: loaders.firstWhere((l) => l.name == 'interfaces').value
            as Iterable<MetaInterfaceType<Data<T>>>,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isPrivate:
            loaders.firstWhere((l) => l.name == 'isPrivate').value as bool,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Iterable<TypeParameterDeclaration>,
        fields:
            loaders.firstWhere((l) => l.name == 'fields').value as Iterable<T>,
      );

  Iterable<T> _computedFields;

  Iterable<T> _nonComputedFields;

  Iterable<T> _localNonComputedFields;

  Iterable<T> _nonDefaultedFields;

  Iterable<T> _localNonDefaultedFields;

  Iterable<T> _defaultedFields;

  Iterable<T> _localDefaultedFields;

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterfaceType<Data<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  Data<DataValue> _meta$;

  Data<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Data<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields}) {
    return Data(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'Data',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'isFinal',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isFinal,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'isInterface',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isInterface,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'isConst',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isConst,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'interfaces',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: false,
            value: _interfaces,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'computedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _computedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'nonComputedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _nonComputedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'localNonComputedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _localNonComputedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'nonDefaultedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _nonDefaultedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'localNonDefaultedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _localNonDefaultedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'defaultedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _defaultedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'localDefaultedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _localDefaultedFields,
            isAbstract: false,
            isDefaulted: false,
          )
        ],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Meta',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isPrivate',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isPrivate,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'generics',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _generics,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'fields',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _fields,
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
  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterfaceType<Data<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<T> get localNonComputedFields {
    return _localNonComputedFields ??= super.localNonComputedFields;
  }

  Iterable<T> get nonDefaultedFields {
    return _nonDefaultedFields ??= super.nonDefaultedFields;
  }

  Iterable<T> get localNonDefaultedFields {
    return _localNonDefaultedFields ??= super.localNonDefaultedFields;
  }

  Iterable<T> get defaultedFields {
    return _defaultedFields ??= super.defaultedFields;
  }

  Iterable<T> get localDefaultedFields {
    return _localDefaultedFields ??= super.localDefaultedFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                            isConst.hashCode),
                        interfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Data (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class DataLoader extends $DataLoader {
  DataLoader({String name, Object value})
      : _name = name,
        assert(name != null),
        _value = value,
        assert(value != null);

  factory DataLoader.load(Iterable<DataLoader> loaders) => DataLoader(
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final String _name;

  final Object _value;

  Data<DataValue> _meta$;

  DataLoader clone({String name, Object value}) {
    return DataLoader(
      name: name ?? _name,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'DataLoader',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'name',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _name,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'value',
            returnType: FieldType(
              type: 'Object',
            ),
            isComputed: false,
            value: _value,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get name {
    return _name;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DataLoader) return false;
    return name == other.name && value == other.value;
  }

  String toString() {
    return "DataLoader (name: $name, value: $value)";
  }
}

class MetaInterfaceType<T extends Meta<Field>> extends $MetaInterfaceType<T> {
  MetaInterfaceType({T meta, Iterable<FieldType> generics})
      : _meta = meta,
        assert(meta != null),
        _generics = generics,
        assert(generics != null);

  factory MetaInterfaceType.load(Iterable<DataLoader> loaders) =>
      MetaInterfaceType(
        meta: loaders.firstWhere((l) => l.name == 'meta').value as T,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Iterable<FieldType>,
      );

  final T _meta;

  final Iterable<FieldType> _generics;

  Data<DataValue> _meta$;

  MetaInterfaceType<T> clone({T meta, Iterable<FieldType> generics}) {
    return MetaInterfaceType(
      meta: meta ?? _meta,
      generics: generics ?? _generics,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'MetaInterfaceType',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'meta',
            returnType: FieldType(
              type: 'T',
            ),
            isComputed: false,
            value: _meta,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'generics',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: false,
            value: _generics,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  T get meta {
    return _meta;
  }

  Iterable<FieldType> get generics {
    return _generics;
  }

  int get hashCode {
    return $jf($jc($jc(0, meta.hashCode), generics.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaInterfaceType) return false;
    return meta == other.meta && generics == other.generics;
  }

  String toString() {
    return "MetaInterfaceType (meta: $meta, generics: $generics)";
  }
}

class MetaSeal extends $MetaSeal {
  MetaSeal.data(Data<DataField> data)
      : _data = null,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  MetaSeal.sealed(Sealed<SealedField, DataField> sealed)
      : _data = null,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  MetaSeal.sum(Sum<SumField> sum)
      : _data = null,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  MetaSeal.enumeration(Enum<EnumField> enumeration)
      : _data = null,
        _sealed = null,
        _sum = null,
        _enumeration = null;

  MetaSeal(
      {Data<DataField> data,
      Sealed<SealedField, DataField> sealed,
      Sum<SumField> sum,
      Enum<EnumField> enumeration})
      : _data = data,
        _sealed = sealed,
        _sum = sum,
        _enumeration = enumeration {
    var found = false;
    if (data != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sealed != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (sum != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (enumeration != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final Data<DataField> _data;

  final Sealed<SealedField, DataField> _sealed;

  final Sum<SumField> _sum;

  final Enum<EnumField> _enumeration;

  String get name {
    return when(
      data: (data) => data.name,
      sealed: (sealed) => sealed.name,
      sum: (sum) => sum.name,
      enumeration: (enumeration) => enumeration.name,
    );
  }

  bool get isPrivate {
    return when(
      data: (data) => data.isPrivate,
      sealed: (sealed) => sealed.isPrivate,
      sum: (sum) => sum.isPrivate,
      enumeration: (enumeration) => enumeration.isPrivate,
    );
  }

  Iterable<TypeParameterDeclaration> get generics {
    return when(
      data: (data) => data.generics,
      sealed: (sealed) => sealed.generics,
      sum: (sum) => sum.generics,
      enumeration: (enumeration) => enumeration.generics,
    );
  }

  Iterable<T> get fields {
    return when(
      data: (data) => data.fields,
      sealed: (sealed) => sealed.fields,
      sum: (sum) => sum.fields,
      enumeration: (enumeration) => enumeration.fields,
    );
  }

  Data<DataField> get data {
    if (_data != null) return _data;
    throw Exception('TODO name htis');
  }

  Sealed<SealedField, DataField> get sealed {
    if (_sealed != null) return _sealed;
    throw Exception('TODO name htis');
  }

  Sum<SumField> get sum {
    if (_sum != null) return _sum;
    throw Exception('TODO name htis');
  }

  Enum<EnumField> get enumeration {
    if (_enumeration != null) return _enumeration;
    throw Exception('TODO name htis');
  }

  bool get isData {
    return _data != null;
  }

  bool get isSealed {
    return _sealed != null;
  }

  bool get isSum {
    return _sum != null;
  }

  bool get isEnumeration {
    return _enumeration != null;
  }

  void whenData(void Function(Data<DataField>) handler) {
    if (_data != null) handler(_data);
  }

  void whenSealed(void Function(Sealed<SealedField, DataField>) handler) {
    if (_sealed != null) handler(_sealed);
  }

  void whenSum(void Function(Sum<SumField>) handler) {
    if (_sum != null) handler(_sum);
  }

  void whenEnumeration(void Function(Enum<EnumField>) handler) {
    if (_enumeration != null) handler(_enumeration);
  }

  WHEN when<WHEN>(
      {WHEN Function(Data<DataField>) data,
      WHEN Function(Sealed<SealedField, DataField>) sealed,
      WHEN Function(Sum<SumField>) sum,
      WHEN Function(Enum<EnumField>) enumeration}) {
    if (_data != null) {
      return data(_data);
    }
    if (_sealed != null) {
      return sealed(_sealed);
    }
    if (_sum != null) {
      return sum(_sum);
    }
    if (_enumeration != null) {
      return enumeration(_enumeration);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data<DataField>) data,
      WHENO Function(Sealed<SealedField, DataField>) sealed,
      WHENO Function(Sum<SumField>) sum,
      WHENO Function(Enum<EnumField>) enumeration}) {
    if (_data != null) {
      if (data != null)
        return data(_data);
      else
        return otherwise();
    }
    if (_sealed != null) {
      if (sealed != null)
        return sealed(_sealed);
      else
        return otherwise();
    }
    if (_sum != null) {
      if (sum != null)
        return sum(_sum);
      else
        return otherwise();
    }
    if (_enumeration != null) {
      if (enumeration != null)
        return enumeration(_enumeration);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, _data.hashCode), _sealed.hashCode), _sum.hashCode),
        _enumeration.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MetaSeal) return false;
    return _data == other._data &&
        _sealed == other._sealed &&
        _sum == other._sum &&
        _enumeration == other._enumeration;
  }

  String toString() {
    final value = when(
      data: (data) => 'data $data',
      sealed: (sealed) => 'sealed $sealed',
      sum: (sum) => 'sum $sum',
      enumeration: (enumeration) => 'enumeration $enumeration',
    );
    return 'MetaSeal( $value )';
  }
}

abstract class IMetaSeal {
  void whenData(void Function(Data<DataField>) handler);
  void whenSealed(void Function(Sealed<SealedField, DataField>) handler);
  void whenSum(void Function(Sum<SumField>) handler);
  void whenEnumeration(void Function(Enum<EnumField>) handler);
  WHEN when<WHEN>(
      {WHEN Function(Data<DataField>) data,
      WHEN Function(Sealed<SealedField, DataField>) sealed,
      WHEN Function(Sum<SumField>) sum,
      WHEN Function(Enum<EnumField>) enumeration});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(Data<DataField>) data,
      WHENO Function(Sealed<SealedField, DataField>) sealed,
      WHENO Function(Sum<SumField>) sum,
      WHENO Function(Enum<EnumField>) enumeration});
}

class Generic extends $Generic {
  Generic.declaration(TypeParameterDeclaration declaration)
      : assert(declaration != null),
        _declaration = declaration,
        _parameter = null;

  Generic.parameter(String parameter)
      : _declaration = null,
        assert(parameter != null),
        _parameter = parameter;

  Generic({TypeParameterDeclaration declaration, String parameter})
      : _declaration = declaration,
        _parameter = parameter {
    var found = false;
    if (declaration != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (parameter != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final TypeParameterDeclaration _declaration;

  final String _parameter;

  TypeParameterDeclaration get declaration {
    if (_declaration != null) return _declaration;
    throw Exception('TODO name htis');
  }

  String get parameter {
    if (_parameter != null) return _parameter;
    throw Exception('TODO name htis');
  }

  bool get isDeclaration {
    return _declaration != null;
  }

  bool get isParameter {
    return _parameter != null;
  }

  void whenDeclaration(void Function(TypeParameterDeclaration) handler) {
    if (_declaration != null) handler(_declaration);
  }

  void whenParameter(void Function(String) handler) {
    if (_parameter != null) handler(_parameter);
  }

  WHEN when<WHEN>(
      {WHEN Function(TypeParameterDeclaration) declaration,
      WHEN Function(String) parameter}) {
    if (_declaration != null) {
      return declaration(_declaration);
    }
    if (_parameter != null) {
      return parameter(_parameter);
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(TypeParameterDeclaration) declaration,
      WHENO Function(String) parameter}) {
    if (_declaration != null) {
      if (declaration != null)
        return declaration(_declaration);
      else
        return otherwise();
    }
    if (_parameter != null) {
      if (parameter != null)
        return parameter(_parameter);
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _declaration.hashCode), _parameter.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Generic) return false;
    return _declaration == other._declaration && _parameter == other._parameter;
  }

  String toString() {
    final value = when(
      declaration: (declaration) => 'declaration $declaration',
      parameter: (parameter) => 'parameter $parameter',
    );
    return 'Generic( $value )';
  }
}

abstract class IGeneric {
  void whenDeclaration(void Function(TypeParameterDeclaration) handler);
  void whenParameter(void Function(String) handler);
  WHEN when<WHEN>(
      {WHEN Function(TypeParameterDeclaration) declaration,
      WHEN Function(String) parameter});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(TypeParameterDeclaration) declaration,
      WHENO Function(String) parameter});
}

class TypeParameterDeclaration extends $TypeParameterDeclaration {
  TypeParameterDeclaration(
      {String type, Option<FieldType> extension, String genericsStr})
      : _type = type,
        assert(type != null),
        _extension = extension,
        assert(extension != null),
        _genericsStr = genericsStr,
        assert(genericsStr != null);

  factory TypeParameterDeclaration.load(Iterable<DataLoader> loaders) =>
      TypeParameterDeclaration(
        type: loaders.firstWhere((l) => l.name == 'type').value as String,
        extension: loaders.firstWhere((l) => l.name == 'extension').value
            as Option<FieldType>,
        genericsStr:
            loaders.firstWhere((l) => l.name == 'genericsStr').value as String,
      );

  String _typeParameterStr;

  final String _type;

  final Option<FieldType> _extension;

  final String _genericsStr;

  Data<DataValue> _meta$;

  TypeParameterDeclaration clone(
      {String type, Option<FieldType> extension, String genericsStr}) {
    return TypeParameterDeclaration(
      type: type ?? _type,
      extension: extension ?? _extension,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'TypeParameterDeclaration',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'type',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _type,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'extension',
            returnType: FieldType(
              type: 'Option',
            ),
            isComputed: false,
            value: _extension,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'typeParameterStr',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: true,
            value: _typeParameterStr,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'genericsStr',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _genericsStr,
            isAbstract: false,
            isDefaulted: true,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get type {
    return _type;
  }

  Option<FieldType> get extension {
    return _extension;
  }

  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  String get typeParameterStr {
    return _typeParameterStr ??= super.typeParameterStr;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, type.hashCode), extension.hashCode), genericsStr.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TypeParameterDeclaration) return false;
    return type == other.type &&
        extension == other.extension &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "TypeParameterDeclaration (type: $type, extension: $extension)";
  }
}

class FieldType extends $FieldType {
  FieldType(
      {String type, Option<Iterable<FieldType>> generics, String genericsStr})
      : _type = type,
        assert(type != null),
        _generics = generics,
        assert(generics != null),
        _genericsStr = genericsStr,
        assert(genericsStr != null);

  factory FieldType.load(Iterable<DataLoader> loaders) => FieldType(
        type: loaders.firstWhere((l) => l.name == 'type').value as String,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Option<Iterable<FieldType>>,
        genericsStr:
            loaders.firstWhere((l) => l.name == 'genericsStr').value as String,
      );

  String _typeStr;

  final String _type;

  final Option<Iterable<FieldType>> _generics;

  final String _genericsStr;

  Data<DataValue> _meta$;

  FieldType clone(
      {String type, Option<Iterable<FieldType>> generics, String genericsStr}) {
    return FieldType(
      type: type ?? _type,
      generics: generics ?? _generics,
      genericsStr: genericsStr ?? _genericsStr,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'FieldType',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'type',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _type,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'generics',
            returnType: FieldType(
              type: 'Option',
            ),
            isComputed: false,
            value: _generics,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'typeStr',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: true,
            value: _typeStr,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'genericsStr',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _genericsStr,
            isAbstract: false,
            isDefaulted: true,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get type {
    return _type;
  }

  Option<Iterable<FieldType>> get generics {
    return _generics;
  }

  String get genericsStr {
    return _genericsStr ?? super.genericsStr;
  }

  String get typeStr {
    return _typeStr ??= super.typeStr;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, type.hashCode), generics.hashCode), genericsStr.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FieldType) return false;
    return type == other.type &&
        generics == other.generics &&
        genericsStr == other.genericsStr;
  }

  String toString() {
    return "FieldType (type: $type, generics: $generics)";
  }
}

class Option<T> extends $Option<T> {
  Option.some(T some)
      : assert(some != null),
        _some = some,
        _none = null;

  Option.none()
      : _some = null,
        _none = true;

  Option({T some, bool none})
      : _some = some,
        _none = none {
    var found = false;
    if (some != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    if (none != null) {
      if (found) throw Exception("todo");
      found = true;
    }
    throw Exception("TODO");
  }

  final T _some;

  final bool _none;

  T get some {
    if (_some != null) return _some;
    throw Exception('TODO name htis');
  }

  void get none {
    if (_none != null) return;
    throw Exception('TODO name htis');
  }

  bool get isSome {
    return _some != null;
  }

  bool get isNone {
    return _none != null;
  }

  void whenSome(void Function(T) handler) {
    if (_some != null) handler(_some);
  }

  void whenNone(void Function() handler) {
    if (_none != null) handler();
  }

  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none}) {
    if (_some != null) {
      return some(_some);
    }
    if (_none != null) {
      return none();
    }
    throw FallThroughError();
  }

  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none}) {
    if (_some != null) {
      if (some != null)
        return some(_some);
      else
        return otherwise();
    }
    if (_none != null) {
      if (none != null)
        return none();
      else
        return otherwise();
    }
    return otherwise();
  }

  int get hashCode {
    return $jf($jc($jc(0, _some.hashCode), _none.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Option) return false;
    return _some == other._some && _none == other._none;
  }

  String toString() {
    final value = when(
      some: (some) => 'some $some',
      none: () => 'none',
    );
    return 'Option( $value )';
  }
}

abstract class IOption<T> {
  void whenSome(void Function(T) handler);
  void whenNone(void Function() handler);
  WHEN when<WHEN>({WHEN Function(T) some, WHEN Function() none});
  WHENO wheno<WHENO>(
      {WHENO Function() otherwise,
      WHENO Function(T) some,
      WHENO Function() none});
}

class SumField extends $SumField {
  SumField({FieldType returnType, String name, bool isComputed})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null);

  factory SumField.load(Iterable<DataLoader> loaders) => SumField(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  Data<DataValue> _meta$;

  SumField clone({FieldType returnType, String name, bool isComputed}) {
    return SumField(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SumField',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc(0, returnType.hashCode), name.hashCode), isComputed.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumField) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed;
  }

  String toString() {
    return "SumField (returnType: $returnType, name: $name, isComputed: $isComputed)";
  }
}

class SumValue extends $SumValue {
  SumValue({FieldType returnType, String name, bool isComputed, Object value})
      : _returnType = returnType,
        assert(returnType != null),
        _name = name,
        assert(name != null),
        _isComputed = isComputed,
        assert(isComputed != null),
        _value = value,
        assert(value != null);

  factory SumValue.load(Iterable<DataLoader> loaders) => SumValue(
        returnType: loaders.firstWhere((l) => l.name == 'returnType').value
            as FieldType,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isComputed:
            loaders.firstWhere((l) => l.name == 'isComputed').value as bool,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final FieldType _returnType;

  final String _name;

  final bool _isComputed;

  final Object _value;

  Data<DataValue> _meta$;

  SumValue clone(
      {FieldType returnType, String name, bool isComputed, Object value}) {
    return SumValue(
      returnType: returnType ?? _returnType,
      name: name ?? _name,
      isComputed: isComputed ?? _isComputed,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SumValue',
        isPrivate: null,
        fields: [],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: false,
              isConst: null,
              name: 'SumField',
              isPrivate: null,
              fields: [],
              interfaces: [
                MetaInterfaceType<Data<DataValue>>(
                  meta: Data<DataValue>(
                    isFinal: false,
                    isInterface: true,
                    isConst: null,
                    name: 'Field',
                    isPrivate: null,
                    fields: [
                      DataValue(
                        name: 'returnType',
                        returnType: FieldType(
                          type: 'FieldType',
                        ),
                        isComputed: false,
                        value: _returnType,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'name',
                        returnType: FieldType(
                          type: 'String',
                        ),
                        isComputed: false,
                        value: _name,
                        isAbstract: true,
                        isDefaulted: false,
                      ),
                      DataValue(
                        name: 'isComputed',
                        returnType: FieldType(
                          type: 'bool',
                        ),
                        isComputed: false,
                        value: _isComputed,
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
              name: 'Field',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'returnType',
                  returnType: FieldType(
                    type: 'FieldType',
                  ),
                  isComputed: false,
                  value: _returnType,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isComputed',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isComputed,
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
              name: 'Value',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'value',
                  returnType: FieldType(
                    type: 'Object',
                  ),
                  isComputed: false,
                  value: _value,
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
  FieldType get returnType {
    return _returnType;
  }

  String get name {
    return _name;
  }

  bool get isComputed {
    return _isComputed;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, returnType.hashCode), name.hashCode),
            isComputed.hashCode),
        value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumValue) return false;
    return returnType == other.returnType &&
        name == other.name &&
        isComputed == other.isComputed &&
        value == other.value;
  }

  String toString() {
    return "SumValue (returnType: $returnType, name: $name, isComputed: $isComputed, value: $value)";
  }
}

class Sum<T extends SumField> extends $Sum<T> {
  Sum(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Sum<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields})
      : _isFinal = isFinal,
        assert(isFinal != null),
        _isInterface = isInterface,
        assert(isInterface != null),
        _isConst = isConst,
        assert(isConst != null),
        _interfaces = interfaces,
        assert(interfaces != null),
        _name = name,
        assert(name != null),
        _isPrivate = isPrivate,
        assert(isPrivate != null),
        _generics = generics,
        assert(generics != null),
        _fields = fields,
        assert(fields != null);

  factory Sum.load(Iterable<DataLoader> loaders) => Sum(
        isFinal: loaders.firstWhere((l) => l.name == 'isFinal').value as bool,
        isInterface:
            loaders.firstWhere((l) => l.name == 'isInterface').value as bool,
        isConst: loaders.firstWhere((l) => l.name == 'isConst').value as bool,
        interfaces: loaders.firstWhere((l) => l.name == 'interfaces').value
            as Iterable<MetaInterfaceType<Sum<T>>>,
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        isPrivate:
            loaders.firstWhere((l) => l.name == 'isPrivate').value as bool,
        generics: loaders.firstWhere((l) => l.name == 'generics').value
            as Iterable<TypeParameterDeclaration>,
        fields:
            loaders.firstWhere((l) => l.name == 'fields').value as Iterable<T>,
      );

  Iterable<T> _computedFields;

  Iterable<T> _nonComputedFields;

  Iterable<T> _localNonComputedFields;

  final bool _isFinal;

  final bool _isInterface;

  final bool _isConst;

  final Iterable<MetaInterfaceType<Sum<T>>> _interfaces;

  final String _name;

  final bool _isPrivate;

  final Iterable<TypeParameterDeclaration> _generics;

  final Iterable<T> _fields;

  Data<DataValue> _meta$;

  Sum<T> clone(
      {bool isFinal,
      bool isInterface,
      bool isConst,
      Iterable<MetaInterfaceType<Sum<T>>> interfaces,
      String name,
      bool isPrivate,
      Iterable<TypeParameterDeclaration> generics,
      Iterable<T> fields}) {
    return Sum(
      isFinal: isFinal ?? _isFinal,
      isInterface: isInterface ?? _isInterface,
      isConst: isConst ?? _isConst,
      interfaces: interfaces ?? _interfaces,
      name: name ?? _name,
      isPrivate: isPrivate ?? _isPrivate,
      generics: generics ?? _generics,
      fields: fields ?? _fields,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'Sum',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'isFinal',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isFinal,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'isInterface',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isInterface,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'isConst',
            returnType: FieldType(
              type: 'bool',
            ),
            isComputed: false,
            value: _isConst,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'interfaces',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: false,
            value: _interfaces,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'computedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _computedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'nonComputedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _nonComputedFields,
            isAbstract: false,
            isDefaulted: false,
          ),
          DataValue(
            name: 'localNonComputedFields',
            returnType: FieldType(
              type: 'Iterable',
            ),
            isComputed: true,
            value: _localNonComputedFields,
            isAbstract: false,
            isDefaulted: false,
          )
        ],
        interfaces: [
          MetaInterfaceType<Data<DataValue>>(
            meta: Data<DataValue>(
              isFinal: false,
              isInterface: true,
              isConst: null,
              name: 'Meta',
              isPrivate: null,
              fields: [
                DataValue(
                  name: 'name',
                  returnType: FieldType(
                    type: 'String',
                  ),
                  isComputed: false,
                  value: _name,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'isPrivate',
                  returnType: FieldType(
                    type: 'bool',
                  ),
                  isComputed: false,
                  value: _isPrivate,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'generics',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _generics,
                  isAbstract: true,
                  isDefaulted: false,
                ),
                DataValue(
                  name: 'fields',
                  returnType: FieldType(
                    type: 'Iterable',
                  ),
                  isComputed: false,
                  value: _fields,
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
  bool get isFinal {
    return _isFinal;
  }

  bool get isInterface {
    return _isInterface;
  }

  bool get isConst {
    return _isConst;
  }

  Iterable<MetaInterfaceType<Sum<T>>> get interfaces {
    return _interfaces;
  }

  String get name {
    return _name;
  }

  bool get isPrivate {
    return _isPrivate;
  }

  Iterable<TypeParameterDeclaration> get generics {
    return _generics;
  }

  Iterable<T> get fields {
    return _fields;
  }

  Iterable<T> get computedFields {
    return _computedFields ??= super.computedFields;
  }

  Iterable<T> get nonComputedFields {
    return _nonComputedFields ??= super.nonComputedFields;
  }

  Iterable<T> get localNonComputedFields {
    return _localNonComputedFields ??= super.localNonComputedFields;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isFinal.hashCode), isInterface.hashCode),
                            isConst.hashCode),
                        interfaces.hashCode),
                    name.hashCode),
                isPrivate.hashCode),
            generics.hashCode),
        fields.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Sum) return false;
    return isFinal == other.isFinal &&
        isInterface == other.isInterface &&
        isConst == other.isConst &&
        interfaces == other.interfaces &&
        name == other.name &&
        isPrivate == other.isPrivate &&
        generics == other.generics &&
        fields == other.fields;
  }

  String toString() {
    return "Sum (isFinal: $isFinal, isInterface: $isInterface, isConst: $isConst, interfaces: $interfaces, name: $name, isPrivate: $isPrivate, generics: $generics, fields: $fields)";
  }
}

class SumLoader extends $SumLoader {
  SumLoader({String name, Object value})
      : _name = name,
        assert(name != null),
        _value = value,
        assert(value != null);

  factory SumLoader.load(Iterable<DataLoader> loaders) => SumLoader(
        name: loaders.firstWhere((l) => l.name == 'name').value as String,
        value: loaders.firstWhere((l) => l.name == 'value').value as Object,
      );

  final String _name;

  final Object _value;

  Data<DataValue> _meta$;

  SumLoader clone({String name, Object value}) {
    return SumLoader(
      name: name ?? _name,
      value: value ?? _value,
    );
  }

  Data<DataValue> get meta$ => _meta$ ??= Data<DataValue>(
        isFinal: false,
        isInterface: false,
        isConst: null,
        name: 'SumLoader',
        isPrivate: null,
        fields: [
          DataValue(
            name: 'name',
            returnType: FieldType(
              type: 'String',
            ),
            isComputed: false,
            value: _name,
            isAbstract: true,
            isDefaulted: false,
          ),
          DataValue(
            name: 'value',
            returnType: FieldType(
              type: 'Object',
            ),
            isComputed: false,
            value: _value,
            isAbstract: true,
            isDefaulted: false,
          )
        ],
        interfaces: [],
        generics: [],
      );
  String get name {
    return _name;
  }

  Object get value {
    return _value;
  }

  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), value.hashCode));
  }

  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SumLoader) return false;
    return name == other.name && value == other.value;
  }

  String toString() {
    return "SumLoader (name: $name, value: $value)";
  }
}
