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
	dekker \
	nested_states \
	nested_states_entry_exit \
	parallel_states \
	signal_parameters \
	signal_value_parameters \
	parallel_states_recent \
	nested_states_recent \
	stop_condition_nested_state \
	stop_condition_parallel_state \
	stop_condition_get_state_nested \
	stop_condition_get_state_parallel \
	stop_condition_empty_len \
	stop_condition_queue_last \
	stop_condition_queue_last_eventually \
	stop_condition_queue_last_filter_out \
	builtin_functions \
	timers \
	stop_condition_function_type \
	output_observer \
	output_observer_env \
	multi_output_observer \
	observer_partial_specification \
	output_observer_duplicate

.PHONY: $(TESTS) check

check: $(TESTS)

$(TESTS):
	${MAKE} -C $@ check
