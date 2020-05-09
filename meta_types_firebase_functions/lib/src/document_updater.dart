import 'package:meta/meta.dart';
import 'package:firebase_functions_interop/firebase_functions_interop.dart';
import 'package:meta_types_firebase/meta_types_firebase.dart' as mtf;
import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';

class FunctionsTimestampSerializer
    extends PrimitiveSerializer<FunctionsTimestamp> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([Timestamp]);
  @override
  final String wireName = 'Timestamp';

  @override
  Object serialize(Serializers serializers, FunctionsTimestamp timestamp,
      {FullType specifiedType = FullType.unspecified}) {
    return timestamp._internal;
  }

  @override
  FunctionsTimestamp deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return FunctionsTimestamp.from(serialized as Timestamp);
  }
}

class FunctionsTimestamp extends mtf.Timestamp {
  final Timestamp _internal;

  FunctionsTimestamp.from(this._internal);

  @override
  int get seconds => _internal.seconds;
  @override
  int get nanoseconds => _internal.nanoseconds;
  @override
  int get millisecondsSinceEpoch => _internal.millisecondsSinceEpoch;
  @override
  int get microsecondsSinceEpoch => _internal.microsecondsSinceEpoch;
  @override
  DateTime toDateTime() => _internal.toDateTime();
}

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
    setter(key, Firestore.fieldValues.delete());
  }
}

class ListUpdater<T> {
  void Function(FieldValue) setter;

  ListUpdater(this.setter);

  void arrayRemove(List<T> elements) => setter(
        Firestore.fieldValues.arrayRemove(elements),
      );

  void arrayUnion(List<T> elements) => setter(
        Firestore.fieldValues.arrayUnion(elements),
      );
}

class NumberUpdater<T extends num> {
  void Function(FieldValue) setter;

  NumberUpdater(this.setter);

  void increment(T i) =>
      throw Exception('Increment is not accessible in functions');
}

class TimestampUpdater {
  void Function(FieldValue) setter;

  TimestampUpdater(this.setter);

  void serverTimestamp() => setter(
        Firestore.fieldValues.serverTimestamp(),
      );
}
