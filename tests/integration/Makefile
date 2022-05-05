TESTS= \
	simplesignals \
	parameterless \
	simpleparameters \
	flowcontrol \
	stop_condition_eventually \
	stop_condition_never_filter_out \
	stop_condition_present \
	stop_condition_length \
	stop_condition_exist \
	asn1_sequence \
	asn1_sequenceof \
	asn1_sequenceof_fixed \
	asn1_octetstring \
	asn1_octetstring_fixed \
	asn1_choice \
	integer_expressions \
	relation_expressions \
	boolean_expressions \
	continuous_signal_simple \
	boolean_generator \
	function_types \
	context_variables \
	context_variables_and_function_types \
	state_symbols \
	input_observer \
	dekker

.PHONY: $(TESTS) check

check: $(TESTS)

$(TESTS):
	${MAKE} -C $@ check
