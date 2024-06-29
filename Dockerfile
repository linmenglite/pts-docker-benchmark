# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# Note: we pin the version to a specific Git tag for better reproducibility
ADD --keep-git-dir=false https://github.com/phoronix-test-suite/phoronix-test-suite.git#v10.8.4 /phoronix-test-suite

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install unzip php-cli apt-utils mesa-utils php-xml git-core apt-file sudo -y
RUN apt-file update
RUN /phoronix-test-suite/phoronix-test-suite make-openbenchmarking-cache lean

# Install all the tests you need, to reduce the time for benchmarking (avoids that binaries need to be downloaded/installed)
RUN /phoronix-test-suite/phoronix-test-suite install pts/fio-2.1.0
RUN /phoronix-test-suite/phoronix-test-suite install pts/compress-7zip-1.10.0

# Copy your custom test profiles and test suites
COPY custom-benckmark /var/lib/phoronix-test-suite/test-suites/local
COPY customized-openssl-3.1.0 /var/lib/phoronix-test-suite/test-profiles/local
COPY customized-sysbench-1.0.0 /var/lib/phoronix-test-suite/test-profiles/local


RUN /phoronix-test-suite/phoronix-test-suite install local/customized-openssl-3.1.0
RUN /phoronix-test-suite/phoronix-test-suite install local/customized-sysbench-1.0.0

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

COPY --chmod=755 start.sh /start.sh
CMD ["/start.sh"]
