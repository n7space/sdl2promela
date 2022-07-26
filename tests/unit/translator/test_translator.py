import typing
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


def translate_and_verify(path_to_source: str, path_to_reference: str):
    effective_path_to_source = os.path.join(RESOURCE_DIR, path_to_source)
    process = sdl2promela.read_process([effective_path_to_source])
    sdl_model = sdlmodel.Model(process)

    promela_model = translator.translate(sdl_model)

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
