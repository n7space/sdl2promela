import opengeode
from opengeode import ogAST
from sdl2promela.sdl.model import (
    AssignmentTask,
    BinaryExpression,
    Constant,
    Decision,
    Join,
    Label,
    Model,
    NextState,
    Output,
    VariableReference,
    BinaryOperator,
    ForLoopTask,
    ForLoopRange,
    NumericForLoopRange,
)
import os

TEST_DIR: str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR: str = os.path.join(TEST_DIR, "resources")


def read_main_process(path: str, expected_warning_count: int = 0) -> ogAST.Process:
    ast, warnings, errors = opengeode.parse([path])
    assert len(warnings) == expected_warning_count
    assert len(errors) == 0
    assert len(ast.processes) == 1
    return ast.processes[0]


def test_model_reads_states():
    path = os.path.join(RESOURCE_DIR, "only_states.pr")
    process = read_main_process(path)

    model = Model(process)

    # state_1, state_2 and special START state
    assert len(model.states) == 3
    assert model.states["state_1"].name == "state_1"
    assert model.states["state_2"].name == "state_2"


def test_model_reads_inputs():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)

    model = Model(process)

    assert len(model.inputs) == 2
    assert model.inputs["signal_1"].name == "signal_1"
    assert len(model.inputs["signal_1"].transitions) == 1
    assert model.states["state_1"] in model.inputs["signal_1"].transitions.keys()
    assert model.inputs["signal_2"].name == "signal_2"
    assert len(model.inputs["signal_2"].transitions) == 1
    assert model.states["state_2"] in model.inputs["signal_2"].transitions.keys()


def test_model_reads_transitions():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)

    model = Model(process)

    assert len(model.transitions) == 3
    start_tid = 0
    signal_1_tid = next(iter(model.inputs["signal_1"].transitions.values()))
    signal_2_tid = next(iter(model.inputs["signal_2"].transitions.values()))
    assert start_tid in model.transitions.keys()
    assert signal_1_tid in model.transitions.keys()
    assert signal_2_tid in model.transitions.keys()


def test_model_reads_next_state_action():
    path = os.path.join(RESOURCE_DIR, "bare_signals.pr")
    process = read_main_process(path)

    model = Model(process)

    signal_1_tid = next(iter(model.inputs["signal_1"].transitions.values()))
    signal_2_tid = next(iter(model.inputs["signal_2"].transitions.values()))
    signal_1_transition = model.transitions[signal_1_tid]
    signal_2_transition = model.transitions[signal_2_tid]
    assert len(signal_1_transition.actions) == 1
    assert len(signal_2_transition.actions) == 1
    action_1 = signal_1_transition.actions[0]
    assert isinstance(action_1, NextState)
    assert action_1.state_name == "state_2"
    action_2 = signal_2_transition.actions[0]
    assert isinstance(action_2, NextState)
    assert action_2.state_name == "state_1"


def test_model_reads_output():
    path = os.path.join(RESOURCE_DIR, "bare_outputs.pr")
    process = read_main_process(path)

    model = Model(process)

    tid = next(iter(model.inputs["signal_in"].transitions.values()))
    transition = model.transitions[tid]
    assert len(transition.actions) == 2
    action = transition.actions[0]
    assert isinstance(action, Output)
    assert action.name == "signal_out"


def test_model_reads_value_based_decision():
    path = os.path.join(RESOURCE_DIR, "value_based_decision.pr")
    process = read_main_process(path)

    model = Model(process)

    assert len(model.transitions) == 2
    decision = model.transitions[1].actions[0]
    assert isinstance(decision, Decision)
    assert isinstance(decision.condition, VariableReference)
    assert decision.condition.variableName == "tmp"
    assert len(decision.answers) == 2

    assert len(decision.answers[0].conditions) == 1
    assert isinstance(decision.answers[0].conditions[0], BinaryExpression)
    assert decision.answers[0].conditions[0].operator == BinaryOperator.GREATER
    assert decision.answers[0].conditions[0].right.value == "0"
    assert len(decision.answers[0].actions) == 1
    assert isinstance(decision.answers[0].actions[0], NextState)

    assert len(decision.answers[1].conditions) == 1
    assert isinstance(decision.answers[1].conditions[0], BinaryExpression)
    assert decision.answers[1].conditions[0].operator == BinaryOperator.EQUAL
    assert decision.answers[1].conditions[0].right.value == "0"
    assert len(decision.answers[1].actions) == 1
    assert isinstance(decision.answers[1].actions[0], NextState)


