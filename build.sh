#! /bin/bash
CODES_LOC="/Users/Nann/workspace/codes-dev/codes"
CODES_BUILD_LOC="/Users/Nann/workspace/codes-dev/codes/build"
ROSS_BUILD_LOC="/Users/Nann/workspace/codes-dev/build-ross/lib/pkgconfig"

cd ${CODES_LOC}
./prepare.sh
cd ${CODES_BUILD_LOC}
../configure --prefix=${CODES_BUILD_LOC} PKG_CONFIG_PATH=${ROSS_BUILD_LOC} CC=mpicc CXX=mpicxx CFLAGS=-g CXXFLAGS="-g -std=c++11"
make install
