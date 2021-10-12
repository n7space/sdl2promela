import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
import opengeode
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR

class State:
    name : str = ""

class Parameter:
    name : str = ""

class Input:
    name : str = ""
    parameters : List[Parameter] = []
    transition_id : int = -1
    from_states : List[State] = []

class Model:
    process_name : str = ""
    states : Dict[str, State] = {}
    inputs : Dict[str, Input] = {}
    transitions : Dict[int, ogAST.Transition]
    source : ogAST.Process

    def __init__(self, process : ogAST.Process):
        self.source = process
        Helper.flatten(process, sep=SEPARATOR)
        self.process_name = process.processName
        self._gather_states()

    def _gather_states(self):
        for stateName in self.source.mapping:
            state = State()
            state.name = stateName
            self.states[stateName] = state
