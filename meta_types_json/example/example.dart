import 'package:meta_types/meta_types.dart';
import 'package:meta_types_json/meta_types_json.dart';

part 'example.g.dart';

@MetaJson()
@EnumClass(int)
abstract class $MyEnum {
  static int a;
  static int b;
}

@MetaJson()
@SealedClass()
abstract class $MySealedClass {
  String get string;
  int get integer;
}

@MetaJson()
@DataClass()
abstract class $MyDataClass {
  int get value => 0;
  $NestedObject get nested;
  List<int> get list;
  Set<int> get st;
  Map<String, int> get map;
  List<$NestedObject> get listNested;
  Set<$NestedObject> get setNested;
  Map<String, $NestedObject> get mapNested;
  $MyEnum get enumValue;
  $MySealedClass get sealed;
}

@MetaJson()
@DataClass()
abstract class $NestedObject {
  int get value => 0;
}

void main() {
  final myObj = MyDataClass(
    value: 2,
    nested: NestedObject(value: 99),
    list: [5],
    st: [22222].toSet(),
    map: {'sdf': 4},
    listNested: [NestedObject(value: 34)],
    setNested: [NestedObject(value: 4)].toSet(),
    mapNested: {'sdf': NestedObject(value: 4)},
    sealed: MySealedClass.integerFactory(2),
    enumValue: MyEnum.a,
  );

  print('original');
  print(myObj.value);
  print(myObj.nested.value);
  print(myObj.list);
  print(myObj.st);
  print(myObj.map);
  print(myObj.listNested);
  print(myObj.setNested);
  print(myObj.mapNested);
  print(myObj.sealed);
  print(myObj.enumValue);

  final dynamic json = myObj.toJson();
  print('serialized');
  print(json);

  final deserialized =
      MyDataClassMetaJson.fromJson(json as Map<String, dynamic>);

  print('deserialized');
  print(deserialized.value);
  print(deserialized.nested.value);
  print(deserialized.list);
  print(deserialized.st);
  print(deserialized.map);
  print(deserialized.listNested);
  print(deserialized.setNested);
  print(deserialized.mapNested);
  print(deserialized.sealed);
  print(deserialized.enumValue);
}
