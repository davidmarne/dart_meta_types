import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generator.dart';

Builder metaTypesFirebase(BuilderOptions options) =>
    SharedPartBuilder([MetaTypesFirebaseGenerator()], 'meta_types_firebase');
