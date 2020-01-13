import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta_types/meta_types_models.dart';
import 'package:meta_types/meta_types.dart';

Method methodElementToMethod(MethodElement e) => Method(
      name: e.name,
      typeParameters: resolveTypeParameterDeclaration(e.typeParameters),
      returnType:
          FieldType(type: e.returnType.toString(), generics: Option.none()),
      inputs: e.parameters.map(
        (p) => MethodParameter(
          name: p.name,
          type: FieldType(type: p.type.toString(), generics: Option.none()),
        ),
      ),
    );

Option<SerializableField> getSerializableField(
    List<ElementAnnotation> metadata) {
  final annos = metadata
      .map((meta) => meta.computeConstantValue())
      .where(
        (meta) => meta.type.name == 'SerializableField',
      )
      .map((meta) => meta.getField('ommit').toBoolValue()
          ? ommit
          : SerializableField(meta.getField('wireName').toString()));

  return annos.isNotEmpty ? Option.some(annos.first) : Option.none();
}

Iterable<InterfaceType> getInterfaces(ClassElement classElement) =>
    classElement.interfaces.where(
      (i) => i.name != classElement.name.replaceFirst('\$', '') + 'Base',
    );

bool implementsBase(ClassElement element) {
  final afterClass =
      element.source.contents.data.replaceRange(0, element.nameOffset, '');
  final beforeBracket =
      afterClass.replaceRange(afterClass.indexOf('{'), afterClass.length, '');
  return beforeBracket.contains(element.name.replaceFirst('\$', '') + 'Base');
}

bool isConst(ClassElement element) =>
    element.constructors.any((c) => c.isDefaultConstructor && c.isConst);

bool isComputed(List<ElementAnnotation> metadata) =>
    metadata.any((meta) => meta.computeConstantValue().type.name == 'Computed');

bool isSerializable(List<ElementAnnotation> metadata) => metadata
    .any((meta) => meta.computeConstantValue().type.name == 'Serializable');

Iterable<InterfaceType> calcSupertypes(ClassElement e) =>
    e.type.name == 'Object'
        ? []
        : [e.type, ...calcSupertypes(e.supertype.element)];

String classGenerics(Iterable<TypeParameterDeclaration> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.typeParameterStr).join(",")}>';
}

String extendedClassGenerics(
    Iterable<TypeParameterDeclaration> typeParameters) {
  return typeParameters.isEmpty
      ? ''
      : '<${typeParameters.map((p) => p.type).join(",")}>';
}

Iterable<TypeParameterDeclaration> resolveTypeParameterDeclaration(
        List<TypeParameterElement> typeParameters) =>
    typeParameters.map(
      (p) => TypeParameterDeclaration(
        type: p.name,
        extension: p.bound == null
            ? Option.none()
            : p.bound.toString() == 'dynamic'
                ? Option.some(resolveFieldExtensionName(p))
                : Option.some(
                    resolveFieldReturnType(
                      p.bound.toString(),
                    ),
                  ),
      ),
    );

FieldType resolveFieldReturnTypeFromPropertyAccessorElement(
    PropertyAccessorElement a) {
  // f this right here
  final beforeField = a.source.contents.data
      .replaceRange(a.nameOffset - 5, a.source.contents.data.length, '');
  final returnTypeStr =
      beforeField.replaceRange(0, beforeField.lastIndexOf('\n') + 1, '').trim();
  return resolveFieldReturnType(returnTypeStr);
}

// for enums only
FieldType resolveFieldReturnTypeFromFieldElement(FieldElement e) {
  // f this right here
  final beforeField = e.source.contents.data
      .replaceRange(e.nameOffset - 1, e.source.contents.data.length, '');
  try {
    final returnTypeStr = beforeField
        .replaceRange(0, beforeField.lastIndexOf('const ') + 6, '')
        .trim();
    return resolveFieldReturnType(returnTypeStr);
  } catch (e) {
    throw Exception(beforeField);
  }
}

FieldType resolveFieldReturnType(String returnTypeStr) {
  // f this right here
  final indexOfCaret = returnTypeStr.indexOf('<');
  if (indexOfCaret == -1) {
    return FieldType(type: returnTypeStr, generics: Option.none());
  }
  final generics =
      returnTypeStr.substring(indexOfCaret + 1, returnTypeStr.length - 1);

  final terminators = <String>[','];
  final values = <String>[];
  final buffer = StringBuffer();
  for (var i = 0; i < generics.length; i++) {
    final char = generics[i];
    if (char == terminators.last) {
      terminators.removeLast();
      if (terminators.isEmpty) {
        values.add(buffer.toString());
        buffer.clear();
        terminators.add(',');
        continue;
      }
    }
    if (char == '<') {
      terminators.add('>');
    }

    buffer.write(char);
  }
  values.add(buffer.toString());

  return FieldType(
      type: returnTypeStr.substring(0, indexOfCaret),
      generics: Option.some(values.map(resolveFieldReturnType)));
}

FieldType resolveFieldExtensionName(Element a) {
  // f this right here
  final beforeField = a.source.contents.data.replaceRange(0, a.nameOffset, '');

  final afterExtends =
      beforeField.replaceRange(0, beforeField.indexOf('extends') + 7, '');

  var lowest = 3920840928349203;
  var indexOfComma = afterExtends.indexOf(',');
  if (indexOfComma != -1 && indexOfComma < lowest) lowest = indexOfComma;

  final indexOfBracketSpace = afterExtends.indexOf('> ');
  if (indexOfBracketSpace != -1 && indexOfBracketSpace < lowest)
    lowest = indexOfBracketSpace;
  final indexOfBracketNewLine = afterExtends.indexOf('>\n');
  if (indexOfBracketNewLine != -1 && indexOfBracketNewLine < lowest)
    lowest = indexOfBracketNewLine;

  return resolveFieldReturnType(
    afterExtends.replaceRange(lowest, afterExtends.length, '').trim(),
  );
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

bool isNull<T>(T value) => value == null;
bool returnTrue<T>(T value) => true;
Option<T> returnNone<T>() => Option<T>.none();

String removeUnderscore(String field) =>
    field.startsWith('_') ? field.substring(1) : field;

MetaInterface<F, T> buildMetaInterface<F extends Field, T extends Meta<F>>(
  T meta,
  List<DartType> typeArguments,
) {
  final argMap = <String, String>{};
  for (var i = 0; i < meta.typeParameters.length; i++) {
    argMap[meta.typeParameters.elementAt(i).type] =
        typeArguments.elementAt(i).toString();
  }

  String replaceType(String type) {
    return argMap.containsKey(type) ? argMap[type] : type;
  }

  FieldType replaceFieldType(FieldType f) => f.copy(
        type: replaceType(f.type),
        generics: f.generics.map(
          (generics) => generics.map(replaceFieldType),
        ),
      );

  return MetaInterface(
    meta: meta,
    parametarizedFields: meta.fields.map(
      (f) => f.copyField(
        returnType: replaceFieldType(f.returnType),
      ) as F,
    ),
    typeArguments: typeArguments.map(
      (a) => FieldType(
        type: a.displayName,
        generics: Option.none(),
      ),
    ),
  );
}
