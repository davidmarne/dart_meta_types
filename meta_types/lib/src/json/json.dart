part of meta_types;

// @SealedClass()
// abstract class $Json {
//   int get integer;
//   String get string;
//   bool get boolean;
//   double get float;
//   List<Json> get list;
//   Map<String, Json> get map;
// }

// Map<String, dynamic> dataToJson(DataClass data) {
//   final m = <String, dynamic>{};
//   for (DataLoader loader in data.meta$) {
//     m[loader.name] = toJson(loader.value);
//   }
// }

// dynamic toJson(dynamic obj) {
//   if (obj is DataClass) {
//     return dataToJson(obj);
//   }
//   if (obj is SealedClass) {
//     return dataToJson(obj);
//   }
//   if (obj is SumClass) {
//     return dataToJson(obj);
//   }
//   if (obj is EnumClass) {
//     return dataToJson(obj);
//   }
//   if (obj is Iterable) {
//     return dataToJson(obj);
//   }
//   if (obj is Map) {
//     return dataToJson(obj);
//   }
//   if (obj is DateTime) {
//     return dataToJson(obj);
//   }
//   return obj;
// }

// Iterable<DataLoader> jsonToDataLoader(Map<String, dynamic> json) => json.entries.map((e) => DataLoader(
//   name: e.key,
//   value: jsonTo(e.value),
// ));

// Object jsonTo(dynamic json) {
//   if (json is )
// }
