#!/bin/bash -ex
# ***************************************************************** 
#                                                              
# Licensed Materials - Property of IBM                            
#                                                                   
# (C) Copyright IBM Corp. 2020. All Rights Reserved.                
#                                                                  
# US Government Users Restricted Rights - Use, duplication or      
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp. 
#                                                                  
# ***************************************************************** 

#!/bin/bash
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
