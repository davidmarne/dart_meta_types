set -e

cp meta_types/lib/meta_types_models.dart test/unit/meta_types_models.dart
cp -r meta_types/lib/src/models test/unit/src/models

pushd meta_types_generator
pub run build_runner build
popd

cp -r test/unit/src/models meta_types/lib/src/models 