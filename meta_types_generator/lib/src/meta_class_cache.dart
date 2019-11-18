import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';

import 'package:meta_types/meta_types_models.dart';
import 'data_class.dart';
import 'sum_class.dart';
import 'enum_class.dart';
import 'sealed_class.dart';
// import 'option.dart';

class MetaClassCache {
  final _cache = <String, MetaSeal>{};
  final Set<LibraryElement> _libraries = {};
  final LibraryReader _library;

  MetaClassCache(this._library) {
    _initReaders(_library.element);
  }

  // name should be MetaClassReference?
  Option<MetaSeal> find(String name) {
    if (_cache.containsKey(name)) {
      return Option.some(_cache[name]);
    }

    if (!_classElementLookup.containsKey(name)) {
      return Option.none();
    }

    final metaClass = _toMetaClass(_classElementLookup[name]);
    metaClass.whenSome((v) {
      _cache[name] = v;
    });

    return metaClass;
  }

  Map<String, ClassElement> __classElementLookup;
  Map<String, ClassElement> get _classElementLookup => __classElementLookup ??=
      Map.fromIterable(_classes, key: (dynamic e) => (e as ClassElement).name);

  void _initReaders(LibraryElement library) {
    if (library == null) return;
    if (_libraries.contains(library)) return;
    _libraries.add(library);
    library.imports.forEach((e) => _initReaders(e.importedLibrary));
    library.exports.forEach((e) => _initReaders(e.exportedLibrary));
  }

  Iterable<ClassElement> get _classes =>
      _libraries.map((l) => LibraryReader(l)).expand((r) => r.classes);

  Option<DartObject> _toMetaAnnotation(ClassElement e) {
    final anno = e.metadata
        .map(
          (a) => a.computeConstantValue(),
        )
        .singleWhere(
          (w) => const [
            'DataClass',
            'SealedClass',
            'SumClass',
            'EnumClass',
          ].contains(w.type.name),
          orElse: () => null,
        );

    return anno == null ? Option.none() : Option.some(anno);
  }

  Option<MetaSeal> _toMetaClass(ClassElement e) => _toMetaAnnotation(e).map(
        (annotation) {
          switch (annotation.type.name) {
            case 'DataClass':
              return MetaSeal.data(
                dataFromClassElement(e, annotation, this),
              );
            case 'SealedClass':
              return MetaSeal.sealed(
                sealedFromClassElement(e, annotation, this),
              );
            case 'SumClass':
              return MetaSeal.sum(
                sumFromClassElement(e, annotation, this),
              );
            case 'EnumClass':
              return MetaSeal.enumeration(
                enumFromClassElement(e, annotation, this),
              );
            default:
              throw FallThroughError();
          }
        },
      );
}
