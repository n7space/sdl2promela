SRC_DIR = ../

TESTS = \
	sdl/test_model.py \
	promela/test_model.py

.PHONY : check

check: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS}