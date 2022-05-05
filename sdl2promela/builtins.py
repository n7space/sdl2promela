from typing import List
from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .promela.modelbuilder import (
    AssignmentBuilder,
    CallBuilder,
    InlineBuilder,
    MemberAccessBuilder,
    VariableReferenceBuilder,
    VariableDeclarationBuilder,
)

__BUILTIN_NAMES = ["writeln", "length"]


def __translate_writeln(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Statement]
) -> promelamodel.Statement:
    """
    "writeln" does not make sense for a model checker, so it is quietly removed.
    As it is removed, the number and existence of parameters does not matter.
    """
    return None


def __translate_length(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Statement]
) -> promelamodel.Statement:
    """
    Length assigns an integer scalar, so there is no need to pack it into assign_value call
    """
    if len(parameters) != 2:
        # Length requires 2 arguments: first one is the result, the second one is the queried entity
        raise ValueError(
            f"Length built-in function expected 2 arguments (1 out and 1 in), but received {len(parameters)}."
        )
    if parameters[0] is None:
        raise ValueError(f"Length assignment target is missing.")
    if parameters[1] is None:
        raise ValueError(f"Length queried entity is missing.")
    return (
        AssignmentBuilder()
        .withTarget(parameters[0])
        .withSource(
            MemberAccessBuilder()
            .withUtypeReference(parameters[1])
            .withMember(VariableReferenceBuilder("length").build())
            .build()
        )
        .build()
    )


def is_builtin(call_name: str) -> bool:
    """
    Is the given call referring to a built-in function?
    :param call_name: Name of the called function.
    :returns: Whether the call is referring to a built-in function.
    """
    return call_name in __BUILTIN_NAMES


def translate_builtin(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Statement]
) -> promelamodel.Statement:
    """
    Translate a built-in function.
    :param call: Call to be translated.
    :param parameters: List of translated call parameters.
    :returns: Translation of the call, might be None.
    """
    if call.name == "writeln":
        return __translate_writeln(call, parameters)
    elif call.name == "length":
        return __translate_length(call, parameters)
    raise NotImplementedError(f"Built in {call.name} is not yet implemented")
