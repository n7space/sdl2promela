from typing import List, Any

import opengeode
from sdl2promela import translator
from sdl2promela import sdl2promela
from sdl2promela.sdl import model as sdlmodel
from sdl2promela.promela import generator as promelagenerator
import os
import io
from tests.utils.utils import assert_lines_match

TEST_DIR: str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR: str = os.path.join(TEST_DIR, "resources")


def read_reference(path: str):
    return io.open(os.path.join(RESOURCE_DIR, path)).readlines()


def dump_lines(path: str, lines: List[str]):
    with open(path, "w") as file:
        file.writelines(lines)


def translate_and_verify(
    path_to_source: str, path_to_reference: str, is_observer: bool = False
):
    effective_path_to_source = os.path.join(RESOURCE_DIR, path_to_source)
    process = sdl2promela.read_process([effective_path_to_source])
    sdl_model = sdlmodel.Model(process)

    promela_model, _ = translator.translate(sdl_model, is_observer)

    stream = io.StringIO()
    promelagenerator.generate_model(promela_model, stream)
    result = stream.readlines()
    dump_lines(effective_path_to_source + ".translated", result)
    reference = read_reference(path_to_reference)
    assert_lines_match(result, reference)


def test_translates_bare_inputs():
    translate_and_verify("bare_signals.pr", "bare_signals.pml")


def test_translates_bare_outputs():
    translate_and_verify("bare_outputs.pr", "bare_outputs.pml")


def test_translates_value_based_decision():
    translate_and_verify("value_based_decision.pr", "value_based_decision.pml")


def test_translates_expression_based_decision():
    translate_and_verify(
        "expression_based_decision.pr", "expression_based_decision.pml"
    )


def test_translates_for_with_range():
    translate_and_verify("for_with_range.pr", "for_with_range.pml")


def test_translates_for_each():
    translate_and_verify("for_each.pr", "for_each.pml")


def test_translates_loop():
    translate_and_verify("loop.pr", "loop.pml")


def test_translates_join():
    translate_and_verify("join.pr", "join.pml")


def test_translates_internal_procedures():
    translate_and_verify("internal_procedures.pr", "internal_procedures.pml")


def test_translates_variable_init():
    translate_and_verify("variable_init.pr", "variable_init.pml")


def test_translates_decision():
    translate_and_verify("decision.pr", "decision.pml")


def test_translates_empty_transition():
    translate_and_verify("empty_transition.pr", "empty_transition.pml")


def test_translates_simple_choice_access():
    translate_and_verify("simple_choice_access.pr", "simple_choice_access.pml")


def test_translates_informal_text():
    translate_and_verify("informal_text.pr", "informal_text.pml")


def test_translates_conditional_expression():
    translate_and_verify("conditional_expression.pr", "conditional_expression.pml")


def test_translates_asn1_constant():
    translate_and_verify("asn1_constant.pr", "asn1_constant.pml")


def test_translates_any():
    translate_and_verify("decision_any.pr", "decision_any.pml", True)


def test_translates_complex_sequence_assignment():
    translate_and_verify(
        "complex_sequence_assignment.pr", "complex_sequence_assignment.pml"
    )


def test_translates_complex_sequence_assignment2():
    translate_and_verify(
        "complex_sequence_assignment2.pr", "complex_sequence_assignment2.pml"
    )


def test_translates_complex_choice_assignment():
    translate_and_verify(
        "complex_choice_assignment.pr", "complex_choice_assignment.pml"
    )


def test_translates_timer_with_camelcase_name():
    translate_and_verify(
        "timer_with_camelcase_name.pr", "timer_with_camelcase_name.pml"
    )


def test_translates_octet_string_length():
    translate_and_verify("octet_string_length.pr", "octet_string_length.pml")


def test_translates_assignment_to_element_of_octet_string():
    translate_and_verify(
        "assignment_to_element_of_octet_string.pr",
        "assignment_to_element_of_octet_string.pml",
    )


def test_translates_lowercase_process_name():
    translate_and_verify("lowercase_process_name.pr", "lowercase_process_name.pml")


def test_translates_double_label():
    translate_and_verify("double_label.pr", "double_label.pml")


def test_sequence_field_escape():
    translate_and_verify("sequence_field_escape.pr", "sequence_field_escape.pml")


def test_choice_selector_case():
    translate_and_verify("choice_selector_case.pr", "choice_selector_case.pml")


def test_empty_sequence_assignment():
    translate_and_verify(
        "empty_sequence_assignment.pr", "empty_sequence_assignment.pml"
    )


def test_alternative():
    translate_and_verify("alternative.pr", "alternative.pml")


def test_alternative_with_terminator():
    translate_and_verify(
        "alternative_with_terminator.pr", "alternative_with_terminator.pml"
    )


def test_translates_procedure_labels():
    translate_and_verify("procedure_labels.pr", "procedure_labels.pml")
