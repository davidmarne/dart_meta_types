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

abstract class DocumentUpdater<D> {
  final Map<String, dynamic> _update = {};

  void Function(String key, dynamic value) _setter;

  DocumentUpdater() {
    _setter = (key, value) => _update[key] = value;
  }

  DocumentUpdater.nested(String fieldName) {
    _setter = (key, value) => update['$fieldName.$key'] = value;
  }

  Map<String, dynamic> get update => _update;

  @protected
  NumberUpdater<T> $numberUpdater<T extends num>(String field) =>
      NumberUpdater((ft) => _setter(field, ft));

  @protected
  ListUpdater<T> $listUpdater<T>(String field) =>
      ListUpdater((ft) => _setter(field, ft));

  @protected
  MapUpdater<T> $mapUpdater<T>(String field) =>
      MapUpdater((key, value) => _setter('$field.$key', value));

  @protected
  TimestampUpdater $timestampUpdater(String field) =>
      TimestampUpdater((ft) => _setter(field, ft));
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
