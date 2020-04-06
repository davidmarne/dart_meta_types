import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';

class TimestampSerializer extends PrimitiveSerializer<Timestamp> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([Timestamp]);
  @override
  final String wireName = 'Timestamp';

  @override
  Object serialize(Serializers serializers, Timestamp timestamp,
      {FullType specifiedType = FullType.unspecified}) {
    return timestamp;
  }

  @override
  Timestamp deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return serialized;
  }
}

// abstract class DocumentUpdater<D> {
//   final String _fieldPrefix;

//   final Map<String, dynamic> _update;

//   DocumentUpdater()
//       : _fieldPrefix = '',
//         _update = {};

//   DocumentUpdater.nested(
//     String fieldName,
//     DocumentUpdater parent,
//   )   : _fieldPrefix = '${parent._fieldPrefix}$fieldName.',
//         _update = parent._update {
//     parent[parent._fieldPrefix] = _update;
//   }

//   String _formatKey(String key) => '$_fieldPrefix$key';

//   @protected
//   void write(String key, dynamic value) {
//     _update[_formatKey(key)] = value;
//   }

//   @protected
//   dynamic read(String key) {
//     return _update[_formatKey(key)];
//   }

//   @protected
//   void clear() => _update.removeWhere(
//         (k, v) => k.startsWith(_fieldPrefix),
//       );

//   @protected
//   Map<String, dynamic> get update {
//     if (_fieldPrefix.isEmpty) print('DAVE update is $_update');
//     return _fieldPrefix.isEmpty
//         ? _update
//         : throw StateError('invalid update call on nested updated');
//   }
abstract class DocumentUpdater<D> {
  final Map<String, dynamic> _update = {};

  DocumentUpdater();

  DocumentUpdater.nested(
    String fieldName,
    DocumentUpdater parent,
  ) {
    parent._update[fieldName] = _update;
  }

  @protected
  void write(String key, dynamic value) {
    _update[key] = value;
  }

  @protected
  dynamic read(String key) {
    return _update[key];
  }

  @protected
  void clear() => _update.clear();

  @protected
  Map<String, dynamic> get update {
    return _update;
  }

  @protected
  NumberUpdater<T> $numberUpdater<T extends num>(String field) =>
      NumberUpdater((ft) => write(field, ft));

  @protected
  ListUpdater<T> $listUpdater<T>(String field) =>
      ListUpdater((ft) => write(field, ft));

  @protected
  MapUpdater<T> $mapUpdater<T>(String field) =>
      MapUpdater((key, value) => write('$field.$key', value));

  @protected
  TimestampUpdater $timestampUpdater(String field) =>
      TimestampUpdater((ft) => write(field, ft));
}

class MapUpdater<T> {
  void Function(String key, dynamic value) setter;

  MapUpdater(this.setter);

  void operator []=(String key, T value) {
    setter(key, value);
  }

  void delete(String key) {
    setter(key, FieldValue.delete());
  }
}

class ListUpdater<T> {
  void Function(FieldValue) setter;

  ListUpdater(this.setter);

  void arrayRemove(List<T> elements) => setter(
        FieldValue.arrayRemove(elements),
      );

  void arrayUnion(List<T> elements) => setter(
        FieldValue.arrayUnion(elements),
      );
}

class NumberUpdater<T extends num> {
  void Function(FieldValue) setter;

  NumberUpdater(this.setter);

  void increment(T i) => setter(
        FieldValue.increment(i),
      );
}

class TimestampUpdater {
  void Function(FieldValue) setter;

  TimestampUpdater(this.setter);

  void serverTimestamp() => setter(
        FieldValue.serverTimestamp(),
      );
}
