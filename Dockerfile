# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ADD --keep-git-dir=false https://github.com/phoronix-test-suite/phoronix-test-suite.git#v10.8.4 /phoronix-test-suite

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install unzip php-cli apt-utils mesa-utils php-xml git-core apt-file sudo -y
RUN apt-file update
RUN /phoronix-test-suite/phoronix-test-suite make-openbenchmarking-cache lean

# Copy our custom test profiles and test suites
COPY custom-suites /var/lib/phoronix-test-suite/test-suites/local/
COPY custom-tests /var/lib/phoronix-test-suite/test-profiles/local/

# Install all the tests you need, to reduce the time for benchmarking (avoids that binaries need to be downloaded/installed)
RUN /phoronix-test-suite/phoronix-test-suite install pts/fio
RUN /phoronix-test-suite/phoronix-test-suite install pts/compress-7zip
RUN /phoronix-test-suite/phoronix-test-suite install customized-openssl-3.1.0

# Configure some global settings. See https://github.com/phoronix-test-suite/phoronix-test-suite/blob/master/documentation/phoronix-test-suite.md
RUN cd phoronix-test-suite \
    && ./phoronix-test-suite user-config-set AnonymousUsageReporting=FALSE \
    && ./phoronix-test-suite user-config-set DynamicRunCount=FALSE

# Configure batch mode (the following settings are all located under <BatchMode> in /etc/phoronix-test-suite.xml)
RUN cd phoronix-test-suite \
    && ./phoronix-test-suite user-config-set UploadResults=FALSE \
    && ./phoronix-test-suite user-config-set PromptForTestIdentifier=FALSE \
    && ./phoronix-test-suite user-config-set PromptForTestDescription=FALSE \
    && ./phoronix-test-suite user-config-set PromptSaveName=FALSE \
    && ./phoronix-test-suite user-config-set Configured=TRUE

CMD ["/phoronix-test-suite/phoronix-test-suite", "batch-run", "local/custom-cpu-disk-benchmark"]
