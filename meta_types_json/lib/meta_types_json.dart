import 'package:meta_types/meta_types.dart';

class MetaJson extends MetaTypeMixin {
  const MetaJson();
}

abstract class ToJson {
  dynamic toJson();
}

final $toJson = toJson;
dynamic toJson(dynamic value) {
  if (value is ToJson) return value.toJson();
  if (value is DateTime) return value.toIso8601String();
  if (value is Iterable)
    return new List<dynamic>.unmodifiable(value.map<dynamic>(toJson));
  if (value is Map) {
    var newmap = <dynamic, dynamic>{};
    for (dynamic k in value.keys) newmap[k] = toJson(value[k]);
    return new Map<dynamic, dynamic>.unmodifiable(newmap);
  }
  return value;
}
