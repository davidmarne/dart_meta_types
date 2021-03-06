import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generator.dart';

Builder metaTypes(BuilderOptions options) =>
    new SharedPartBuilder([new MetaTypesGenerator()], 'meta_types');
