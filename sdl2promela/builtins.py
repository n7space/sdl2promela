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

__BUILTIN_NAMES = [
    "writeln",
    "length",
    "present",
    "to_enum",
    "to_selector",
    "num",
    "val",
    "exist",
]


def __translate_writeln(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Statement:
    """
    "writeln" does not make sense for a model checker, so it is quietly removed.
    As it is removed, the number and existence of parameters does not matter.
    """
    return None


def __translate_length(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
    if len(parameters) != 1:
        raise ValueError(
            f"Length built-in function expected 1 arguments, but received {len(parameters)}."
        )
    if parameters[0] is None:
        raise ValueError("Length queried entity is missing.")
    if (
        not isinstance(parameters[0], promelamodel.VariableReference)
        and not isinstance(parameters[0], promelamodel.MemberAccess)
        and not isinstance(parameters[0], promelamodel.ArrayAccess)
    ):
        raise ValueError("Invalid type of parameter for length")

    return (
        MemberAccessBuilder()
        .withUtypeReference(parameters[0])
        .withMember(VariableReferenceBuilder("length").build())
        .build()
    )


def __translate_present(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    if len(parameters) != 1:
        raise ValueError(
            f"Present built-in function expected 1 argument, but received {len(parameters)}."
        )
    if parameters[0] is None:
        raise ValueError("Present queried entity is missing.")
    if (
        not isinstance(parameters[0], promelamodel.VariableReference)
        and not isinstance(parameters[0], promelamodel.MemberAccess)
        and not isinstance(parameters[0], promelamodel.ArrayAccess)
    ):
        raise ValueError("Invalid type of parameter for present")

    return (
        MemberAccessBuilder()
        .withUtypeReference(parameters[0])
        .withMember(VariableReferenceBuilder("selection").build())
        .build()
    )


def __translate_to_enum(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    if len(parameters) != 2:
        raise ValueError(
            f"to_enum built-in function expected 2 arguments, but received {len(parameters)}."
        )
    return parameters[0]


def __translate_to_selector(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    if len(parameters) != 2:
        raise ValueError(
            f"to_selector built-in function expected 2 arguments, but received {len(parameters)}."
        )
    return parameters[0]


def __translate_num(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    if len(parameters) != 1:
        raise ValueError(
            f"num built-in function expected 2 arguments, but received {len(parameters)}."
        )
    return parameters[0]


def __translate_val(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    if len(parameters) != 2:
        raise ValueError(
            f"val built-in function expected 2 arguments, but received {len(parameters)}."
        )
    return parameters[0]


def is_builtin(call_name: str) -> bool:
    """
    Is the given call referring to a built-in function?
    :param call_name: Name of the called function.
    :returns: Whether the call is referring to a built-in function.
    """
    return call_name.lower() in __BUILTIN_NAMES


def translate_builtin(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Statement:
    """
    Translate a built-in function.
    :param call: Call to be translated.
    :param parameters: List of translated call parameters.
    :returns: Translation of the call, might be None.
    """
    if call.name.lower() == "writeln":
        return __translate_writeln(call, parameters)
    elif call.name.lower() == "length":
        return __translate_length(call, parameters)
    elif call.name.lower() == "present":
        return __translate_present(call, parameters)
    elif call.name.lower() == "to_enum":
        return __translate_to_enum(call, parameters)
    elif call.name.lower() == "to_selector":
        return __translate_to_selector(call, parameters)
    elif call.name.lower() == "val":
        return __translate_val(call, parameters)
    elif call.name.lower() == "num":
        return __translate_num(call, parameters)
    raise NotImplementedError(f"Built in {call.name} is not yet implemented")


def translate_assignment(
    inlineName: str,
    call: sdlmodel.ProcedureCall,
    left: promelamodel.Expression,
    parameters: List[promelamodel.Expression],
):
    if call.name.lower() == "length":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_length(call, parameters))
            .build()
        )
    if call.name.lower() == "present":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_present(call, parameters))
            .build()
        )
    if call.name.lower() == "to_enum":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_to_enum(call, parameters))
            .build()
        )
    if call.name.lower() == "to_selector":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_to_selector(call, parameters))
            .build()
        )
    if call.name.lower() == "val":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_val(call, parameters))
            .build()
        )
    if call.name.lower() == "num":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_num(call, parameters))
            .build()
        )
    else:
        raise NotImplementedError(f"Built in {call.name} is not yet implemented")
