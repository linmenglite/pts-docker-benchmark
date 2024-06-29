#!/bin/sh

sudo ./build1.sh

if [ -d "phoronix-test-suite" ]; then  
    echo "clone成功."
else  
    echo "clone失败." 
    exit 1 
fi

chmod a+x performance_counter_920.sh

sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/compress-7zip" $pwd 
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Customized_Sysbench_CPU_multi_core" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Customized_Sysbench_CPU_single_core" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_4KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_32KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_256KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_sequential_read_4MB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_sequential_write_4MB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_4KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_32KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_256KB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_read_4MB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_write_4MB" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Multi_core" $pwd
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Single_core" $pwd



