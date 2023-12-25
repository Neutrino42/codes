#! /bin/bash

# name our experiment (this will specify the name of a directory where certain model output files will be created)
EXP_NAME="simple-p2p-example"
# let's create some variable that we can set so that we can add some unique number and not overwrite saved stdout files
count=0

CODES_LOC="/Users/Nann/workspace/codes-dev/codes"
CODES_BUILD_LOC="$CODES_LOC/build"

BIN="$CODES_BUILD_LOC/tests/modelnet-simplep2p-test"
CONFIG="$CODES_LOC/tests/conf/modelnet-test-simplep2p.conf"

RANKS=3

mpirun -np $RANKS $BIN --sync=3 -- $CONFIG
