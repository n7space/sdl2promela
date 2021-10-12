SRC_DIR = ../

TESTS = \
	sdl/test_sdl.py

.PHONY : check

check: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS}