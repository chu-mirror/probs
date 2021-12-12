# A+B

If the current directory does not have _Makefile_, you should
go to root directory and run:
```
$ make refresh
```

Make _a+b_:
```
$ make
```
Two files are created, an executable _a+b_ and a test script _a+b.test_.

Run test script:
```
$ ./a+b.test
```

See the output, test 1 will not pass since I had put an exception in
source code for illustration.  Now you can see three more files are
created, _input1_, _output1_, and _result1_.  _input1_ is the input
of sample 1, _output1_ is the corresponding output, _result1_ is the
wrong result produced by _a+b_ when has _input1_ as input.

