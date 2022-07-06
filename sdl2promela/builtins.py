from typing import List
from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .promela.modelbuilder import (
    CallBuilder,
    MemberAccessBuilder,
    VariableReferenceBuilder,
    BinaryExpressionBuilder,
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


def __check_parameters(
    parameters: List[promelamodel.Expression], count: int, function: str
):
    if len(parameters) != count:
        raise ValueError(
            f"{function} built-in function expected {count} arguments, but received {len(parameters)}."
        )
    for i in range(count):
        if parameters[i] is None:
            raise ValueError(f"{function} received None parameter.")


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
    __check_parameters(parameters, 1, "length")
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
    __check_parameters(parameters, 1, "present")
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
    __check_parameters(parameters, 2, "to_enum")
    # The first argument is a choice determinant, the second is enum type
    # which is ignored.
    # The current implementation does not support enumerated with
    # explicit declared values.
    return (
        BinaryExpressionBuilder(promelamodel.BinaryOperator.SUBTRACT)
        .withLeft(parameters[0])
        .withRight(promelamodel.IntegerValue(1))
        .build()
    )


def __translate_to_selector(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    __check_parameters(parameters, 2, "to_selector")
    # The first argument is an enum , the second is choice type
    # which is ignored.
    # The current implementation does not support enumerated with
    # explicit declared values.
    return (
        BinaryExpressionBuilder(promelamodel.BinaryOperator.ADD)
        .withLeft(parameters[0])
        .withRight(promelamodel.IntegerValue(1))
        .build()
    )


def __translate_num(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    __check_parameters(parameters, 1, "num")
    return parameters[0]


def __translate_val(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    __check_parameters(parameters, 2, "val")
    return parameters[0]


def __translate_exist(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
):
    __check_parameters(parameters, 1, "exist")
    if not isinstance(parameters[0], promelamodel.MemberAccess):
        raise ValueError("Invalid type of parameter for Exist")

    field_name = parameters[0].member.name

    return (
        MemberAccessBuilder()
        .withUtypeReference(
            MemberAccessBuilder()
            .withUtypeReference(parameters[0].utype)
            .withMember(VariableReferenceBuilder("exist").build())
            .build()
        )
        .withMember(VariableReferenceBuilder(field_name).build())
        .build()
    )


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
    elif call.name.lower() == "exist":
        return __translate_exist(call, parameters)
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
    if call.name.lower() == "exist":
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(__translate_exist(call, parameters))
            .build()
        )
    else:
        raise NotImplementedError(f"Built in {call.name} is not yet implemented")
