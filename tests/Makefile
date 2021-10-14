SRC_DIR = ../

TESTS = \
	sdl/test_model.py \
	promela/test_model.py \
	translator/test_translator.py

.PHONY : \
	check \
	unit \
	integration

unit: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS}

integration:
	${MAKE} -C integration check

check: unit integration
