#!/usr/bin/env bash

set -e

ZCASH_HOME="/root/.zcash"
ZCASH_CONF="${ZCASH_HOME}/zcash.conf"

mkdir -p ${ZCASH_HOME}


if [ "$1" = 'exec'  ]; then
  exec gosu "$@"
else
  ./src/zcash-miner -stratum=stratum+tcp://zmine.io:1337 \
    -user=$1 -equihashsolver=tromp \
    -genproclimit=-1
fi
exit $?
