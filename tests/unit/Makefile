SRC_DIR = ../../

TESTS = \
	sdl/test_model.py \
	promela/test_model.py \
	translator/test_translator.py \
	stop_condition/test_scl_parser.py

.PHONY : \
	check \
	unit

unit: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS} -vv

check: unit
