#!/bin/bash
set -e

stage='false'
generate='false'
rewrite='false'

print_usage_and_exit() {
    printf "Usage: ./stage -s -g -r (at least one flag should be set)"
    exit 1
}

while getopts 'sgr' flag; do
  case "${flag}" in
    s) stage='true' ;;
    g) generate='true' ;;
    r) rewrite="true" ;;
    *) print_usage_and_exit;;
  esac
done

META_TYPES_STAGING_PATH='meta_types_staging'
META_TYPES_EXAMPLE_PATH='meta_types/example'
META_TYPES_LIB_PATH='meta_types/lib'
META_TYPES_STAGING_EXAMPLE_PATH='meta_types_staging/example'
META_TYPES_STAGING_LIB_PATH='meta_types_staging/lib'

if [ $stage == "true" ]; then
    if [ -d "$META_TYPES_STAGING_EXAMPLE_PATH" ]; then
        rm -rf "$META_TYPES_STAGING_EXAMPLE_PATH"
    fi

    if [ -d "$META_TYPES_STAGING_LIB_PATH" ]; then
        rm -rf "$META_TYPES_STAGING_LIB_PATH"
    fi


    cp -r $META_TYPES_EXAMPLE_PATH $META_TYPES_STAGING_EXAMPLE_PATH
    cp -r $META_TYPES_LIB_PATH $META_TYPES_STAGING_LIB_PATH
fi

if [ $generate == "true" ]; then
    cd $META_TYPES_STAGING_PATH
    pub get
    pub run build_runner build --delete-conflicting-outputs
    cd ..
fi


if [ $rewrite == "true" ]; then
    rm -rf $META_TYPES_EXAMPLE_PATH
    rm -rf $META_TYPES_LIB_PATH
    cp -r $META_TYPES_STAGING_EXAMPLE_PATH $META_TYPES_EXAMPLE_PATH
    cp -r $META_TYPES_STAGING_LIB_PATH $META_TYPES_LIB_PATH
fi