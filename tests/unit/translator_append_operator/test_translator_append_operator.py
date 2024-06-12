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

    promela_model = translator.translate(sdl_model, is_observer)

    stream = io.StringIO()
    promelagenerator.generate_model(promela_model, stream)
    result = stream.readlines()
    dump_lines(effective_path_to_source + ".translated", result)
    reference = read_reference(path_to_reference)
    assert_lines_match(result, reference)


def test_translates_sequenceof_append_asn():
    translate_and_verify("sequenceof_append_asn.pr", "sequenceof_append_asn.pml")


def test_translates_sequenceof_append_variable():
    translate_and_verify(
        "sequenceof_append_variable.pr", "sequenceof_append_variable.pml"
    )


def test_translates_sequenceof_concatenate_asn():
    translate_and_verify(
        "sequenceof_concatenate_asn.pr", "sequenceof_concatenate_asn.pml"
    )


def test_translates_sequenceof_concatenate_variable():
    translate_and_verify(
        "sequenceof_concatenate_variable.pr", "sequenceof_concatenate_variable.pml"
    )


def test_translates_sequenceof_concatenate_asn_self():
    translate_and_verify(
        "sequenceof_concatenate_asn_self.pr", "sequenceof_concatenate_asn_self.pml"
    )


def test_translates_sequenceof_concatenate_variable_self():
    translate_and_verify(
        "sequenceof_concatenate_variable_self.pr",
        "sequenceof_concatenate_variable_self.pml",
    )
