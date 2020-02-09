import 'package:code_builder/code_builder.dart' as cb;
import 'package:meta_types/meta_types_models.dart';
import '../util.dart';

String emptyReturnTypeIfVoid<T extends Field>(T field) =>
    isVoid(field) ? '' : field.returnType.typeStr;

String boolReturnTypeIfVoid<T extends Field>(T field) =>
    isVoid(field) ? 'bool' : field.returnType.typeStr;

bool isVoid<T extends Field>(T field) => field.returnType.typeStr == 'void';

String emptyFieldNameIfVoid<T extends Field>(T field) =>
    isVoid(field) ? '' : field.name;

String privateEmptyFieldNameIfVoid<T extends Field>(T field) =>
    isVoid(field) ? '' : '_' + field.name;

// returns each type parameter as a Reference
Iterable<cb.Reference> typeParameterReferences(
  Iterable<TypeParameterDeclaration> typeParameters,
) =>
    typeParameters.map(
      (typeParameter) => cb.Reference(typeParameter.typeParameterStr),
    );

// returns the complete cb.Reference for a class with its type params.
// useful for methods that return an instance of this class
cb.Reference classNameWithTypeArguments(
  String name,
  Iterable<TypeParameterDeclaration> typeParameters,
) =>
    cb.Reference('${name}' + extendedClassTypeArguments(typeParameters));

// returns the complete extension cb.Reference for a template class
cb.Reference templateExtension(
  String name,
  Iterable<TypeParameterDeclaration> typeParameters,
) =>
    cb.Reference('\$${name}' + extendedClassTypeArguments(typeParameters));

String extendedClassTypeArguments(
  Iterable<TypeParameterDeclaration> typeParameters,
) =>
    typeParameters.isEmpty
        ? ''
        : '<${typeParameters.map((p) => p.type).join(",")}>';

// returns the cache field initializer
Iterable<cb.Field> computedFields<T extends Field>(Iterable<T> fields) =>
    fields.map(
      (field) => cb.Field(
        (b) => b
          ..name = '_${field.name}'
          ..type = cb.Reference(field.returnType.typeStr),
      ),
    );

// returns the method that computes the value
Iterable<cb.Method> computedFieldMethods<T extends Field>(Iterable<T> fields) =>
    fields.map(
      (field) => cb.Method(
        (b) => b
          ..name = field.name
          ..returns = cb.Reference(field.returnType.typeStr)
          ..type = cb.MethodType.getter
          ..annotations.add(cb.Reference('override'))
          ..body = cb.Code('return _${field.name} ??= super.${field.name};'),
      ),
    );

// when a field is passed to a clone method or constructor
// it cannot include the underscore so prepend with private
String fieldParameterName<T extends Field>(T field) =>
    /* TODO: field.isPrivate */ field.name.startsWith('_')
        ? '\$' + field.name
        : field.name;

cb.Method equality(String className, String equalityCheck) => cb.Method(
      (b) => b
        ..name = 'operator =='
        ..returns = cb.TypeReference((b) => b..symbol = 'bool')
        ..requiredParameters.add(
          cb.Parameter(
            (b) => b
              ..name = 'other'
              ..type = cb.Reference('dynamic'),
          ),
        )
        ..body = cb.Code(
          '''
            if (identical(other, this)) return true;
            if (other is! $className) return false;
            return $equalityCheck;
          ''',
        ),
    );

// returns a to string Method
cb.Method toString(String className, String content) => cb.Method(
      (b) => b
        ..name = 'toString'
        ..returns = cb.TypeReference((b) => b..symbol = 'String')
        ..body = cb.Code('return "$className ($content)";'),
    );

// returns a hash code Method
cb.Method hashCode(String body) => cb.Method(
      (b) => b
        ..name = 'hashCode'
        ..type = cb.MethodType.getter
        ..lambda = true
        ..returns = cb.TypeReference((b) => b..symbol = 'int')
        ..body = cb.Code(body),
    );

// returns a string that is the hash of the provided fields
String hashBodyForFields<T extends Field>(Iterable<T> fields) =>
    '\$jf(${_hashFold(fields)})';

