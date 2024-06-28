#!/bin/sh

tar -xf sysbench-1.0.20.tar.gz
cd sysbench-1.0.20
./autogen.sh
./configure  --without-mysql
make -j $NUM_CPU_CORES
echo $? > ~/install-exit-status
cd ~/

# argument order:
# $1 = test mode (cpu/memory/fileio)
# $2 = duration in seconds
# $3 = number of parallel threads/cores (0 means to use all cores)
# $4 = value for --memory-access-mode
# $5 = value for --memory-oper
# $6 = value for --file-test-mode
# $7 = value for --file-block-size
# $8 = value for direct mode (directmode/nodirectmode), which implies to set --file-extra-flags=direct

echo "#!/bin/sh

if [ \"\$3\" = \"0\" ]; then
    threads=\"\$NUM_CPU_CORES\"
else
    threads=\"\$3\"
fi

if [ \"\$1\" = \"memory\" ]; then
    extraargs=\"--memory-access-mode=\$4 --memory-oper=\$5\"
elif [ \"\$1\" = \"fileio\" ]; then
    extraargs=\"--file-test-mode=\$6 --file-block-size=\$7\"
    if [ \"\$8\" = \"directmode\" ]; then
        extraargs=\"\$extraargs --file-extra-flags=direct\"
    fi
else
    extraargs=\"--cpu-max-prime=10000\"
fi

cd sysbench-1.0.20

[ \"\$1\" = \"fileio\" ] && ./src/sysbench \$1 \$extraargs prepare > /dev/null 2>&1
./src/sysbench \$1 --threads=\$threads --time=\$2 \$extraargs run > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > sysbench
chmod +x sysbench
