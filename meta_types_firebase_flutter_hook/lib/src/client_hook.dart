import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:built_value/serializer.dart' show StructuredSerializer;

import 'client.dart';

FirebaseClient useFirebaseClient() {
  return Hook.use(_FirebaseClientHook());
}

class _FirebaseClientHook extends Hook<FirebaseClient> {
  final Iterable<Reference> refs;
  final StructuredSerializer serializer;

  const _FirebaseClientHook({this.refs, this.serializer});

  @override
  _FirebaseClientHookState createState() => _FirebaseClientHookState();
}

class _FirebaseClientHookState
    extends HookState<FirebaseClient, _FirebaseClientHook> {
  @override
  build(BuildContext context) {
    return null; // TODO from context
  }
}