def test_model_reads_expression_based_decision():
    path = os.path.join(RESOURCE_DIR, "expression_based_decision.pr")
    process = read_main_process(path)

    model = Model(process)

    assert len(model.transitions) == 2
    decision = model.transitions[1].actions[0]
    assert isinstance(decision, Decision)
    assert isinstance(decision.condition, BinaryExpression)
    assert isinstance(decision.condition.left, VariableReference)
    assert decision.condition.left.variableName == "tmp"
    assert decision.condition.operator == BinaryOperator.GREATER
    assert isinstance(decision.condition.right, Constant)
    assert decision.condition.right.value == "0"
    assert len(decision.answers) == 2

    assert len(decision.answers[0].conditions) == 1
    assert isinstance(decision.answers[0].conditions[0], BinaryExpression)
    assert decision.answers[0].conditions[0].operator == BinaryOperator.EQUAL
    assert decision.answers[0].conditions[0].right.value == "true"
    assert len(decision.answers[0].actions) == 1
    assert isinstance(decision.answers[0].actions[0], NextState)

    assert len(decision.answers[1].conditions) == 1
    assert isinstance(decision.answers[1].conditions[0], BinaryExpression)
    assert decision.answers[1].conditions[0].operator == BinaryOperator.EQUAL
    assert decision.answers[1].conditions[0].right.value == "false"
    assert len(decision.answers[1].actions) == 1
    assert isinstance(decision.answers[1].actions[0], NextState)


def test_model_reads_joins():
    path = os.path.join(RESOURCE_DIR, "join.pr")
    process = read_main_process(path)

    model = Model(process)

    assert len(model.floating_labels) == 1
    label = model.floating_labels["jump"]
    assert label is not None
    assert label.name == "jump"
    assert len(label.actions) == 2
    assert isinstance(label.actions[0], Output)
    assert isinstance(label.actions[1], NextState)

    assert len(model.transitions) == 2
    actions = model.transitions[1].actions
    assert len(actions) == 1
    assert isinstance(actions[0], Join)
    assert actions[0].label_name == "jump"


def test_model_reads_join_based_loop():
    path = os.path.join(RESOURCE_DIR, "loop.pr")
    # There are 2 expected warning regarding the range
    process = read_main_process(path, 2)

    model = Model(process)

    assert len(model.floating_labels) == 0
    assert len(model.transitions) == 2
    actions = model.transitions[1].actions
    assert len(actions) == 6
    assert isinstance(actions[0], AssignmentTask)
    assert isinstance(actions[1], AssignmentTask)
    assert isinstance(actions[2], Label)
    assert actions[2].name == "loop_start"
    assert isinstance(actions[3], Decision)
    decision = actions[3]
    assert len(decision.answers) == 2
    assert len(decision.answers[0].actions) == 0
    assert len(decision.answers[1].actions) == 3
    assert isinstance(decision.answers[1].actions[0], AssignmentTask)
    assert isinstance(decision.answers[1].actions[1], AssignmentTask)
    assert isinstance(decision.answers[1].actions[2], Join)
    assert decision.answers[1].actions[2].label_name == "loop_start"


def test_model_reads_for_with_range():
    path = os.path.join(RESOURCE_DIR, "for_with_range.pr")
    # There are 2 expected warning regarding the range
    process = read_main_process(path, 2)

    model = Model(process)

    assert len(model.transitions) == 2
    actions = model.transitions[1].actions
    assert len(actions) == 3
    task = actions[1]
    assert isinstance(task, ForLoopTask)
    assert len(task.actions) > 0
    assert task.iteratorName.variableName == "x"
    assert isinstance(task.range, NumericForLoopRange)
    assert task.range.start.value == "0"
    assert task.range.stop.value == "10"
    assert task.range.step.value == "2"
