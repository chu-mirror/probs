-include des.mk

.SUFFIXES: .mw .mwe .test
.mw.mwe:
	@dir=$$(dirname $$PWD) && \
		until [ -f $$dir/probs.mw ]; do \
			dir=$$(dirname $$dir); \
		done && \
		cat $< $$dir/probs.mw > $@
.mwe.c:
	mweb $< "c code" $@
.mwe.test:
	mweb $< "test" $@
	chmod +x $@

all: ${ALL}

new:
	read sub && mkdir $$sub && ln -sf ../Makefile $$sub/Makefile

clean:
	${RM} *.c *.test *.o ${ALL} input* output* result*
	@for dir in ${SUB}; do \
		cd $$dir && make clean && cd ..; \
	done
	[ -h Makefile ] && rm Makefile

refresh:
	@for dir in ${SUB}; do \
		cd $$dir && ln -sf ../Makefile Makefile && \
		make refresh && cd ..; \
	done
