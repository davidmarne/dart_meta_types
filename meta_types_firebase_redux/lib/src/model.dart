import 'package:meta_types/meta_types.dart';

import 'path.dart';

part 'model.g.dart';

@SumClass()
abstract class $Resolution<T extends Doc> {
  void get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  void get denied;
  void get unknown;
}

@DataClass(isInterface: true)
abstract class Doc {
  String get uid;
  Path get path;
}
