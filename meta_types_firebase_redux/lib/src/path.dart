import 'package:meta_types/meta_types.dart';

part 'path.g.dart';

@DataClass()
abstract class $Path {
  String get route;
  Map<String, String> get vars;

  @computed
  String get path => vars.keys.fold(
        route,
        (p, k) => p.replaceFirst(k, vars[k]),
      );
}
