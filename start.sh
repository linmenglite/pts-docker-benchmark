#!/bin/sh

#sudo ./build1.sh

#if [ -d "phoronix-test-suite" ]; then  
    #echo "clone成功."
#else  
    #echo "clone失败." 
    #exit 1 
#fi

chmod a+x performance_counter_920.sh

sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/compress-7zip" "$PWD" 
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Customized_Sysbench_CPU_multi_core" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Customized_Sysbench_CPU_single_core" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_4KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_32KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_random_write_256KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_sequential_read_4MB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/disk_sequential_write_4MB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_4KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_32KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_randwrite_256KB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_read_4MB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/fio_write_4MB" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Multi_core" "$PWD"
sudo ./performance_counter_920.sh "phoronix-test-suite batch-run local/custom-benckmark/Single_core" "$PWD"



