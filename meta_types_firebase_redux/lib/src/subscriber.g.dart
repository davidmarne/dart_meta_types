// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

abstract class _SubscriptionRequestBase<T extends Doc> extends DataClass {
  Path get path;
  @override
  Iterable<ComputedField> get computedFields => [];

  @override
  Iterable<DataClassField> get nonDefaultedFields =>
      [new DataClassField<Path>("path")];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class SubscriptionRequest<T> extends _SubscriptionRequestBase<T> {
  final Path _path;

  SubscriptionRequest({
    @required Path path,
  })  : _path = path,
        super() {
    assert(this.path != null, "null value provided for field path");
  }

  SubscriptionRequest clone({
    Path path,
  }) =>
      new SubscriptionRequest<T>(
        path: path ?? _path,
      );

  @override
  Path get path => _path;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SubscriptionRequest) return false;
    return path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }
}
