from typing import List, Union, Any, Optional, Tuple, Dict, Set

from .utils import *
from .system_capability import SystemCapability
from .sdl import model as sdlmodel


class Context:
    """Translator context."""

    sdl_model: sdlmodel.Model
    """Model that is being translated."""

    is_observer: bool
    """Flag to  indicate if translated model is observer."""

    parents: List[Any]
    """Stack of objects that are being translated."""

    in_transition_chain: bool
    """
    Flag to specify if a chain of transitions is generated.
    It is used for generation of entry inlines for parallel states.
    """

    loop_level: int
    """
    Level for nested loops.
    """

    required_capabilities: Set[SystemCapability]

    missing_type: Optional[Asn1Type]

    state_aggregation: bool

    _temporary_variable_counter: int

    def __init__(self, sdl_model: sdlmodel.Model):
        self.sdl_model = sdl_model
        self.is_observer = False
        self.parents = []
        self.in_transition_chain = False
        self.loop_level = 0
        self.required_capabilities = set()
        self.missing_type = None
        self.state_aggregation = False
        self._temporary_variable_counter = 0

    def push_parent(self, parent: Any):
        """
        Push parent onto the parent stack.
        :param parent: Parent to be pushed.
        """
        self.parents.append(parent)

    def pop_parent(self):
        """
        Remove the current parent from the stack.
        """
        self.parents.pop()

    def get_parent_transition(self) -> Optional[sdlmodel.Transition]:
        """
        Return the current parent transition.
        :returns: Current parent transition, or None if outside of any.
        """
        for parent in reversed(self.parents):
            if isinstance(parent, sdlmodel.Transition):
                return parent
        return None

    def get_parent_procedure(self) -> Optional[sdlmodel.Procedure]:
        """
        Return the current parent procedure.
        :returns: Current parent procedure, or None if outside of any.
        """
        for parent in reversed(self.parents):
            if isinstance(parent, sdlmodel.Procedure):
                return parent
        return None

    def enter_loop(self):
        """
        Increment loop_level counter.
        """
        self.loop_level = self.loop_level + 1

    def leave_loop(self):
        """
        Decrement loop_level counter.
        """
        self.loop_level = self.loop_level - 1

    def generate_temporary_variable(self) -> str:
        """
        Generate name for temporary variable.

        :returns: Unique name for temporary variable.
        """
        result = f"_tmp_{self._temporary_variable_counter}"
        self._temporary_variable_counter = self._temporary_variable_counter + 1
        return result

    def get_transition_variable(self) -> str:
        """
        Getter for name of variable transition.

        :reutnrs: Name of transition id variable associated with SDL process.
        """

        return self.sdl_model.process_name.lower() + "_transition_id"

    def get_observer_transition_variable(self) -> str:
        """
        Getter for name of variable transition for observer.

        :reutnrs: Name of transition id variable associated with observer SDL.
        """
        return self.sdl_model.process_name.lower() + "_observer_transition_id"

    def get_continuous_signals_label(self) -> str:
        """
        Getter for name label for continuous_signals

        :reutnrs: Name of label.
        """
        return self.sdl_model.process_name.lower() + "_continuous_signals"
