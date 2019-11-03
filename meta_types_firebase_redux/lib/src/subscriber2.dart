import 'dart:async';
import 'package:meta/meta.dart';
import 'package:meta_types/meta_types.dart';
import 'package:firebase/firestore.dart';

part 'subscriber2.g.dart';

const creating = "creating";

@SumClass()
abstract class Resolution<T extends Doc> {
  void get fetching;
  T get creating;
  T get dirty;
  T get resolved;
  void get denied;
  void get unknown;
}

@DataClass(isInterface: true)
abstract class Doc {
  String get id;
  String get path;
}

@DataClass()
abstract class Subscription<T extends Doc> {
  Resolution<T> get initialValue;
  int get id;
}

class _FirebaseClient {
  Subscription<T> checkout<T extends Doc>(
      String path, T Function(Object json)) {}
  Resolution<T> read<T extends Doc>(Subscription<T> subscription) {}
  void checkin(int subscription) {}
  void create<T extends Doc>(T data) {}
  void update<T extends Doc>(T data) {}
  void delete<T extends Doc>(T data) {}
}

Resolution<T> useFirebaseDoc<T extends Doc>(String path) {
  return useFirebaseDocs<T>([path])[path];
}
Map<String, Resolution<T>> useFirebaseDocs<T extends Doc>(Iterable<String> paths) {
  return Hook.use(_FirebaseHook(paths: paths));
}

class _FirebaseHook<T extends Doc> extends Hook<ValueNotifier<T>> {
  final Iterable<T> paths;

  const _FirebaseHook({this.paths});

  @override
  _FirebaseHookState<T> createState() => _FirebaseHookState();
}

class _FirebaseHookState<T extends Doc>
    extends HookState<T, _FirebaseHook<T>> {
  Map<String, Resolution<T>> _state;
  Map<String, Subscription<T>> _subs;

  @override
  void initHook() {
    super.initHook();
    _state = {};
  }

  @override
  void dispose() {
    _state.dispose();
  }

  @override
  build(BuildContext context) {
    return _sValueNotifier<T>tate;
  }

  void _listener() {
    setState(() {});
  }
}
