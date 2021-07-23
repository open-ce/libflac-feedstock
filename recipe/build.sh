#!/bin/bash -ex
# *****************************************************************
# (C) Copyright IBM Corp. 2020, 2021. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# *****************************************************************

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      -D BUILD_SHARED_LIBS=ON         \
      -D BUILD_EXAMPLES=OFF           \
      -D BUILD_DOXYGEN=OFF            \
      $SRC_DIR

make install -j${CPU_COUNT}
