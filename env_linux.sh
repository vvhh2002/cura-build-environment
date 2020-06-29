#!/usr/bin/env bash
set -e

# Get the path where this file exists
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

cbe_build_dir="${DIR}/build"
cbe_install_dir="${DIR}/install_dir"

mkdir -p $cbe_build_dir $cbe_install_dir
cd $cbe_build_dir

# Set some environment variables to make sure that the installed tools can be found.
export PATH=$cbe_install_dir/bin:$PATH
export PKG_CONFIG_PATH=$cbe_install_dir/lib/pkgconfig:$PKG_CONFIG_PATH

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$cbe_install_dir \
      -DCMAKE_PREFIX_PATH=$cbe_install_dir \
      ..

make
