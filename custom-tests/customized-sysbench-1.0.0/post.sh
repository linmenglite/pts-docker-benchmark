#!/bin/sh

if [ "$1" = "fileio" ]; then
  extraargs="--file-test-mode=$6 --file-block-size=$7"
  cd sysbench-1.0.20
  ./src/sysbench $1 $extraargs cleanup
fi
