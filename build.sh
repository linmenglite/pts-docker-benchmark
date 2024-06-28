#!/bin/sh

#下载PTS所需相关依赖
yum install -y php-cli php-gd php-xml

#安装PTS
git clone https://github.com/phoronix-test-suite/phoronix-test-suite.git
if [ -d "phoronix-test-suite" ]; then  
    echo "clone成功."
else  
    echo "clone失败." 
    exit 1 
fi
cd phoronix-test-suite
sudo ./install-sh
phoronix-test-suite user-config-set AnonymousUsageReporting=FALSE  
phoronix-test-suite user-config-set DynamicRunCount=FALSE  
phoronix-test-suite user-config-set UploadResults=FALSE  
phoronix-test-suite user-config-set PromptForTestIdentifier=FALSE  
phoronix-test-suite user-config-set PromptForTestDescription=FALSE  
phoronix-test-suite user-config-set PromptSaveName=FALSE  
phoronix-test-suite user-config-set Configured=TRUE
cd ..

#下载测试
phoronix-test-suite install-dependencies pts/fio-2.1.0 pts/compress-7zip-1.10.0
phoronix-test-suite install pts/fio-2.1.0 pts/compress-7zip-1.10.0

#安装本地测试
mv  custom-cpu-disk-benchmark ~/.phoronix-test-suite/test-suites/local
mv  customized-openssl-3.1.0 ~/.phoronix-test-suite/test-profiles/local
mv  customized-sysbench-1.0.0 ~/.phoronix-test-suite/test-profiles/local

phoronix-test-suite install-dependencies customized-openssl-3.1.0 customized-sysbench-1.0.0
phoronix-test-suite install customized-openssl-3.1.0 customized-sysbench-1.0.0





