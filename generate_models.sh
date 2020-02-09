set -e

rm -rf meta_types_generator/test/staging
cp -r meta_types/lib/src/models meta_types_generator/test/staging

cd meta_types_generator
pub run build_runner build
cd ..

# cp -r meta_types_generator/test/unit/meta_types_models.g.dart meta_types/lib/meta_types_models.g.dart 