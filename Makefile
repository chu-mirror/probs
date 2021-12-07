-include des.mk

EXTENSION = c

.SUFFIXES: .mw .mwc .test
.mwc.mw:
	@dir=$$(dirname $$PWD) && \
		until [ -f $$dir/probs.mwc ]; do \
			dir=$$(dirname $$dir); \
		done && \
		cat $< $$dir/probs.mwc \
			$$(for ex in ${EXTENSION}; do echo $$dir/extension/$$ex".mwc "; done) \
			> $@
.mw.c:
	mweb $< "c code" $@
.mw.test:
	mweb $< "test" $@
	chmod +x $@

all: ${ALL} ${ALL:=.test}

clean:
	${RM} *.mw *.c *.test *.o ${ALL} input* output* result*
	@for dir in ${SUB}; do \
		cd $$dir && make clean && cd ..; \
	done

refresh:
	@for dir in ${SUB}; do \
		[ -d $$dir ] || mkdir $$dir; \
		cd $$dir && ln -sf ../Makefile Makefile && \
		make refresh && cd ..; \
	done
