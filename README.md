# pts-docker-benchmark

Illustrates how to use [Phoronix Test Suite](https://www.phoronix-test-suite.com/) (PTS) in a container to run your own
customized benchmarks.

The basic idea is that you fork this repository and customize the `Dockerfile`. But you may also use the pre-built
image (see [packages](https://github.com/users/MShekow/packages?repo_name=pts-docker-benchmark)), which is built for ARM64 and Intel/AMD64, with automatic rebuilds twice per month.

The image includes a test suite which is automatically started via the `Dockerfile`s `CMD`. The suite
contains the following tests:

- **Disk**: IOPS and random+sequential read/write performance, via FIO and Sysbench
- **CPU**: single- and multi-core performance, via OpenSSL's and 7-zip's benchmark modes, and Sysbench's CPU test mode

Once the benchmark has completed, the results are printed in CSV format to the console.

To use this image _interactively_, run a command such as
`docker run --rm -it --entrypoint='' ghcr.io/mshekow/pts-docker-benchmark:latest bash` and then call
the `/phoronix-test-suite/phoronix-test-suite` script.

See [this blog post](https://www.augmentedmind.de/?p=3290) for background information about PTS.
