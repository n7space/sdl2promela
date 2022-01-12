from typing import List, Dict
from multipledispatch import dispatch
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR


class State:
    """SDL state."""

    name: str
    """State name."""

    def __init__(self):
        self.name = None


class Parameter:
    """Parameter for a signal or procedure."""

    name: str
    """Parameter name."""

    def __init__(self):
        self.name = None


class Input:
    """Input signal for an SDL state machine."""

    name: str
    """Signal name."""
    parameters: List[Parameter]
    """List of signal parameters."""
    transitions: Dict[int, State]
    """Map associating transition IDs with states."""

    def __init__(self):
        self.name = None
        self.parameters = []
        self.transitions = {}


class Action:
    """Base class for a transition action."""

    pass


class Task(Action):
    """Task action."""

    pass


class Output(Action):
    """Signal output action."""

    name: str
    """Signal name."""
    parameters: List[Parameter]
    """Output signal parameters."""

    def __init__(self):
        self.name = None
        self.parameters = []


class Terminator(Action):
    """Terminator action."""

    pass


class NextState(Terminator):
    """Next state action."""

    state_name: str
    """Next state name."""

    def __init__(self):
        self.state_name = None


class Label(Action):
    """Label action."""

    pass


class Answer:
    """Answer to a Decision."""

    pass


class Decision(Action):
    """Decision action."""

    answers: List[Answer]
    """List of possible answers."""

    def __init__(self):
        self.answers = []


class Transition:
    """SDL state machine transition."""

    id: int
    """Transition ID."""
    actions: List[Action]
    """List of transition actions."""

    def __init__(self):
        self.id = 0
        self.actions = []


@dispatch
def convert(source) -> Action:
    """
    Convert OpenGEODE's action to a simplified action.
    :param source: Action object, as retrieved from the OpenGEODE's parser.
    :returns: Simplified action object.
    """
    raise NotImplementedError("convert not implemented for " + source)


@dispatch(ogAST.PrimVariable)
def convert(source: ogAST.PrimVariable):
    return source.inputString


@dispatch(ogAST.Output)
def convert(source: ogAST.Output) -> Action:
    output = Output()
    # TODO handle parameters
    output.name = source.output[0]["outputName"]
    output.parameters = [
        convert(expression) for expression in source.output[0]["params"]
    ]
    return output


@dispatch(ogAST.Terminator)
def convert(source: ogAST.Terminator) -> Action:
    if source.kind == "next_state":
        if source.inputString == "-":
            return None  # No state switch
        next_state = NextState()
        next_state.state_name = source.inputString
        return next_state
    else:
        raise ValueError("Unsupported terminator type: " + source)
    return None


class Model:
    """SDL model in a simplified, normalized form (with no nested or parallel states)."""

    process_name: str
    """SDL process name."""
    states: Dict[str, State]
    """Map associating state names with the states themselves."""
    inputs: Dict[str, Input]
    """Map associating input signal names with the signals themselves."""
    transitions: Dict[int, Transition]
    """Map associating transition IDs with the transitions themselves."""
    source: ogAST.Process
    """The source (complex, as retrieved from the parser) SDL model."""

    def __init__(self, process: ogAST.Process):
        self.source = process
        Helper.flatten(process, sep=SEPARATOR)
        self.process_name = process.processName
        self.states = {}
        self.inputs = {}
        self.transitions = {}
        self.__gather_states()
        self.__gather_inputs()
        self.__gather_transitions()

    def __gather_states(self):
        # Source state names from mapping, as they should be already flattened
        # and decomposed
        for stateName in self.source.mapping:
            state = State()
            state.name = stateName
            self.states[stateName] = state

    def __get_inputs_of_name(self, name: str) -> List[ogAST.Input]:
        result = set()
        for inputs in self.source.mapping.values():
            if isinstance(inputs, List):
                for input in inputs:
                    if isinstance(input, ogAST.Input) and (name in input.inputlist):
                        result.add(input)
        return list(result)

    def __get_input_parameters(self, input_name: str) -> List[Parameter]:
        inputs = self.__get_inputs_of_name(input_name)
        if len(inputs) == 0:
            return []
        result = []
        # All inputs of the same name should have the same parameters,
        # so the first one should be good enough
        input = inputs[0]
        for parameterName in input.parameters:
            parameter = Parameter()
            parameter.name = parameterName
            result.append(parameter)
        return result

    def __gather_inputs(self):
        # Gather all inputs and their parameters
        for inputSignal in self.source.input_signals:
            input = Input()
            input.name = inputSignal["name"]
            input.parameters = self.__get_input_parameters(input.name)
            input.transitions = {}
            self.inputs[input.name] = input
        # Build transition list
        for state_name, input_list in self.source.mapping.items():
            target = self.states[state_name]
            if not isinstance(input_list, List):
                continue
            # TODO - adjust for multiple inputs in inputString
            for input in input_list:
                id = input.transition_id
                for singleInput in input.inputlist:
                    trigger = self.inputs[singleInput]
                    trigger.transitions[id] = target

    def __convert_transition(self, source: ogAST.Transition) -> Transition:
        transition = Transition()
        transition.actions = []
        for source_action in source.actions:
            action = convert(source_action)
            if action is not None:
                transition.actions.append(action)
        for terminator in source.terminators:
            action = convert(terminator)
            if action is not None:
                transition.actions.append(action)
        return transition

    def __gather_transitions(self):
        for i in range(0, len(self.source.transitions)):
            self.transitions[i] = self.__convert_transition(self.source.transitions[i])
            self.transitions[i].id = i
