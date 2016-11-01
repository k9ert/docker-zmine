#!/usr/bin/env bash

set -e

if [ "$1" = 'exec'  ]; then
  "$@"
else
  ./src/zcash-miner -stratum=stratum+tcp://zmine.io:1337 \
    -user=$1 -equihashsolver=tromp \
    -genproclimit=-1
fi
exit $?
