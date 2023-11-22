#!/bin/sh
tar -xf openssl-3.1.0.tar.gz
cd openssl-3.1.0
./config no-zlib
make -j $NUM_CPU_CORES
echo $? > ~/install-exit-status

cd ~

echo "#!/bin/sh
if [ \"\$3\" = \"0\" ]; then
    threads=\"\$NUM_CPU_CORES\"
else
    threads=\"\$3\"
fi
cd openssl-3.1.0
LD_LIBRARY_PATH=.:\$LD_LIBRARY_PATH ./apps/openssl speed -multi \$threads -seconds \$2 -bytes \$4 \$1 > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > customized-openssl
chmod +x customized-openssl
