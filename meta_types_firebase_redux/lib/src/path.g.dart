// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// MetaTypesGenerator
// **************************************************************************

abstract class _PathBase extends DataClass {
  String get route;
  Map<String, String> get vars;
  @computed
  String get path =>
      vars.keys.fold(route, (p, k) => p.replaceFirst(k, vars[k]));
  @override
  Iterable<ComputedField> get computedFields =>
      [new ComputedField<String>("path")];

  @override
  Iterable<DataClassField> get nonDefaultedFields => [
        new DataClassField<String>("route"),
        new DataClassField<Map<String, String>>("vars")
      ];

  @override
  Iterable<DataClassField> get defaultedFields => [];

  Iterable<DataClassField> _fields;
  @override
  Iterable<DataClassField> get fields =>
      _fields ??= []..addAll(nonDefaultedFields)..addAll(defaultedFields);
}

class Path extends _PathBase {
  final String _route;
  final Map<String, String> _vars;
  String _path;

  Path({
    @required String route,
    @required Map<String, String> vars,
  })  : _route = route,
        _vars = vars,
        super() {
    assert(this.route != null, "null value provided for field route");
    assert(this.vars != null, "null value provided for field vars");
  }

  Path clone({
    String route,
    Map<String, String> vars,
  }) =>
      new Path(
        route: route ?? _route,
        vars: vars ?? _vars,
      );

  @override
  String get route => _route;
  @override
  Map<String, String> get vars => _vars;
  @override
  String get path => _path ??= super.path;

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Path) return false;
    return route == other.route && vars == other.vars;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, route.hashCode), vars.hashCode));
  }
}
