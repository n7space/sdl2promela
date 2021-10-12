import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
import opengeode
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR

class State:
    name : str

class Parameter:
    name : str

class Input:
    name : str
    parameters : List[Parameter]
    transitions : Dict[int, State]

class Model:
    process_name : str
    states : Dict[str, State]
    inputs : Dict[str, Input]
    transitions : Dict[int, ogAST.Transition]
    source : ogAST.Process

    def __init__(self, process : ogAST.Process):
        self.source = process
        Helper.flatten(process, sep=SEPARATOR)
        self.process_name = process.processName
        self.states = {}
        self.inputs = {}
        self.transitions = {}
        self._gather_states()
        self._gather_inputs()

    def _gather_states(self):
        # Source state names from mapping, as they should be already flattened
        # and decomposed
        for stateName in self.source.mapping:
            state = State()
            state.name = stateName
            self.states[stateName] = state

    def _get_inputs_of_name(self, name : str) -> List[ogAST.Input]:
        result = set()
        for inputs in self.source.mapping.values():
            if isinstance(inputs, List):
                for input in inputs:
                    if isinstance(input, ogAST.Input) and (name in input.inputlist):
                        result.add(input)
        return list(result)

    def _get_input_parameters(self, input_name : str) -> List[Parameter]:
        inputs = self._get_inputs_of_name(input_name)
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

    def _gather_inputs(self):
        # Gather all inputs and their parameters
        for inputSignal in self.source.input_signals:
            input = Input()
            input.name = inputSignal['name']
            input.parameters = self._get_input_parameters(input.name)
            input.transitions = {}
            self.inputs[input.name] = input
        # Build transition list
        for state_name in self.source.mapping:
            target = self.states[state_name]
            input_list = self.source.mapping[state_name]
            if not isinstance(input_list, List):
                continue
            # TODO - adjust for multiple inputs in inputString
            for input in input_list:
                id = input.transition_id
                trigger = self.inputs[input.inputString]
                trigger.transitions[id] = target
