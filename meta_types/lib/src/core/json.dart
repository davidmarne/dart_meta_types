part of core;

@sum
abstract class $Json {
  Map<String, Json> get object;
  List<Json> get array;
  String get string;
  num get number;
  bool get boolean;
  Null get nil;
}

Json parseJson(dynamic json) {
  if (json is Map) {
    final jsonMap = <String, Json>{};
    for (final entry in json.entries) {
      assert(entry.key is String, 'keys must be strings');
      jsonMap[entry.key as String] = parseJson(entry.value);
    }
    return Json.object(jsonMap);
  }
  if (json is Iterable) {
    return Json.array(json.map(parseJson).toList());
  }
  if (json is String) {
    return Json.string(json);
  }
  if (json is num) {
    return Json.number(json);
  }
  if (json is bool) {
    return Json.boolean(json);
  }
  if (json == null) {
    return Json.nil(null);
  }

  throw FallThroughError();
}

Json parseJsonString(
  String json, {
  Object Function(Object key, Object value) reviver,
}) =>
    parseJson(
      jsonDecode(
        json,
        reviver: reviver,
      ),
    );
