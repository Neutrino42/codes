#! /bin/bash
# template from: https://github.com/codes-org/codes/wiki/codes-example-dragonfly-dally

# name our experiment (this will specify the name of a directory where certain model output files will be created)
EXP_NAME="fattree-test"
# let's create some variable that we can set so that we can add some unique number and not overwrite saved stdout files
count=0



CODES_LOC="/home/nan42/codes-dev/codes"
CODES_BUILD_LOC="$CODES_LOC/build"

BIN="$CODES_BUILD_LOC/bin/model-net-synthetic-fattree"
CONFIG="$CODES_LOC/run-scripts/conf/modelnet-synthetic-fattree-k96.conf"

RANKS=40
#HOSTFILE="$CODES_LOC/run-scripts/hostfile"
TRAFFIC=1
NUM_MESSAGES=160
#PAYLOAD_SIZE=8192
# Use one of the following two to set up the inter arrival time of the message generation for each server
# ARRIVAL_TIME=100000  # the time interval between two packet sending events, in nanosecond
LOAD=100 # the percentage of the full bandwidth (e.g. 0.9 for 90% of the full bandwidth)

# Let's create a parent directory where we will put our EXP_NAME output file directory into if it doesn't already exist
LP_IO_PARENT_DIR="lpio"
if [ ! -d $LP_IO_PARENT_DIR ]
then
    mkdir $LP_IO_PARENT_DIR
fi

# Let's create a parent directory where we will put our simulation standard output file into if it doesn't already exist
OUT_DIR="stdout"
if [ ! -d $OUT_DIR ]
then
    mkdir $OUT_DIR
fi

LP_IO_DIR="$EXP_NAME-$count-$(date +%s)"
# Default:
# mpirun -np $RANKS $BIN --sync=3 --traffic=$TRAFFIC --num_messages=$NUM_MESSAGES --payload_sz=$PAYLOAD_SIZE --arrival_time=$ARRIVAL_TIME --lp-io-dir=$LP_IO_PARENT_DIR/$LP_IO_DIR --lp-io-use-suffix=1 -- $CONFIG | tee "$OUT_DIR/$LP_IO_DIR.txt"

#mpirun --hostfile $HOSTFILE --mca btl_tcp_if_include eno2np1 -np $RANKS $BIN --sync=3 --load=$LOAD -- $CONFIG | tee "$OUT_DIR/$LP_IO_DIR.txt"
mpirun -np $RANKS $BIN --sync=3 --load=$LOAD --num_messages=$NUM_MESSAGES -- $CONFIG | tee "$OUT_DIR/$LP_IO_DIR.txt"
