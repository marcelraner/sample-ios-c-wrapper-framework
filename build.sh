#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

script_dir="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

pushd ${script_dir} > /dev/null

mkdir -p build
pushd build > /dev/null


################################################################################
# Step 1: Compile static libraries for ios and ios-simulator
################################################################################

libmymath_ios_lib_dir="${script_dir}/libmymath/ios-arm64"
libmymath_iossim_lib_dir="${script_dir}/libmymath/ios-x86_64-simulator"
libmymath_headers_dir="${script_dir}/libmymath/headers"
mymath_repo_dir="${script_dir}/submodules/sample-mymath-library"

cp "${mymath_repo_dir}/include/mymath.h" "${libmymath_headers_dir}"

compiler=$(xcrun --sdk iphoneos --find clang)
sysroot=$(xcrun --sdk iphoneos --show-sdk-path)

${compiler} \
    -isysroot "${sysroot}" \
    -arch arm64 \
    -c \
    -Wall \
    -o mymath_arm64.o \
    -I "${mymath_repo_dir}/include" \
    "${mymath_repo_dir}/src/mymath.c"

rm "${libmymath_ios_lib_dir}/libmymath.a"
ar \
    rc "${libmymath_ios_lib_dir}/libmymath.a" \
    "mymath_arm64.o"

compiler=$(xcrun --sdk iphonesimulator --find clang)
sysroot=$(xcrun --sdk iphonesimulator --show-sdk-path)

${compiler} \
    -isysroot "${sysroot}" \
    -arch x86_64 \
    -c \
    -Wall \
    -o mymath_x86_64.o \
    -I "${mymath_repo_dir}/include" \
    "${mymath_repo_dir}/src/mymath.c"

rm "${libmymath_iossim_lib_dir}/libmymath.a"
ar \
    rc "${libmymath_iossim_lib_dir}/libmymath.a" \
    "mymath_x86_64.o"


################################################################################
# Step 2: Pack universal fat library
################################################################################

libmymath_ios_universal_lib_dir="${script_dir}/libmymath/ios-universal"

rm -f "${libmymath_ios_universal_lib_dir}/libmymath.a"
lipo -create \
    "${libmymath_ios_lib_dir}/libmymath.a" \
    "${libmymath_iossim_lib_dir}/libmymath.a" \
    -output "${libmymath_ios_universal_lib_dir}/libmymath.a"

popd > /dev/null
popd > /dev/null
