import 'package:meta_types/meta_types.dart';

part 'pager.g.dart';

@DataClass()
abstract class Pager {
  String get nextStartKey;
  bool get itemsRemain;
  bool get fetching;
}
