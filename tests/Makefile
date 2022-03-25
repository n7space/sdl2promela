SRC_DIR = ../

.PHONY : \
	check \
	unit \
	integration

unit:
	${MAKE} -C $@ check

integration:
	${MAKE} -C $@ check

check: unit integration
