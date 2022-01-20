SRC_DIR = ../

TESTS = \
	sdl/test_model.py \
	promela/test_model.py \
	translator/test_translator.py

.PHONY : \
	check \
	unit \
	integration \
	parameterless \
	simpleparameters

unit: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS} -vv

integration:
	${MAKE} -C integration check

parameterless:
	${MAKE} -C parameterless check

simpleparameters:
	${MAKE} -C simpleparameters check

check: unit integration parameterless simpleparameters
