from typing import List, Dict, Optional
from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .utils import Asn1Type, resolve_asn1_type
from .promela.modelbuilder import (
    CallBuilder,
    AssignmentBuilder,
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
    "float",
    "fix",
]


def __check_parameters(
    parameters: List[promelamodel.Expression], count: int, function: str
) -> None:
    if len(parameters) != count:
        raise ValueError(
            f"{function} built-in function expected {count} arguments, but received {len(parameters)}."
        )
    for i in range(count):
        if parameters[i] is None:
            raise ValueError(f"{function} received None parameter.")


def __translate_writeln(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> Optional[promelamodel.Expression]:
    """
    "writeln" does not make sense for a model checker, so it is quietly removed.
    As it is removed, the number and existence of parameters does not matter.
    """
    return None


def __translate_length(
    call: sdlmodel.ProcedureCall,
    parameters: List[promelamodel.Expression],
    types: List[Asn1Type],
    allTypes: Dict[str, Asn1Type],
) -> promelamodel.Expression:
    __check_parameters(parameters, 1, "length")
    if (
        not isinstance(parameters[0], promelamodel.VariableReference)
        and not isinstance(parameters[0], promelamodel.MemberAccess)
        and not isinstance(parameters[0], promelamodel.ArrayAccess)
    ):
        raise ValueError("Invalid type of parameter for length")

    realType = resolve_asn1_type(allTypes, types[0])

    if realType.kind not in [
        "SequenceOfType",
        "OctetStringType",
        "BitStringType",
        "IA5StringType",
    ]:
        err = "Invalid parameter for length call, expected one of: "
        err += "SequenceOfType, OctetStringType, BitStringType, IA5StringType, "
        err += f"got {realType.kind}"
        raise ValueError(err)

    if realType.Min == realType.Max:
        # If Min == Max then the array type (SEQUENCE OF or STRING)
        # has fixed size
        # If the SEQUENCE OF has fixed size, then the usage
        # of length is valid, but the datatype in promela
        # has no field, which determines actual number of elements
        # In such case integer value is returned
        return promelamodel.IntegerValue(int(realType.Max))
    else:
        return (
            MemberAccessBuilder()
            .withUtypeReference(parameters[0])
            .withMember(VariableReferenceBuilder("length").build())
            .build()
        )


def __translate_present(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
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
) -> promelamodel.Expression:
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
) -> promelamodel.Expression:
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
) -> promelamodel.Expression:
    __check_parameters(parameters, 1, "num")
    return parameters[0]


def __translate_val(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
    __check_parameters(parameters, 2, "val")
    return parameters[0]


def __translate_exist(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
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


def __translate_float(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
    __check_parameters(parameters, 1, "float")
    return parameters[0]


def __translate_fix(
    call: sdlmodel.ProcedureCall, parameters: List[promelamodel.Expression]
) -> promelamodel.Expression:
    __check_parameters(parameters, 1, "fix")
    return parameters[0]


def is_builtin(call_name: str) -> bool:
    """
    Is the given call referring to a built-in function?
    :param call_name: Name of the called function.
    :returns: Whether the call is referring to a built-in function.
    """
    return call_name.lower() in __BUILTIN_NAMES


def translate_builtin(
    call: sdlmodel.ProcedureCall,
    parameters: List[promelamodel.Expression],
    types: List[Asn1Type],
    allTypes: Dict[str, Asn1Type],
) -> Optional[promelamodel.Expression]:
    """
    Translate a built-in function.
    :param call: Call to be translated.
    :param parameters: List of translated call parameters.
    :param types: List of types of parameters.
    :param allTypes: All available asn1 datatypes
    :returns: Translation of the call, might be None.
    """
    if call.name.lower() == "writeln":
        return __translate_writeln(call, parameters)
    elif call.name.lower() == "length":
        return __translate_length(call, parameters, types, allTypes)
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
    elif call.name.lower() == "float":
        return __translate_float(call, parameters)
    elif call.name.lower() == "fix":
        return __translate_fix(call, parameters)
    raise NotImplementedError(f"Builtin {call.name} is not yet implemented")


def translate_assignment(
    inlineName: Optional[str],
    call: sdlmodel.ProcedureCall,
    left: promelamodel.VariableReference,
    parameters: List[promelamodel.Expression],
    types: List[Asn1Type],
    allTypes: Dict[str, Asn1Type],
) -> promelamodel.Statement:
    """
    Translate an assignment, where right side is built-in function.

    :param inlineName: name of inline, which assigns value, or None when
                       assignment shall be used
    :param call: Call to be translated.
    :param parameters: List of translated call parameters.
    :param types: List of types of parameters.
    :param allTypes: All available asn1 datatypes
    :returns: promela statement, which is translated version of SDL assignment
    """
    right = translate_builtin(call, parameters, types, allTypes)
    if right is None:
        raise Exception(
            f"Builtin {call.name} cannot be used on the right side of assignment"
        )
    if inlineName is None:
        return AssignmentBuilder().withTarget(left).withSource(right).build()
    else:
        return (
            CallBuilder()
            .withTarget(inlineName)
            .withParameter(left)
            .withParameter(right)
            .build()
        )
