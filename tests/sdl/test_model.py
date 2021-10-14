import opengeode
from opengeode import ogAST
from sdl2promela.sdl.model import Model, NextState, Output
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

def test_model_reads_inputs():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)
    model = Model(process)
    assert(len(model.inputs) == 2)
    assert(model.inputs['signal_1'].name == 'signal_1')
    assert(len(model.inputs['signal_1'].transitions) == 1)
    assert(model.states['state_1'] in model.inputs['signal_1'].transitions.values())
    assert(model.inputs['signal_2'].name == 'signal_2')
    assert(len(model.inputs['signal_2'].transitions) == 1)
    assert(model.states['state_2'] in model.inputs['signal_2'].transitions.values())

def test_model_reads_transitions():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)
    model = Model(process)
    assert(len(model.transitions) == 3)
    start_tid = 0
    signal_1_tid = next(iter(model.inputs['signal_1'].transitions))
    signal_2_tid = next(iter(model.inputs['signal_2'].transitions))
    assert(start_tid in model.transitions.keys())
    assert(signal_1_tid in model.transitions.keys())
    assert(signal_2_tid in model.transitions.keys())

def test_mode_reads_next_state_action():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)
    model = Model(process)
    signal_1_tid = next(iter(model.inputs['signal_1'].transitions))
    signal_2_tid = next(iter(model.inputs['signal_2'].transitions))
    signal_1_transition = model.transitions[signal_1_tid]
    signal_2_transition = model.transitions[signal_2_tid]
    assert(len(signal_1_transition.actions) == 1)
    assert(len(signal_2_transition.actions) == 1)
    action_1 = signal_1_transition.actions[0]
    assert(isinstance(action_1, NextState))
    assert(action_1.state_name == 'state_2')
    action_2 = signal_2_transition.actions[0]
    assert(isinstance(action_2, NextState))
    assert(action_2.state_name == 'state_1')

def test_mode_reads_output():
    path = os.path.join(RESOURCE_DIR, "bare_outputs.pr")
    process = read_main_process(path)
    model = Model(process)
    tid = next(iter(model.inputs['signal_in'].transitions))
    transition = model.transitions[tid]
    assert(len(transition.actions) == 2)
    action = transition.actions[0]
    assert(isinstance(action, Output))
    assert(action.name == "signal_out")