String _hashFold<T extends Field>(Iterable<T> fields) => fields.fold(
    '',
    (params, field) =>
        '\$jc(${params.isNotEmpty ? params : 0}, ${_publicDefaults(field)}.hashCode)');

String _publicDefaults(Field f) =>
    (f is DataField && f.isDefaulted) ? f.name : '_${f.name}';

// conditionally returns a Code body depending on the value of
// isAbstract
cb.Code abstractBody(bool isAbstract, String body) =>
    isAbstract ? null : cb.Code(body);

// returns an interable containing override ref if condition is true
Iterable<cb.Reference> override(bool condition) =>
    [if (condition) cb.Reference('override')];

// returns an interable containing required ref if condition is true
Iterable<cb.Reference> required(bool condition) =>
    [if (condition) cb.Reference('required')];

// generates a when condition for a set of fields
cb.Method whenFields<T extends Field>(
  Iterable<T> fields,
  String Function(T) conditionGenerator, {
  bool isAbstract = false,
  bool wheno = false,
}) =>
    cb.Method(
      (b) => b
        ..name = 'when' + (wheno ? 'o' : '')
        ..types.add(cb.Reference('WHEN'))
        ..returns = cb.Reference('WHEN')
        ..optionalParameters.addAll(
          [
            if (wheno)
              cb.Parameter(
                (b) => b
                  ..named = true
                  ..name = 'otherwise'
                  ..type = cb.Reference('WHEN Function()'),
              ),
            ...fields.map(
              (f) => cb.Parameter(
                (b) => b
                  ..named = true
                  ..name = f.name
                  ..annotations.addAll(required(!wheno))
                  ..type = cb.Reference(
                    'WHEN Function(${emptyReturnTypeIfVoid(f)})',
                  ),
              ),
            ),
          ],
        )
        ..body = abstractBody(isAbstract, '''
          ${_combineWhenConditions(fields, conditionGenerator)}
          ${wheno ? "return otherwise()" : "throw FallThroughError()"};'''),
    );

// generates a void when func for a field
cb.Method whenField<T extends Field>(
  T field,
  String condition, {
  bool isAbstract = false,
}) =>
    cb.Method(
      (b) => b
        ..name = 'when' + capitalize(field.name)
        ..returns = cb.Reference('void')
        ..requiredParameters.add(
          cb.Parameter(
            (b) => b
              ..name = 'handler'
              ..type = cb.Reference(
                'void Function(${emptyReturnTypeIfVoid(field)})',
              ),
          ),
        )
        ..body = abstractBody(isAbstract, condition),
    );

String _combineWhenConditions<T extends Field>(
  Iterable<T> fields,
  String Function(T) conditionGenerator,
) =>
    fields.fold('', (comb, field) => comb + conditionGenerator(field));

// returns fields for data interface fields implemented
// by enum/sealed classes
Iterable<cb.Method> dataInterfaceFields<T extends Field>(
  Iterable<T> whenFields,
  Iterable<DataField> dataFields,
) =>
    dataFields.map(
      (field) => cb.Method(
        (b) => b
          ..name = field.name
          ..returns = cb.Reference(field.returnType.typeStr)
          ..type = cb.MethodType.getter
          ..body = cb.Code(
              'return when(${_dataInterfaceFieldBody(whenFields, field)});'),
      ),
    );

String _dataInterfaceFieldBody<T extends Field>(
  Iterable<T> whenFields,
  DataField field,
) =>
    whenFields.fold(
        '',
        (comb, sfield) =>
            '$comb${sfield.name}: (${sfield.name}) => ${sfield.name}.${field.name},');

// Iterable<Method> _genMethods(Enum<EnumField, DataField> enumeration) =>
//     enumeration.dataInterfaces.expand((f) => f.meta.methods).map(
//           (method) => Method(
//             (b) => b
//               ..name = method.name
//               ..requiredParameters.addAll(
//                 method.inputs.map(
//                   (i) => Parameter(
//                     (b) => b
//                       ..name = i.name
//                       ..type = Reference(i.type.typeStr),
//                   ),
//                 ),
//               ) // TODO: should be setting this in meta
//               ..returns = Reference(method.returnType.typeStr)
//               ..types.addAll(method.typeParameters
//                   .map((p) => Reference(p.typeParameterStr)))
//               ..body = Code(
//                   '''return when(${_genMethodFieldBody(enumeration, method)});'''),
//           ),
//         );

