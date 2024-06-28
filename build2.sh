#!/bin/sh

sleep 5

mv  custom-cpu-disk-benchmark ~/.phoronix-test-suite/test-suites/local
mv  customized-openssl-3.1.0 ~/.phoronix-test-suite/test-profiles/local
mv  customized-sysbench-1.0.0 ~/.phoronix-test-suite/test-profiles/local

phoronix-test-suite install-dependencies customized-openssl-3.1.0 customized-sysbench-1.0.0
phoronix-test-suite install customized-openssl-3.1.0 customized-sysbench-1.0.0
