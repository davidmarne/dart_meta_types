import 'package:meta_types/meta_types.dart';
import 'package:built_collection/built_collection.dart';

// part 'meta_types_firebase.g.dart';

const _id = 'id\$\$\$';
const _path = 'path\$\$\$';

abstract class MetaTypesFirebaseSerializerPlugin {
  Object beforeSerialize(Object object, FullType specifiedType) => object;

  Object afterSerialize(Object object, FullType specifiedType) {
    if (object is Map &&
        specifiedType.root != BuiltMap &&
        specifiedType.root != BuiltSet &&
        specifiedType.parameters.first.root == String) {
      object.remove(_id);
      object.remove(_path);
    }
    return object;
  }

  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is Map &&
        specifiedType.root != BuiltMap &&
        specifiedType.root != BuiltSet &&
        specifiedType.parameters.first.root == String) {
      object[_id] = -1;
      object[_path] = '';
    }
    return object;
  }

  Object afterDeserialize(Object object, FullType specifiedType) {
    if (object is Path) {
      // return doc.copyPath(path: ref.path, id: ref.id);
    }
    return object;
  }
}

@DataClass(isInterface: true)
abstract class Path {
  @SerializableField(wireName: _path)
  String get path;

  @SerializableField(wireName: _id)
  String get id;
}
