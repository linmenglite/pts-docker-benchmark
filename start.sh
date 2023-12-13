#!/bin/sh

set -e

export TEST_RESULTS_NAME=benchmarkresult

cd /phoronix-test-suite
./phoronix-test-suite batch-run local/custom-cpu-disk-benchmark
./phoronix-test-suite result-file-to-csv $TEST_RESULTS_NAME

# Print the test results to stdout
cat /root/$TEST_RESULTS_NAME
