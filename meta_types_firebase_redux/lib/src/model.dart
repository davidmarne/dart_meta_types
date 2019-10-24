import 'package:meta_types/meta_types.dart';

part 'model.g.dart';

@SealedClass()
abstract class $Resolution<T extends Doc> {
  Null get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  Null get denied;
  Null get unknown;
}

@DataClass(isInterface: true)
abstract class Doc {
  String get uid;
  Path get path;
}
