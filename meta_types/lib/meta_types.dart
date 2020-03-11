library meta_types;

import 'meta_types.dart';
import 'core.dart';

export 'package:meta/meta.dart' show required;
export 'package:built_value/serializer.dart'
    show
        StructuredSerializer,
        PrimitiveSerializer,
        FullType,
        Serializers,
        SerializerPlugin;
export 'package:built_value/standard_json_plugin.dart';// show StandardJsonPlugin;

part 'src/meta_types/annotations.dart';
part 'src/meta_types/data_class.dart';
part 'src/meta_types/enum_class.dart';
part 'src/meta_types/meta_class.dart';
part 'src/meta_types/sealed_class.dart';
part 'src/meta_types/sum.dart';

part 'meta_types.g.dart';
