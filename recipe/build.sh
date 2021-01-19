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

if [ `uname` == Darwin ]; then
	export LDFLAGS="${LDFLAGS} -Wl,-rpath,$PREFIX/lib"
fi

./autogen.sh

CONFIG_OPTIONS=""
ARCH="$(arch)"
if [ ${ARCH} = "x86_64" ]; then
    CONFIG_OPTIONS="--enable-sse"
elif [ ${ARCH} = "ppc64le" ]; then
    CONFIG_OPTIONS="--enable-altivec"
fi

./configure --prefix=${PREFIX} ${CONFIG_OPTIONS} --disable-dependency-tracking

make
if [ `uname` == Darwin ]; then
	make check
fi
make install
