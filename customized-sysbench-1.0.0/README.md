Based loosely on the "pts/sysbench" test (version 1.1.0), but modified, because the original test profile
is very limited (it only offers CPU and RAM tests, and always tests with all cores, for a hard-coded duration of 90 seconds).

This customized test:
- Adds the ability to also test **disk** performance, with configurable I/O patterns and block size
- For testing RAM, you can customize the I/O pattern (read vs. write, random vs. sequential)
- For any test, you can configure the test duration and whether to use one or all available CPU cores
- The `cleanup` command is run after the **disk** test
