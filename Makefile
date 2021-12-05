-include des.mk

.SUFFIXES: .mw .mwc .test
.mwc.mw:
	@dir=$$(dirname $$PWD) && \
		until [ -f $$dir/probs.mwc ]; do \
			dir=$$(dirname $$dir); \
		done && \
		cat $< $$dir/probs.mwc > $@
.mw.c:
	mweb $< "c code" $@
.mw.test:
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

refresh:
	@for dir in ${SUB}; do \
		[ -d $$dir ] || mkdir $$dir; \
		cd $$dir && ln -sf ../Makefile Makefile && \
		make refresh && cd ..; \
	done