// String _genMethodFieldBody(
//         Enum<EnumField, DataField> enumeration, mtm.Method method) =>
//     enumeration.nonComputedFields.fold(
//         '',
//         (comb, next) =>
//             '$comb${next.name}: (${next.name}) => ${next.name}.${method.name}(${method.inputs.map((i) => i.name).join(',')}),');

// when condition generator for seal/sum/union
String whenConditionGenerator<T extends Field>(T field) =>
    'if (_${field.name} != null) { return ${field.name}(${privateEmptyFieldNameIfVoid(field)}); }';

// when condition generator for seal/sum/union
String whenOConditionGenerator<T extends Field>(T field) =>
    'if (_${field.name} != null) { if (${field.name} != null) return ${field.name}(${privateEmptyFieldNameIfVoid(field)}); else return otherwise(); }';

// when condition for a single field on seal/sum/union
String whenFieldGenerator<T extends Field>(T field) =>
    'if (_${field.name} != null) return handler(${privateEmptyFieldNameIfVoid(field)});';

Iterable<cb.Method> isSetMethods<T extends Field>(
  Iterable<T> fields, {
  bool isAbstract = false,
}) =>
    fields.map(
      (field) => cb.Method(
        (b) => b
          ..name = "is" + capitalize(field.name)
          ..type = cb.MethodType.getter
          ..returns = cb.Reference('bool')
          ..body = abstractBody(isAbstract, 'return _${field.name} != null;'),
      ),
    );

Iterable<cb.Method> restrictedFieldAccessor<T extends Field>(
  String kindName,
  Iterable<T> fields, {
  bool isAbstract = false,
}) =>
    fields.map(
      (field) => cb.Method(
        (b) => b
          ..name = field.name
          ..type = cb.MethodType.getter
          ..returns = cb.Reference(field.returnType.typeStr)
          ..body = abstractBody(isAbstract, '''
            if (_${field.name} != null) return ${privateEmptyFieldNameIfVoid(field)};
            throw Exception('Illegal access of $kindName field, ${field.name} is not set');'''),
      ),
    );

Iterable<cb.Field> restrictedFieldInitializerr<T extends Field>(
  Iterable<T> fields,
) =>
    fields.map(
      (field) => cb.Field(
        (b) => b
          ..modifier = cb.FieldModifier.final$
          ..name = '_${field.name}'
          ..type = cb.Reference(
            boolReturnTypeIfVoid(field),
          ),
      ),
    );

Iterable<cb.Constructor> restrictedFieldConstructors<T extends Field>(
  bool isConst,
  Iterable<T> fields,
) =>
    fields.map(
      (f) => cb.Constructor(
        (b) => b
          ..constant = isConst
          ..name = f.name
          ..requiredParameters.addAll([
            if (!isVoid(f))
              cb.Parameter(
                (b) => b
                  ..name = f.name
                  ..type = cb.Reference(f.returnType.typeStr),
              ),
          ])
          ..initializers.addAll(
            fields.map(
              (ifield) => cb.Code(
                ifield.name ==
                        f.name // TODO why isn't returnType equality passing?
                    ? (isVoid(f)
                        ? '_${ifield.name} = true'
                        : 'assert(${ifield.name} != null), _${ifield.name} = ${ifield.name}')
                    : '_${ifield.name} = null',
              ),
            ),
          ),
      ),
    );

String restrictedAccessorEqualityFold<T extends Field>(Iterable<T> fields) =>
    fields.map((field) => '_${field.name} == other._${field.name}').join('&&');

String restrictedAccessorToStringWhen<T extends Field>(Iterable<T> fields) => fields
    .map((field) =>
        '${field.name}: (${emptyFieldNameIfVoid(field)}) => \'${field.name}${isVoid(field) ? "" : " \$"}${emptyFieldNameIfVoid(field)}\'')
    .join(',');
