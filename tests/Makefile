SRC_DIR = ../

TESTS = \
	sdl/test_model.py \
	promela/test_model.py \
	translator/test_translator.py \
	stop_condition/test_scl_parser.py

.PHONY : \
	check \
	unit \
	integration \
	parameterless \
	simpleparameters \
	flowcontrol \
	stop_condition_eventually \
	stop_condition_never_filter_out \
	stop_condition_present

unit: ${TESTS}
	PYTHONPATH=${SRC_DIR} python3 -m pytest ${TESTS} -vv

integration:
	${MAKE} -C integration check

parameterless:
	${MAKE} -C parameterless check

simpleparameters:
	${MAKE} -C simpleparameters check

flowcontrol:
	${MAKE} -C flowcontrol check

stop_condition_eventually:
	${MAKE} -C stop_condition_eventually check

stop_condition_never_filter_out:
	${MAKE} -C stop_condition_never_filter_out check

stop_condition_present:
	${MAKE} -C stop_condition_present check

check: unit \
	integration \
	parameterless \
	simpleparameters \
	flowcontrol \
	stop_condition_eventually \
	stop_condition_never_filter_out \
	stop_condition_present
