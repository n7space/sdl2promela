import opengeode
from opengeode import ogAST
from sdl2promela.sdl import Model
import os

TEST_DIR : str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR : str = os.path.join(TEST_DIR, "resources")

def read_main_process(path : str) -> ogAST.Process:
    try:
        ast, warnings, errors = opengeode.parse([path])
        assert(len(warnings) == 0)
        assert(len(errors) == 0)
        assert(len(ast.processes) == 1)
        return ast.processes[0]
    except BaseException as error:
        print("Exception when reading main process: {0}".format(error))
        assert(False)
        return None

def test_model_reads_states():
    path = os.path.join(RESOURCE_DIR, "only_states.pr")
    process = read_main_process(path)
    model = Model(process)
    # state_1, state_2 and special START state
    assert(len(model.states) == 3)
    assert(model.states["state_1"].name == "state_1")
    assert(model.states["state_2"].name == "state_2")
