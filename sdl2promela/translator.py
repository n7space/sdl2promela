from typing import List, Union, Any, Optional, Tuple
from multipledispatch import dispatch

from opengeode.AdaGenerator import SEPARATOR
from opengeode.Helper import find_basic_type

import copy
import typing

from . import builtins
from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .promela.modelbuilder import (
    AssignmentBuilder,
    CallBuilder,
    InlineBuilder,
    VariableDeclarationBuilder,
)
from .promela.modelbuilder import VariableReferenceBuilder
from .promela.modelbuilder import BlockBuilder
from .promela.modelbuilder import ModelBuilder
from .promela.modelbuilder import DoBuilder
from .promela.modelbuilder import BinaryExpressionBuilder
from .promela.modelbuilder import UnaryExpressionBuilder
from .promela.modelbuilder import AlternativeBuilder
from .promela.modelbuilder import SwitchBuilder
from .promela.modelbuilder import MemberAccessBuilder
from .promela.modelbuilder import ArrayAccessBuilder
from .promela.modelbuilder import ForLoopBuilder
from .promela.modelbuilder import ConditionalExpressionBuilder
from .promela.modelbuilder import PrintfBuilder
from .utils import resolve_asn1_type
from .utils import Asn1Type

__TRANSITION_TYPE_NAME = "int"
__TRANSITION_ARGUMENT = "id"
__INVALID_ID = "-1"
__STATE_VARIABLE = "state"
__INIT = "init"
__STATES_SEPARATOR = "_States_"
__GLOBAL_STATE = "global_state"
__NEXT_TRANSITION_LABEL_NAME = "next_transition"

__BINARY_OPERATOR_DICTIONARY = {
    sdlmodel.BinaryOperator.EQUAL: promelamodel.BinaryOperator.EQUAL,
    sdlmodel.BinaryOperator.NEQUAL: promelamodel.BinaryOperator.NEQUAL,
    sdlmodel.BinaryOperator.GREATER: promelamodel.BinaryOperator.GREATER,
    sdlmodel.BinaryOperator.LESS: promelamodel.BinaryOperator.LESS,
    sdlmodel.BinaryOperator.LEQUAL: promelamodel.BinaryOperator.LEQUAL,
    sdlmodel.BinaryOperator.GEQUAL: promelamodel.BinaryOperator.GEQUAL,
    sdlmodel.BinaryOperator.ADD: promelamodel.BinaryOperator.ADD,
    sdlmodel.BinaryOperator.SUB: promelamodel.BinaryOperator.SUBTRACT,
    sdlmodel.BinaryOperator.MUL: promelamodel.BinaryOperator.MULTIPLY,
    sdlmodel.BinaryOperator.DIV: promelamodel.BinaryOperator.DIVIDE,
    sdlmodel.BinaryOperator.MOD: promelamodel.BinaryOperator.MODULO,
    sdlmodel.BinaryOperator.REM: promelamodel.BinaryOperator.MODULO,
    sdlmodel.BinaryOperator.OR: promelamodel.BinaryOperator.OR,
    sdlmodel.BinaryOperator.AND: promelamodel.BinaryOperator.AND,
    sdlmodel.BinaryOperator.XOR: promelamodel.BinaryOperator.XOR,
}

CHOICE_DATA_MEMBER_NAME = "data"
CHOICE_SELECTION_MEMBER_NAME = "selection"
SEQUENCE_EXIST_MEMBER_NAME = "exist"
SEQUENCEOF_DATA_MEMBER_NAME = "data"
SEQUENCEOF_LENGTH_MEMBER_NAME = "length"
STRING_DATA_MEMBER_NAME = "data"
STRING_LENGTH_MEMBER_NAME = "length"

SEQUENCE_TYPE_NAME = "SequenceType"
SEQUENCEOF_TYPE_NAME = "SequenceOfType"
IA5_STRING_TYPE_NAME = "IA5StringType"
OCTET_STRING_TYPE_NAME = "OctetStringType"
BIT_STRING_TYPE_NAME = "BitStringType"
CHOICE_TYPE_NAME = "ChoiceType"


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

    missing_type: Optional[Asn1Type]

    state_aggregation: bool

    _temporary_variable_counter: int

    def __init__(self, sdl_model: sdlmodel.Model):
        self.sdl_model = sdl_model
        self.is_observer = False
        self.parents = []
        self.in_transition_chain = False
        self.loop_level = 0
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


def _get_type_kind(context: Context, t: Asn1Type) -> str:
    while True:
        if t.kind == "ReferenceType":
            t = resolve_asn1_type(context.sdl_model.types, t)
        else:
            return t.kind


def _check_type_is_complex(context: Context, t: Asn1Type) -> bool:
    kind = _get_type_kind(context, t)
    if kind == SEQUENCE_TYPE_NAME:
        return True
    elif kind == SEQUENCEOF_TYPE_NAME:
        return True
    elif kind == IA5_STRING_TYPE_NAME:
        return True
    elif kind == OCTET_STRING_TYPE_NAME:
        return True
    elif kind == BIT_STRING_TYPE_NAME:
        return True
    elif kind == CHOICE_TYPE_NAME:
        return True
    else:
        return False


def _check_type_is_boolean(context: Context, t: Asn1Type) -> bool:
    kind = _get_type_kind(context, t)
    return kind == "BooleanType"


def _check_type_is_integer(context: Context, t: Asn1Type) -> bool:
    kind = _get_type_kind(context, t)
    return kind == "IntegerType"


def __escapeIv(name: str) -> str:
    return name.capitalize()


def __type_name(datatype: Any) -> str:
    if datatype.kind == "ReferenceType":
        return datatype.ReferencedTypeName.replace("-", "_")
    if datatype.kind == "IntegerType":
        return "int"
    if datatype.kind == "EnumeratedType":
        return datatype.value.replace("-", "_")

    raise NotImplementedError(f"__type_name is not implemented for {datatype.kind}")


def __requires_assign_value_inline(datatype: Any) -> bool:
    """
    Checks if the assignment to variable of type `datatype`:
    requires call of inline or normal assignment operator.
    Types defined in ASN.1 dataview model require inline call.

    :param datatype: Datatype object to check.
    :returns: True if `datatype` requires inline call, otherwise False.
    """
    if datatype.kind in ["ReferenceType", "EnumeratedType"]:
        return True
    return False


def __get_assign_value_inline_name(datatype: Any) -> str:
    """
    Build name for the inline to assign value to variable with type `datatype`.

    :param datatype: Datatype of variable on left side.
    :returns: Name for the inline for value assignment.
    """
    return "{}_assign_value".format(__type_name(datatype))


def __get_promela_binary_operator(
    op: sdlmodel.BinaryOperator,
) -> promelamodel.BinaryOperator:
    if op not in __BINARY_OPERATOR_DICTIONARY.keys():
        raise NotImplementedError(
            f"{str(op)} operator is not available in this context"
        )
    return __BINARY_OPERATOR_DICTIONARY[op]


def __get_implicit_variable_name(context: Context, variable_name: str) -> str:
    return context.sdl_model.process_name + SEPARATOR + variable_name.lower()


def __get_procedure_inline_name(context: Context, procedure_name: str) -> str:
    return context.sdl_model.process_name.capitalize() + SEPARATOR + procedure_name


def __get_exported_procedure_inline_name(context: Context, procedure_name: str) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "PI"
        + SEPARATOR
        + procedure_name
    )


def __get_external_procedure_inline_name(context: Context, procedure_name: str) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "RI"
        + SEPARATOR
        + procedure_name
    )


def __get_procedure_inline_end_label_name(context: Context, procedure_name: str) -> str:
    return (
        context.sdl_model.process_name + SEPARATOR + procedure_name + SEPARATOR + "end"
    )


def __get_procedure_inline_parameter_name(context: Context, name: str) -> str:
    """
    Get name of the parameter for inline in promela
    based on parameter named `name` in procedure in SDL.

    :param context: Generate context.
    :param name: name of the procedure parameter in SDL.
    :returns: name of inline parameter for promela.
    """
    procedure = context.get_parent_procedure()
    if procedure is None:
        raise ValueError("Parent procedure is None")
    return f"{procedure.name.lower()}_param_{name.lower()}"


def __get_procedure_local_variable_name(context: Context, variable_name: str) -> str:
    """
    Get name of the local variable for promela inline
    based on local variable named `name` in procedure in SDL.

    :param context: Generate context.
    :param variable_name: Name of the variable in SDL.
    :returns: name of the variable for promela.
    """
    procedure = context.get_parent_procedure()
    if procedure is None:
        raise ValueError("Parent procedure is None")
    return f"{procedure.name.lower()}_{variable_name.lower()}"


def __get_procedure_inline_return_name(context: Context) -> str:
    """
    Get name of the local variable for promela inline,
    which shall be used to return value.

    :param context: Generate context.
    :returns: name of the parameter for promela inline.
    """
    procedure = context.get_parent_procedure()
    if procedure is None:
        raise ValueError("Parent procedure is None")
    return f"{procedure.name.lower()}_param_returns"


def __get_transition_function_name(context: Context) -> str:
    return context.sdl_model.process_name.capitalize() + SEPARATOR + "transition"


def __get_observer_check_function_name(context: Context) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "check_continuous_signals"
    )


def __get_input_function_name(context: Context, input: sdlmodel.Input) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "PI"
        + SEPARATOR
        + input.name
    )


def __get_unhandled_input_function_name(context: Context, input: sdlmodel.Input) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "PI"
        + SEPARATOR
        + input.name
        + "_unhandled_input"
    )


def __get_init_function_name(context: Context) -> str:
    return context.sdl_model.process_name.capitalize() + SEPARATOR + __INIT


def __get_state_variable_name(context: Context) -> str:
    return (
        __GLOBAL_STATE
        + "."
        + context.sdl_model.process_name.lower()
        + "."
        + __STATE_VARIABLE
    )


def __get_substate_variable_name(context: Context, substate: str) -> str:
    return (
        __GLOBAL_STATE
        + "."
        + context.sdl_model.process_name.lower()
        + "."
        + substate
        + SEPARATOR
        + __STATE_VARIABLE
    )


def __is_procedure_variable(context: Context, variable: str) -> bool:
    """
    Check if the `variable` is local variable of parameter of procedure.

    :param context: Generate context.
    :param variable: Name of the variable.
    :returns: True if the `variable` is param of local variable of procedure,
              otherwise False.
    """
    procedure = context.get_parent_procedure()
    if procedure is None:
        return False
    variables = [variable.lower() for variable in procedure.variables.keys()]
    parameters = [parameter.name.lower() for parameter in procedure.parameters]
    return (variable.lower() in variables) or (variable.lower() in parameters)


def __is_local_variable(context: Context, variable: str) -> bool:
    """
    Check if the `variable` is local variable,
    i.e. it is not a global variable of process,
    but rather o variable defined as an index inside loop.
    Before calling this, the `__is_procedure_variable`
    and `__is_system_state_monitor_variable`
    should be called.

    :param context: Generate context.
    :param variable: Name of the variable.
    :returns: True if the `variable` is local variable, otherwise False.
    """
    variables = [variable.lower() for variable in context.sdl_model.variables.keys()]
    return variable.lower() not in variables


def __is_implicit_variable(context: Context, variable: str) -> bool:
    """
    Check if the variable is implicit defined variable,
    i.e. it is a variable used in observer in Input block.

    :param context: Generate context
    :param variable: Name of the variable
    :returns: True if the `variable` is implicit variable, otherwise False.
    """
    variables = [variable.lower() for variable in context.sdl_model.implicit_variables]
    return variable.lower() in variables


def __is_system_state_monitor_variable(context: Context, variable: str) -> bool:
    """
    Check if the variable is system monitor variable,
    i.e. it is defined as 'monitor' inside observer and it has type 'System_State'.

    :param context: Generate context.
    :param variable: Name of the variable.
    :returns: True if the `variable` is monitor variable, otherwise False.
    """
    for name, monitor in context.sdl_model.monitors.items():
        if variable.lower() == name.lower():
            return __type_name(monitor.type) == "System_State"
    return False


def __is_alias_variable(context: Context, variable: str) -> bool:
    return variable in context.sdl_model.aliases


def __get_variable_name_from_alias(
    context: Context, variable: str
) -> Union[promelamodel.VariableReference, promelamodel.MemberAccess]:
    return __generate_variable_name(
        context, context.sdl_model.aliases[variable].target, True
    )


def __get_variable_name(
    context: Context, variable: str
) -> Union[promelamodel.VariableReference, promelamodel.MemberAccess]:
    """
    Get promela reference to variable with name `variable`.
    Based on the kind of variable (local, global, monitor or procedure local)
    This returns a valid reference.

    :param context: Generate context.
    :param variable: Name of the variable.
    :returns: reference to variable of reference to member if variable is global.
    """
    if __is_implicit_variable(context, variable):
        return VariableReferenceBuilder(
            __get_implicit_variable_name(context, variable.lower())
        ).build()
    elif __is_alias_variable(context, variable):
        return __get_variable_name_from_alias(context, variable)
    elif __is_system_state_monitor_variable(context, variable):
        return VariableReferenceBuilder(__GLOBAL_STATE).build()
    elif __is_procedure_variable(context, variable):
        return VariableReferenceBuilder(
            __get_procedure_local_variable_name(context, variable)
        ).build()
    elif __is_local_variable(context, variable):
        return VariableReferenceBuilder(variable.lower()).build()
    else:
        return (
            MemberAccessBuilder()
            .withUtypeReference(
                MemberAccessBuilder()
                .withUtypeReference(VariableReferenceBuilder(__GLOBAL_STATE).build())
                .withMember(
                    VariableReferenceBuilder(
                        context.sdl_model.process_name.lower()
                    ).build()
                )
                .build()
            )
            .withMember(VariableReferenceBuilder(variable.lower()).build())
            .build()
        )


def __get_constant_name(
    context: Context, constant_reference: sdlmodel.ConstantReference
):
    if constant_reference.constantName == "{}_ctxt".format(
        context.sdl_model.process_implementation_name.lower()
    ):
        # When process is an instance of process type,
        # this reference name shall be overwriten
        return "{}_ctxt".format(context.sdl_model.process_name.lower())

    else:
        candidates = [
            name
            for name in context.sdl_model.constants
            if constant_reference.constantName.lower() == name.lower()
        ]
        if len(candidates) != 1:
            raise Exception(
                f"Cannot find constant '{constant_reference.constantName}' in ASN.1 values"
            )
        return candidates[0]


def __build_assignment(
    left: promelamodel.VariableReference, right: promelamodel.Expression, left_type: Any
) -> promelamodel.Statement:
    """
    Build assignment where ``left` is target and `right` is source.
    The `left_type` is type which determines if the assignment
    should use inline call or ordinary assignment.

    :param left: Reference to the target variable.
    :param right: The source expression.
    :left_type: Type of target.
    :returns: A promela statement, which performs actual assignment.
    """
    if __requires_assign_value_inline(left_type):
        assignInlineName = __get_assign_value_inline_name(left_type)
        return (
            CallBuilder()
            .withTarget(assignInlineName)
            .withParameter(left)
            .withParameter(right)
            .build()
        )
    else:
        return AssignmentBuilder().withTarget(left).withSource(right).build()


def __terminate_transition_statement(context: Context):
    return (
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(context.get_transition_variable()).build())
        .withSource(promelamodel.IntegerValue(int(__INVALID_ID)))
        .build()
    )


@dispatch(Context, sdlmodel.VariableReference, bool)
def __generate_variable_name(
    context: Context,
    variable_reference: sdlmodel.VariableReference,
    toplevel: bool,
) -> Union[
    promelamodel.VariableReference, promelamodel.MemberAccess, promelamodel.ArrayAccess
]:
    if toplevel:
        return __get_variable_name(context, variable_reference.variableName)
    else:
        return VariableReferenceBuilder(variable_reference.variableName).build()


@dispatch(Context, sdlmodel.ConstantReference, bool)
def __generate_variable_name(
    context: Context,
    constant_reference: sdlmodel.ConstantReference,
    toplevel: bool,
) -> Union[
    promelamodel.VariableReference, promelamodel.MemberAccess, promelamodel.ArrayAccess
]:
    return VariableReferenceBuilder(
        __get_constant_name(context, constant_reference)
    ).build()


def __build_member_reference_for_type(
    context: Context, member: sdlmodel.VariableReference, datatype: Any
) -> Tuple[
    Union[
        promelamodel.VariableReference,
        promelamodel.MemberAccess,
        promelamodel.ArrayAccess,
    ],
    Any,
]:
    """
    Build valid reference name to the member of `datatype`,
    based on `member` from SDL model.
    The `datatype` can be SEQUENCE or CHOICE.
    SDL is case insensitive, but the promela is case sensitive.
    This function ensures that generated reference will be valid.

    :param context: Generate context
    :param member: Input reference to member from SDL source.
    :param datatype: Type of the structure, where `member` should exist
    :returns: promela VariableReference which contains valid reference to member
        and its type
    """

    variable_name = member.variableName.lower()
    candidates = []
    for candidate in datatype.Children.items():
        candidate_name = candidate[0].replace("-", "_").lower()
        candidate_type = candidate[1]
        resolved_type = resolve_asn1_type(context.sdl_model.types, candidate_type.type)
        if candidate_name == variable_name:
            candidates.append((candidate[0].replace("-", "_"), resolved_type))

    if len(candidates) == 0:
        error = f"Cannot find member '{member}' in variable of type '{datatype.CName}'"
        raise Exception(error)
    elif len(candidates) > 1:
        error = (
            f"Ambiguous member name '{member}' in variable of type '{datatype.CName}'"
        )
        raise Exception(error)

    member_name = sdlmodel.VariableReference(candidates[0][0])
    return (
        VariableReferenceBuilder(member_name.variableName).build(),
        candidates[0][1],
    )


def __resolve_member_access_type(
    context: Context, member_access: sdlmodel.MemberAccess
) -> Any:
    if isinstance(member_access.sequence, sdlmodel.MemberAccess):
        parent_type = __resolve_member_access_type(context, member_access.sequence)
        member = __build_member_reference_for_type(
            context, member_access.sequence.member, parent_type
        )
        return member[1]
    else:
        return resolve_asn1_type(context.sdl_model.types, member_access.sequence.type)


@dispatch(Context, sdlmodel.MemberAccess, bool)
def __generate_variable_name(
    context: Context,
    member_access: sdlmodel.MemberAccess,
    toplevel: bool,
) -> Union[
    promelamodel.VariableReference, promelamodel.MemberAccess, promelamodel.ArrayAccess
]:
    # In case when the left side has type of CHOICE
    # then result shall be like: 'container.data.field'
    left_type = __resolve_member_access_type(context, member_access)

    if left_type.kind == "ChoiceType":
        member = __build_member_reference_for_type(
            context, member_access.member, left_type
        )[0]
        return (
            MemberAccessBuilder()
            .withUtypeReference(
                MemberAccessBuilder()
                .withUtypeReference(
                    __generate_variable_name(context, member_access.sequence, toplevel)
                )
                .withMember(VariableReferenceBuilder("data").build())
                .build()
            )
            .withMember(member)
            .build()
        )
    elif left_type.kind == "SequenceType":
        member = __build_member_reference_for_type(
            context, member_access.member, left_type
        )[0]
        return (
            MemberAccessBuilder()
            .withUtypeReference(
                __generate_variable_name(context, member_access.sequence, toplevel)
            )
            .withMember(member)
            .build()
        )
    else:
        error = f"Invalid attempt to access field of type '{left_type.CName}'"
        error += " {left_type.Kind}"
        error += ", which is not ChoiceType nor SequenceType"
        raise Exception(error)


@dispatch(Context, sdlmodel.ArrayAccess, bool)
def __generate_variable_name(
    context: Context,
    array_access: sdlmodel.ArrayAccess,
    toplevel: bool,
) -> Union[
    promelamodel.VariableReference, promelamodel.MemberAccess, promelamodel.ArrayAccess
]:
    return (
        ArrayAccessBuilder()
        .withArray(
            MemberAccessBuilder()
            .withUtypeReference(
                __generate_variable_name(context, array_access.array, toplevel)
            )
            .withMember(VariableReferenceBuilder(SEQUENCEOF_DATA_MEMBER_NAME).build())
            .build()
        )
        .withIndex(__generate_expression(context, array_access.element))
        .build()
    )


@dispatch(Context, sdlmodel.StringValue)
def __generate_expression(context: Context, value: sdlmodel.StringValue):
    return VariableReferenceBuilder(f'"{value.value}"').build()


@dispatch(Context, sdlmodel.Constant)
def __generate_expression(context: Context, constant: sdlmodel.Constant):
    return promelamodel.IntegerValue(int(constant.value))


@dispatch(Context, sdlmodel.RealConstant)
def __generate_expression(context: Context, constant: sdlmodel.RealConstant):
    return promelamodel.FloatValue(float(constant.value))


@dispatch(Context, sdlmodel.OctetStringValue)
def __generate_expression(context: Context, constant: sdlmodel.OctetStringValue):
    if _check_type_is_integer(context, constant.type):
        return promelamodel.IntegerValue(constant.integer_value())
    else:
        raise NotImplementedError(
            "OCTET STRING literal is supported in expressions only as INTEGER"
        )


@dispatch(Context, sdlmodel.BooleanConstant)
def __generate_expression(context: Context, constant: sdlmodel.BooleanConstant):
    return promelamodel.BooleanValue(constant.value)


@dispatch(Context, sdlmodel.VariableReference)
def __generate_expression(context: Context, variable: sdlmodel.VariableReference):
    return __generate_variable_name(context, variable, True)


@dispatch(Context, sdlmodel.ConstantReference)
def __generate_expression(context: Context, constant: sdlmodel.ConstantReference):
    return __generate_variable_name(context, constant, True)


@dispatch(Context, sdlmodel.EnumValue)
def __generate_expression(context: Context, enumValue: sdlmodel.EnumValue):
    basic_type = find_basic_type(context.sdl_model.source.dataview, enumValue.type)
    if enumValue.type.kind == "EnumeratedType":
        type_name = __type_name(context.missing_type)
    else:
        type_name = __type_name(enumValue.type)
    enumerant = enumValue.value.replace("_", "-").lower()
    candidates = [v for k, v in basic_type.EnumValues.items() if k.lower() == enumerant]
    if len(candidates) != 1:
        raise Exception(f"Invalid enum value {enumValue.value}")
    value = "{}_{}".format(type_name, candidates[0].EnumID)
    return VariableReferenceBuilder(value).build()


@dispatch(Context, sdlmodel.ArrayAccess)
def __generate_expression(context: Context, array_access: sdlmodel.ArrayAccess):
    return __generate_variable_name(context, array_access, True)


@dispatch(Context, sdlmodel.MemberAccess)
def __generate_expression(context: Context, member_access: sdlmodel.MemberAccess):
    return __generate_variable_name(context, member_access, True)


@dispatch(Context, sdlmodel.BinaryExpression)
def __generate_expression(context: Context, expression: sdlmodel.BinaryExpression):
    if expression.operator == sdlmodel.BinaryOperator.ASSIGN:
        pass
    elif expression.operator == sdlmodel.BinaryOperator.XOR:
        if _check_type_is_boolean(context, expression.type):
            return (
                BinaryExpressionBuilder(promelamodel.BinaryOperator.OR)
                .withLeft(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                    .withLeft(
                        UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                        .withExpression(__generate_expression(context, expression.left))
                        .build()
                    )
                    .withRight(__generate_expression(context, expression.right))
                    .build()
                )
                .withRight(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                    .withLeft(__generate_expression(context, expression.left))
                    .withRight(
                        UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                        .withExpression(
                            __generate_expression(context, expression.right)
                        )
                        .build()
                    )
                    .build()
                )
                .build()
            )
        else:
            return (
                BinaryExpressionBuilder(
                    __get_promela_binary_operator(expression.operator)
                )
                .withLeft(__generate_expression(context, expression.left))
                .withRight(__generate_expression(context, expression.right))
                .build()
            )

    elif expression.operator == sdlmodel.BinaryOperator.IMPLIES:
        return (
            BinaryExpressionBuilder(promelamodel.BinaryOperator.OR)
            .withLeft(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                .withLeft(__generate_expression(context, expression.left))
                .withRight(__generate_expression(context, expression.right))
                .build()
            )
            .withRight(
                UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                .withExpression(__generate_expression(context, expression.left))
                .build()
            )
            .build()
        )
    else:
        return (
            BinaryExpressionBuilder(__get_promela_binary_operator(expression.operator))
            .withLeft(__generate_expression(context, expression.left))
            .withRight(__generate_expression(context, expression.right))
            .build()
        )


@dispatch(Context, sdlmodel.UnaryExpression)
def __generate_expression(context: Context, expression: sdlmodel.UnaryExpression):
    if expression.operator == sdlmodel.UnaryOperator.NEG:
        operator = promelamodel.UnaryOperator.NEGATIVE
    elif expression.operator == sdlmodel.UnaryOperator.NOT:
        operator = promelamodel.UnaryOperator.NOT
    else:
        raise NotImplementedError(
            "__generate_expression is not implemented for unary operator: {}".format(
                expression.operator
            )
        )
    return (
        UnaryExpressionBuilder(operator)
        .withExpression(__generate_expression(context, expression.expression))
        .build()
    )


@dispatch(Context, sdlmodel.ConditionalExpression)
def __generate_expression(context: Context, expression: sdlmodel.ConditionalExpression):
    return (
        ConditionalExpressionBuilder()
        .withCondition(__generate_expression(context, expression.condition))
        .withTrueExpression(__generate_expression(context, expression.trueExpression))
        .withFalseExpression(__generate_expression(context, expression.falseExpression))
        .build()
    )


@dispatch(Context, sdlmodel.ProcedureCall)
def __generate_expression(context: Context, expression: sdlmodel.ProcedureCall):
    # As promela inlines cannot be used within expressions, this cannot be
    # implemented directly. A workaround is possible by preprocessing
    # the statements such that expressions containing calls are split
    # into separate expressions for the calls, assigning results to intermediate values
    # and then using this values in the actual expression
    # TODO

    if expression.name.lower() == "present":
        # A special case when context shall be changed
        if len(expression.parameters) != 1:
            raise ValueError(
                f"Present built-in function expected 1 arguments, but received {len(expression.parameters)}."
            )
        if expression.parameters[0] is None:
            raise ValueError("Present queried entity is missing.")
        context.missing_type = expression.parameters[0].type
        return (
            MemberAccessBuilder()
            .withUtypeReference(
                __generate_expression(context, expression.parameters[0])
            )
            .withMember(VariableReferenceBuilder(CHOICE_SELECTION_MEMBER_NAME).build())
            .build()
        )

    elif builtins.is_builtin(expression.name):
        parameters = []
        types = []
        for parameter in expression.parameters:
            parameters.append(__generate_expression(context, parameter))
            types.append(parameter.type)
        return builtins.translate_builtin(
            expression, parameters, types, context.sdl_model.types
        )
    else:
        raise NotImplementedError(
            f"Call to {str(expression.name)} cannot be made within an expression"
        )


def __get_parameter_name(variable_reference: sdlmodel.VariableReference) -> str:
    return variable_reference.variableName.lower()


def __get_state_name(context: Context, state: sdlmodel.State) -> str:
    return (
        __escapeIv(context.sdl_model.process_implementation_name)
        + __STATES_SEPARATOR
        + state.name
    )


def __get_remote_function_name(context: Context, output: sdlmodel.Output) -> str:
    return (
        context.sdl_model.process_name.capitalize()
        + SEPARATOR
        + "RI"
        + SEPARATOR
        + output.name
    )


def __generate_procedure_inline(
    context: Context, procedure: sdlmodel.Procedure
) -> promelamodel.Inline:
    """
    Generate promela inline for SDL procedure.
    """
    context.push_parent(procedure)
    builder = InlineBuilder()

    if procedure.type == sdlmodel.ProcedureType.EXPORTED:
        builder.withName(__get_exported_procedure_inline_name(context, procedure.name))
    else:
        builder.withName(__get_procedure_inline_name(context, procedure.name))

    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    for localVariable, localVariableInfo in procedure.variables.items():
        localVariableName = __get_procedure_local_variable_name(context, localVariable)
        blockBuilder.withStatement(
            VariableDeclarationBuilder(
                localVariableName,
                __type_name(localVariableInfo.type),
            ).build()
        )
        if localVariableInfo.value is not None:
            variable_ref = sdlmodel.VariableReference(localVariableName)
            variable_ref.type = localVariableInfo.type
            blockBuilder.withStatements(
                __generate_assignment(
                    context,
                    variable_ref,
                    localVariableInfo.value,
                    localVariableInfo.type,
                )
            )
    # Procedure return, if any, is handled via the first parameter
    if procedure.returnType is not None:
        builder.withParameter(__get_procedure_inline_return_name(context))
    for parameter in procedure.parameters:
        # Inlines are like macros. For a call foo(1+3), the 1+3 will be used
        # wherever the parameter is referenced. To avoid that, an intermediate
        # variable is introduced. This can be done only for inputs, as for outputs
        # such expressions are forbidden, and an intermediate variable would make
        # the output value propagation more difficult
        if parameter.direction == sdlmodel.ProcedureParameterDirection.IN:
            intermediateParameterName = __get_procedure_inline_parameter_name(
                context, parameter.name
            )
            builder.withParameter(intermediateParameterName)
            blockBuilder.withStatement(
                VariableDeclarationBuilder(
                    __get_procedure_local_variable_name(context, parameter.name),
                    __type_name(parameter.typeObject),
                ).build()
            )
            blockBuilder.withStatement(
                __build_assignment(
                    VariableReferenceBuilder(
                        __get_procedure_local_variable_name(context, parameter.name)
                    ).build(),
                    VariableReferenceBuilder(intermediateParameterName.lower()).build(),
                    parameter.typeObject,
                )
            )
        else:
            # If the parameter has 'out' flag (this includes 'in/out')
            # Then use normal local variable name, no additional assignment is required
            builder.withParameter(
                __get_procedure_local_variable_name(context, parameter.name)
            )
    blockBuilder.withStatements(__generate_transition(context, procedure.transition))
    # This can be optimized - not needed if there is only one return, but both the return statement
    # and this part must be aware of the decision.
    blockBuilder.withStatement(
        promelamodel.Label(
            __get_procedure_inline_end_label_name(context, procedure.name)
        )
    )
    if procedure.type == sdlmodel.ProcedureType.EXPORTED:
        # in case when this is an exported procedure, the continuous signals needs to be called
        transition_function_name = __get_transition_function_name(context)
        blockBuilder.withStatements(
            [
                CallBuilder()
                .withTarget(transition_function_name)
                .withParameter(promelamodel.IntegerValue(-1))
                .build()
            ]
        )

    # After the label should be at least one statement.
    # In case of inline it is not always possible to detect if something is called after.
    # Therefore skip is added.
    blockBuilder.withStatement(promelamodel.Skip())
    builder.withDefinition(blockBuilder.build())
    context.pop_parent()
    return builder.build()


def __get_exit_procedures(
    context: Context, input_block: sdlmodel.InputBlock, state: sdlmodel.State
) -> List[str]:
    exitlist = []
    current_state_name = ""
    state_tree = state.name.split(SEPARATOR)

    process = context.sdl_model.source
    while state_tree:
        current_state_name = current_state_name + state_tree.pop(0)
        for composite in process.composite_states:
            if current_state_name.lower() == composite.statename.lower():
                if composite.exit_procedure:
                    exitlist.append(current_state_name)
                process = composite
                current_state_name = current_state_name + SEPARATOR
                break

    transition = context.sdl_model.transitions[input_block.transition_id]
    result = []
    for each in reversed(exitlist):
        if transition and all(each.startswith(st) for st in transition.possible_states):
            exit_procedure_name = (
                f"{context.sdl_model.process_name}{SEPARATOR}{each}{SEPARATOR}exit"
            )
            result.append(exit_procedure_name)

    return list(reversed(result))


def __generate_execute_transition(
    context: Context,
    statename: str,
    input: sdlmodel.Input,
    builder: SwitchBuilder,
    parallel_parent: Optional[str],
) -> bool:
    """
    Generate conditional call to execute transition inline.
    This function checks if the Input contains a transition_id for the statename
    and generates a call to the execute transition inline.
    Also, the calls to exit procedures are generated if requires.

    :param context: Global translator context
    :param statename: State name which determines transition id
    :param input: Input which contains a map from state to transition id
    :param builder: Builder to append a call
    :param parallel_parent: Optional name of parent state for parallel states.
    :returns: True if inline call was generated, otherwise False
    """
    if parallel_parent is None:
        state_variable_name = __get_state_variable_name(context)
    else:
        state_variable_name = __get_substate_variable_name(context, parallel_parent)
    key = sdlmodel.State()
    key.name = statename
    transition_function_name = __get_transition_function_name(context)

    if key not in input.transitions:
        # The Input does not contains a transition for the statename
        # Do not generate anything
        return False

    input_block = input.transitions[key]
    statements: List[promelamodel.Statement] = []

    # Generate assignment of signal parameters into variables
    for target_variable_ref in input_block.target_variables:
        variable = context.sdl_model.variables[target_variable_ref.variableName]
        statements.append(
            __build_assignment(
                __generate_variable_name(context, target_variable_ref, True),
                VariableReferenceBuilder(
                    __get_parameter_name(input.parameters[0].target_variable)
                ).build(),
                variable.type,
            )
        )

    # Generate exit procedure calls in case of composite state.
    exit_procedures = __get_exit_procedures(context, input_block, key)

    for procedure_name in exit_procedures:
        statements.append(CallBuilder().withTarget(procedure_name).build())

    # Generate an alternative for switch,
    # which checks current state and executes transition
    statements.append(
        CallBuilder()
        .withTarget(transition_function_name)
        .withParameter(VariableReferenceBuilder(str(input_block.transition_id)).build())
        .build()
    )

    builder.withAlternative(
        AlternativeBuilder()
        .withCondition(
            BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
            .withLeft(VariableReferenceBuilder(state_variable_name).build())
            .withRight(VariableReferenceBuilder(__get_state_name(context, key)).build())
            .build()
        )
        .withStatements(statements)
        .build()
    )

    return True


def generate_transition_state_switch(
    context: Context,
    statename: str,
    input: sdlmodel.Input,
    builder: SwitchBuilder,
    parallel_parent: Optional[str],
) -> bool:
    """
    Recursive function, responsible for generation of alternative for switch,
    which should finally call 'execute transition' with proper transition id.
    In case of parallel states, the parameter 'parentstate' shall be not None,

    :param context: translator context
    :param statename: name of the state to check in the alternative
    :param input: The Input which contains a map from state to transition id
    :param builder: The builder to append alternative
    :param parallel_parent: The optional parent state for parallel states
    :returns: True if alternative was generated, otherwise False
    """
    if parallel_parent is None:
        state_variable_name = __get_state_variable_name(context)
    else:
        state_variable_name = __get_substate_variable_name(context, parallel_parent)
    key = sdlmodel.State()
    key.name = statename

    if statename in context.sdl_model.input_aggregates:
        # If the state is an aggregate state
        # then generate another switch, which check parallel states
        aggregate = context.sdl_model.input_aggregates[statename]
        nested_switch_builder = SwitchBuilder()

        generated = False

        for parent in aggregate:
            for child_state in parent.mapping.keys():
                if generate_transition_state_switch(
                    context, child_state, input, nested_switch_builder, parent.statename
                ):
                    generated = True

        if generated:
            # If the input contains at least one transition for substates in aggregate
            # then append another switch, which checks parallel state
            nested_switch_builder.withAlternative(
                AlternativeBuilder().withStatements([promelamodel.Skip()]).build()
            )

            builder.withAlternative(
                AlternativeBuilder()
                .withCondition(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                    .withLeft(VariableReferenceBuilder(state_variable_name).build())
                    .withRight(
                        VariableReferenceBuilder(__get_state_name(context, key)).build()
                    )
                    .build()
                )
                .withStatements([nested_switch_builder.build()])
                .build()
            )
            return True
        else:
            # If there's no transitions substates in aggregate
            # then check if there is a transition for aggregate
            return __generate_execute_transition(
                context, statename, input, builder, parallel_parent
            )

    else:
        return __generate_execute_transition(
            context, statename, input, builder, parallel_parent
        )


def __generate_input_function(
    context: Context, input: sdlmodel.Input
) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_input_function_name(context, input))
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    for parameter in input.parameters:
        builder.withParameter(__get_parameter_name(parameter.target_variable))

    switch_builder = SwitchBuilder()

    # All state names
    all_states = set(
        name for name in context.sdl_model.states.keys() if not name.endswith("START")
    )
    # Top level States i.e. states, which are not inside 'parallel states'
    top_level_states = {
        name
        for name in all_states
        if name not in context.sdl_model.input_parallel_states
    }

    # Generate a call to execute transition inline.
    # The execution id depends on current state, which includes parallel states.
    # Start from top_level state: i.e. the variable 'state' in process context.
    for statename in sorted(top_level_states):
        generate_transition_state_switch(
            context, statename, input, switch_builder, None
        )

    if context.is_observer:
        switch_builder.withAlternative(
            AlternativeBuilder().withStatements([promelamodel.Skip()]).build()
        )
    else:
        unhandled_input_call_builder = CallBuilder().withTarget(
            __get_unhandled_input_function_name(context, input)
        )
        for parameter in input.parameters:
            unhandled_input_call_builder.withParameter(
                VariableReferenceBuilder(
                    __get_parameter_name(parameter.target_variable)
                ).build()
            )

        switch_builder.withAlternative(
            AlternativeBuilder()
            .withStatements([unhandled_input_call_builder.build()])
            .build()
        )

    blockBuilder.withStatements([switch_builder.build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __translate_answer_condition(
    context: Context,
    transition: sdlmodel.Transition,
    value: sdlmodel.Expression,
    expression: sdlmodel.Expression,
) -> promelamodel.Statement:
    def fill_expression(expression):
        if isinstance(expression, sdlmodel.BinaryExpression):
            if expression.left is None:
                expression.left = copy.deepcopy(value)
            else:
                fill_expression(expression.left)
            if expression.right is None:
                expression.right = copy.deepcopy(value)
            else:
                fill_expression(expression.right)

    fill_expression(expression)

    return __generate_expression(context, expression)


@dispatch
def __generate_statement(context, transition, action) -> promelamodel.Statement:
    raise NotImplementedError("generate_statement not implemented for " + action)


def __generate_for_over_a_numeric_range(
    context: Context,
    transition: sdlmodel.Transition,
    task: sdlmodel.ForLoopTask,
    inner_statements: List[promelamodel.Statement],
) -> List[promelamodel.Statement]:
    statements: List[promelamodel.Statement] = []
    range = typing.cast(sdlmodel.NumericForLoopRange, task.range)
    statements.append(
        VariableDeclarationBuilder(task.iteratorName.variableName, "int").build()
    )

    iteratorReference = VariableReferenceBuilder(task.iteratorName.variableName).build()

    if range.start is not None:
        start_expression = __generate_expression(context, range.start)
    else:
        start_expression = promelamodel.IntegerValue(0)

    statements.extend(
        [
            AssignmentBuilder()
            .withTarget(iteratorReference)
            .withSource(start_expression)
            .build()
        ]
    )
    statements.extend(
        [
            DoBuilder()
            .withAlternative(
                AlternativeBuilder()
                .withCondition(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.LESS)
                    .withLeft(iteratorReference)
                    .withRight(__generate_expression(context, range.stop))
                    .build()
                )
                .withStatements(inner_statements)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(iteratorReference)
                        .withSource(
                            BinaryExpressionBuilder(promelamodel.BinaryOperator.ADD)
                            .withLeft(iteratorReference)
                            .withRight(__generate_expression(context, range.step))
                            .build()
                        )
                        .build()
                    ]
                )
                .build()
            )
            .withAlternative(
                AlternativeBuilder().withStatements([promelamodel.Break()]).build()
            )
            .build()
        ]
    )
    return [
        BlockBuilder(promelamodel.BlockType.BLOCK).withStatements(statements).build()
    ]


def __generate_for_over_sequenceof(
    context: Context,
    transition: sdlmodel.Transition,
    task: sdlmodel.ForLoopTask,
    statements: List[promelamodel.Statement],
) -> List[promelamodel.Statement]:
    result_statements: List[promelamodel.Statement] = []
    range = typing.cast(sdlmodel.ForEachLoopRange, task.range)
    basic_type = find_basic_type(context.sdl_model.source.dataview, range.variableType)

    result_statements.append(
        VariableDeclarationBuilder(
            task.iteratorName.variableName, __type_name(range.type)
        ).build()
    )

    iterator_name = "i" + str(context.loop_level)

    result_statements.append(VariableDeclarationBuilder(iterator_name, "int").build())

    for_loop_builder = ForLoopBuilder()
    for_loop_builder.withIterator(VariableReferenceBuilder(iterator_name).build())
    for_loop_builder.withFirst(0)

    arrayReference = __generate_variable_name(context, range.variable, True)

    if basic_type.Min != basic_type.Max:
        for_loop_builder.withLast(
            BinaryExpressionBuilder(promelamodel.BinaryOperator.SUBTRACT)
            .withLeft(
                MemberAccessBuilder()
                .withUtypeReference(arrayReference)
                .withMember(VariableReferenceBuilder("length").build())
                .build()
            )
            .withRight(promelamodel.IntegerValue(1))
            .build()
        )

    else:
        for_loop_builder.withLast(int(basic_type.Max) - 1)

    all_statements: List[promelamodel.Statement] = []
    all_statements.append(
        __build_assignment(
            VariableReferenceBuilder(task.iteratorName.variableName).build(),
            ArrayAccessBuilder()
            .withArray(
                MemberAccessBuilder()
                .withUtypeReference(arrayReference)
                .withMember(VariableReferenceBuilder("data").build())
                .build()
            )
            .withIndex(VariableReferenceBuilder(iterator_name).build())
            .build(),
            range.type,
        )
    )
    all_statements.extend(statements)
    for_loop_builder.withBody(all_statements)

    result_statements.append(for_loop_builder.build())

    return [
        BlockBuilder(promelamodel.BlockType.BLOCK)
        .withStatements(result_statements)
        .build()
    ]


@dispatch(Context, sdlmodel.Transition, sdlmodel.ForLoopTask)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    task: sdlmodel.ForLoopTask,
) -> promelamodel.Statement:
    inner_statements = []
    context.enter_loop()
    for action in task.actions:
        statement = __generate_statement(context, transition, action)
        inner_statements.append(statement)

    context.leave_loop()
    if isinstance(task.range, sdlmodel.NumericForLoopRange):
        return promelamodel.StatementsWrapper(
            __generate_for_over_a_numeric_range(
                context, transition, task, inner_statements
            )
        )
    if isinstance(task.range, sdlmodel.ForEachLoopRange):
        return promelamodel.StatementsWrapper(
            __generate_for_over_sequenceof(context, transition, task, inner_statements)
        )
    else:
        raise NotImplementedError(
            "generate_statement not implemented for the used range specification"
        )


@dispatch(Context, sdlmodel.Transition, sdlmodel.Label)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    label: sdlmodel.Label,
) -> promelamodel.Statement:
    return promelamodel.Label(label.name.lower())


@dispatch(Context, sdlmodel.Transition, sdlmodel.Join)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    join: sdlmodel.Join,
) -> promelamodel.Statement:
    return promelamodel.GoTo(join.label_name.lower())


@dispatch(Context, sdlmodel.Transition, sdlmodel.ProcedureReturn)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    procedureReturn: sdlmodel.ProcedureReturn,
) -> promelamodel.Statement:
    assert isinstance(transition.parent, sdlmodel.Procedure)
    if procedureReturn.expression is None:
        return None
    statements = []
    statements.append(
        __build_assignment(
            VariableReferenceBuilder(
                __get_procedure_inline_return_name(context)
            ).build(),
            __generate_expression(context, procedureReturn.expression),
            transition.parent.returnType,
        )
    )
    statements.append(
        promelamodel.GoTo(
            __get_procedure_inline_end_label_name(context, transition.parent.name)
        )
    )
    return promelamodel.StatementsWrapper(statements)


@dispatch(Context, sdlmodel.Transition, sdlmodel.AssignmentTask)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    assignment: sdlmodel.AssignmentTask,
) -> promelamodel.Statement:
    statements: List[promelamodel.Statement] = __generate_assignment(
        context,
        assignment.assignment.left,
        assignment.assignment.right,
        assignment.type,
    )
    if len(statements) == 1:
        return statements[0]
    else:
        return (
            BlockBuilder(promelamodel.BlockType.BLOCK)
            .withStatements(statements)
            .build()
        )


@dispatch(Context, sdlmodel.Transition, sdlmodel.Actions)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    actions: sdlmodel.Actions,
) -> promelamodel.Statement:
    block = BlockBuilder(promelamodel.BlockType.BLOCK)
    for action in actions.actions:
        statement = __generate_statement(context, transition, action)
        block.withStatement(statement)
    return block.build()


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Expression,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Expression,
    left_type: type,
) -> List[promelamodel.Statement]:
    statements: List[promelamodel.Statement] = []
    if isinstance(right, sdlmodel.ProcedureCall):
        # Inlines cannot return a value, and so the return is handled via
        # the first parameter
        if builtins.is_builtin(right.name):
            assignInlineName: Optional[str] = None
            if __requires_assign_value_inline(left_type):
                assignInlineName = __get_assign_value_inline_name(left_type)

            left_side = __generate_variable_name(context, left, True)

            parameters = []
            types: List[Asn1Type] = []
            for parameter in right.parameters:
                parameters.append(__generate_expression(context, parameter))
                types.append(parameter.type)

            statements.append(
                builtins.translate_assignment(
                    assignInlineName,
                    right,
                    left_side,
                    parameters,
                    types,
                    context.sdl_model.types,
                )
            )
        else:
            inlineCall = CallBuilder()
            inlineCall.withTarget(__get_procedure_inline_name(context, right.name))
            inlineCall.withParameter(__generate_variable_name(context, left, True))
            for parameter in right.parameters:
                inlineCall.withParameter(__generate_expression(context, parameter))
            statements.append(inlineCall.build())
    else:
        statements.append(
            __build_assignment(
                __generate_variable_name(context, left, True),
                __generate_expression(context, right),
                left_type,
            )
        )

    return statements


def append_length_assignment_for_string_type(
    context: Context,
    statements: List[promelamodel.Statement],
    target: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    target_type: Any,
    length: int,
):
    length_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(context, target, True))
        .withMember(VariableReferenceBuilder(STRING_LENGTH_MEMBER_NAME).build())
        .build()
    )
    if int(target_type.Min) != int(target_type.Max):
        # Add assignment to the length member, it exists when
        # string is variable length
        statements.append(
            AssignmentBuilder()
            .withTarget(length_field)
            .withSource(promelamodel.IntegerValue(length))
            .build()
        )


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.EmptyStringValue,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.EmptyStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
        or finalType.kind == SEQUENCEOF_TYPE_NAME
    ):
        if int(finalType.Min) != 0:
            raise Exception(f"Invalid assignment to type {finalType.CName}")

        data_field = __generate_variable_name(context, left, True)
        data_field = (
            MemberAccessBuilder()
            .withUtypeReference(data_field)
            .withMember(VariableReferenceBuilder(STRING_DATA_MEMBER_NAME).build())
            .build()
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            context, statements, left, finalType, 0
        )

        if (
            finalType.kind == OCTET_STRING_TYPE_NAME
            or finalType.kind == IA5_STRING_TYPE_NAME
        ):
            for index in range(int(finalType.Max)):
                element = (
                    ArrayAccessBuilder()
                    .withArray(data_field)
                    .withIndex(promelamodel.IntegerValue(index))
                    .build()
                )
                statements.append(
                    AssignmentBuilder()
                    .withTarget(element)
                    .withSource(promelamodel.IntegerValue(0))
                    .build()
                )

        return statements

    elif finalType.kind == BIT_STRING_TYPE_NAME:
        raise NotImplementedError("Assignment to BIT STRING is not supported")
    else:
        raise Exception(f"Unsupported assignment: {finalType.kind} EmptyString")


def check_length_constraint(target_type: Any, length: int):
    if length < int(target_type.Min) or length > int(target_type.Max):
        raise Exception(
            f"Invalid assignment: {target_type.CName} does not accept value with length {length}"
        )


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.StringValue,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.StringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.value)
        check_length_constraint(finalType, length)
        data_field = __generate_variable_name(context, left, True)
        data_field = (
            MemberAccessBuilder()
            .withUtypeReference(data_field)
            .withMember(VariableReferenceBuilder(STRING_DATA_MEMBER_NAME).build())
            .build()
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            context, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                ord(right.value[index]) if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(data_field)
                .withIndex(promelamodel.IntegerValue(index))
                .build()
            )
            statements.append(
                AssignmentBuilder().withTarget(element).withSource(value).build()
            )

        return statements
    elif finalType.kind == BIT_STRING_TYPE_NAME:
        raise NotImplementedError("Assignment to BIT STRING is not supported")
    else:
        raise Exception(f"Unsupported assignment: {finalType.kind} String Value")


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.OctetStringValue,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.OctetStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.elements)
        check_length_constraint(finalType, length)

        data_field = __generate_variable_name(context, left, True)
        data_field = (
            MemberAccessBuilder()
            .withUtypeReference(data_field)
            .withMember(VariableReferenceBuilder(STRING_DATA_MEMBER_NAME).build())
            .build()
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            context, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                right.elements[index] if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(data_field)
                .withIndex(promelamodel.IntegerValue(index))
                .build()
            )
            statements.append(
                AssignmentBuilder().withTarget(element).withSource(value).build()
            )

        return statements
    elif finalType.kind == BIT_STRING_TYPE_NAME:
        raise NotImplementedError("Assignment to BIT STRING is not supported")
    elif finalType.kind == "IntegerType":
        return [
            __build_assignment(
                __generate_variable_name(context, left, True),
                promelamodel.IntegerValue(right.integer_value()),
                left_type,
            )
        ]
    else:
        raise Exception(f"Unsupported assignment: {finalType.kind} Octet String Value")


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.BitStringValue,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.BitStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.elements)
        check_length_constraint(finalType, length)

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            context, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                right.elements[index] if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(__generate_variable_name(context, left, True))
                .withIndex(promelamodel.IntegerValue(index))
                .build()
            )
            statements.append(
                AssignmentBuilder().withTarget(element).withSource(value).build()
            )

        return statements
    elif finalType.kind == BIT_STRING_TYPE_NAME:
        raise NotImplementedError("Assignment to BIT STRING is not supported")
    else:
        raise Exception(f"Unsupported assignment: {finalType.kind} Bit String Value")


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Sequence,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Sequence,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if finalType.kind != SEQUENCE_TYPE_NAME:
        raise Exception(
            f"Invalid assignment: {finalType.CName} does not accept SEQUENCE value"
        )

    statements: List[promelamodel.Statement] = []

    for name, dataType in finalType.Children.items():
        is_optional = dataType.Optional == "True"
        if not is_optional and name not in right.elements:
            raise Exception(
                f"Invalid assignment to {finalType.CName}: missing required member {name}"
            )

        if name in right.elements:
            field = sdlmodel.MemberAccess(left, sdlmodel.VariableReference(name))
            field.type = right.elements[name].type

            statements.extend(
                __generate_assignment(
                    context,
                    field,
                    right.elements[name],
                    dataType.type,
                )
            )

        if is_optional:
            value = promelamodel.IntegerValue(1 if name in right.elements else 0)
            statements.append(
                AssignmentBuilder()
                .withTarget(
                    MemberAccessBuilder()
                    .withUtypeReference(
                        MemberAccessBuilder()
                        .withUtypeReference(
                            __generate_variable_name(context, left, True)
                        )
                        .withMember(
                            VariableReferenceBuilder(SEQUENCE_EXIST_MEMBER_NAME).build()
                        )
                        .build()
                    )
                    .withMember(VariableReferenceBuilder(name).build())
                    .build()
                )
                .withSource(value)
                .build()
            )

    return statements


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.SequenceOf,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.SequenceOf,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    if finalType.kind != SEQUENCEOF_TYPE_NAME:
        raise Exception(
            f"Invalid assignment: {finalType.CName} does not accept SEQUENCE OF value"
        )

    statements: List[promelamodel.Statement] = []

    length = len(right.elements)

    check_length_constraint(finalType, length)

    length_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(context, left, True))
        .withMember(VariableReferenceBuilder(SEQUENCEOF_LENGTH_MEMBER_NAME).build())
        .build()
    )

    if int(finalType.Min) != int(finalType.Max):
        # Add assignment to the length member, it exists when
        # SEQUENCE OF is variable length
        statements.append(
            AssignmentBuilder()
            .withTarget(length_field)
            .withSource(promelamodel.IntegerValue(length))
            .build()
        )

    for index in range(length):
        field = sdlmodel.ArrayAccess(left, sdlmodel.Constant(str(index)))
        field.type = finalType.type
        statements.extend(
            __generate_assignment(
                context,
                field,
                right.elements[index],
                finalType.type,
            )
        )

    return statements


@dispatch(
    Context,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Choice,
    type,
)
def __generate_assignment(
    context: Context,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Choice,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(context.sdl_model.types, left_type)
    statements: List[promelamodel.Statement] = []

    candidates = [
        name
        for name in finalType.Children
        if name.replace("-", "_").lower() == right.choice.lower()
    ]

    if len(candidates) == 0:
        error = f"Invalid assignment to CHOICE {finalType.CName}, "
        error += f"variant '{right.choice}' does not exist."
        raise Exception(error)
    elif len(candidates) > 1:
        error = f"Invalid assignment to CHOICE {finalType.CName}, "
        error += f"variant '{right.choice}' is ambiguous."
        raise Exception(error)

    selected_alternative = candidates[0]

    valueType = finalType.Children[selected_alternative].type

    selection = (
        __type_name(left_type)
        + "_"
        + selected_alternative.replace("-", "_")
        + "_PRESENT"
    )

    selection_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(context, left, True))
        .withMember(VariableReferenceBuilder(CHOICE_SELECTION_MEMBER_NAME).build())
        .build()
    )

    data_field = sdlmodel.MemberAccess(
        left,
        sdlmodel.VariableReference(selected_alternative.replace("-", "_")),
    )

    data_field.type = right.type

    statements.append(
        AssignmentBuilder()
        .withTarget(selection_field)
        .withSource(VariableReferenceBuilder(selection).build())
        .build()
    )

    statements.extend(
        __generate_assignment(context, data_field, right.value, valueType)
    )

    return statements


@dispatch(Context, sdlmodel.Transition, sdlmodel.Decision)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    decision: sdlmodel.Decision,
) -> promelamodel.Statement:
    builder = SwitchBuilder()
    for answer in decision.answers:
        statements = []
        for action in answer.actions:
            statements.append(__generate_statement(context, transition, action))
        if len(statements) == 0:
            statements.append(promelamodel.Skip())

        if decision.condition is None:
            if not context.is_observer:
                raise Exception(f"Decision block ANY is allowed only for observers")
            # Decision 'ANY'
            builder.withAlternative(
                AlternativeBuilder()
                .withCondition(promelamodel.IntegerValue(1))
                .withStatements(statements)
                .build()
            )
        else:
            if answer.condition is None:
                # If there's no condition, generate 'else'
                builder.withAlternative(
                    AlternativeBuilder().withStatements(statements).build()
                )
            else:
                builder.withAlternative(
                    AlternativeBuilder()
                    .withCondition(
                        __translate_answer_condition(
                            context, transition, decision.condition, answer.condition
                        )
                    )
                    .withStatements(statements)
                    .build()
                )
    return builder.build()


@dispatch(Context, sdlmodel.Transition, sdlmodel.NextState)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    next_state: sdlmodel.NextState,
) -> promelamodel.Statement:
    statements: List[promelamodel.Statement] = []
    if next_state.state_name == "":
        if not context.state_aggregation:
            statements.append(__terminate_transition_statement(context))
            statements.append(promelamodel.GoTo(context.get_continuous_signals_label()))
        return promelamodel.StatementsWrapper(statements)

    if next_state.substate:
        state_variable = __get_substate_variable_name(context, next_state.substate)
    else:
        state_variable = __get_state_variable_name(context)

    state = context.sdl_model.states[next_state.state_name.lower()]

    state_name = __get_state_name(context, state)
    if not context.state_aggregation:
        statements.append(__terminate_transition_statement(context))
    statements.append(
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(state_variable).build())
        .withSource(VariableReferenceBuilder(state_name).build())
        .build()
    )
    if not context.state_aggregation:
        statements.append(promelamodel.GoTo(context.get_continuous_signals_label()))
    return promelamodel.StatementsWrapper(statements)


@dispatch(Context, sdlmodel.Transition, sdlmodel.NextTransition)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    next_transition: sdlmodel.NextTransition,
) -> promelamodel.Statement:

    if isinstance(next_transition.transition_id, str):
        if next_transition.transition_id in context.sdl_model.aggregates:
            # Next transition is a call to inline
            # which executes transition for parallel state
            inlineCall = CallBuilder()
            inlineCall.withTarget(next_transition.transition_id)
            statements = []
            if next_transition.state_name is not None:
                state_variable = __get_state_variable_name(context)
                state = context.sdl_model.states[next_transition.state_name.lower()]
                state_name = __get_state_name(context, state)

                statements.append(
                    AssignmentBuilder()
                    .withTarget(VariableReferenceBuilder(state_variable).build())
                    .withSource(VariableReferenceBuilder(state_name).build())
                    .build()
                )
            statements.append(inlineCall.build())
            statements.append(__terminate_transition_statement(context))
            return (
                BlockBuilder(promelamodel.BlockType.BLOCK)
                .withStatements(statements)
                .build()
            )
        elif next_transition.transition_id in context.sdl_model.named_transition_ids:
            transition_id = context.sdl_model.named_transition_ids[
                next_transition.transition_id
            ]
        else:
            raise Exception(
                "Missing value for transition_id {}".format(
                    next_transition.transition_id
                )
            )
    else:
        transition_id = next_transition.transition_id
    return (
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(context.get_transition_variable()).build())
        .withSource(VariableReferenceBuilder(str(transition_id)).build())
        .build()
    )


@dispatch(Context, sdlmodel.Transition, sdlmodel.TransitionChoice)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    transition_choice: sdlmodel.TransitionChoice,
) -> promelamodel.Statement:
    builder = SwitchBuilder()
    state_variable_name = __get_state_variable_name(context)

    for state, transition_id in transition_choice.candidates.items():
        if isinstance(transition_id, str):
            # OpenGEODE might return string, in such case it should be named transition id
            if transition_id in context.sdl_model.named_transition_ids:
                transition_id = context.sdl_model.named_transition_ids[transition_id]
            else:
                raise Exception(f"Missing value for transition_id {transition_id}")
        builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder(state_variable_name).build())
                .withRight(
                    VariableReferenceBuilder(__get_state_name(context, state)).build()
                )
                .build()
            )
            .withStatements(
                [
                    AssignmentBuilder()
                    .withTarget(
                        VariableReferenceBuilder(
                            context.get_transition_variable()
                        ).build()
                    )
                    .withSource(promelamodel.IntegerValue(transition_id))
                    .build()
                ]
            )
            .build()
        )

    builder.withAlternative(
        AlternativeBuilder()
        .withStatements([__terminate_transition_statement(context)])
        .build()
    )

    return builder.build()


@dispatch(Context, sdlmodel.Transition, sdlmodel.ProcedureCall)
def __generate_statement(
    context: Context,
    transition: sdlmodel.Transition,
    call: sdlmodel.ProcedureCall,
) -> promelamodel.Statement:
    if builtins.is_builtin(call.name):
        parameters = []
        types = []
        for parameter in call.parameters:
            parameters.append(__generate_expression(context, parameter))
            types.append(parameter.type)
        return builtins.translate_builtin(
            call, parameters, types, context.sdl_model.types
        )
    elif call.name.lower() == "set_timer":
        if len(call.parameters) != 2:
            raise Exception("Invalid parameters for 'set_timer' procedure.")
        if not isinstance(call.parameters[1], sdlmodel.VariableReference):
            raise Exception("Invalid parameters for 'set_timer' procedure.")
        timer_name = call.parameters[1].variableName.lower()
        timer_interval = __generate_expression(context, call.parameters[0])
        if timer_name not in context.sdl_model.timers:
            raise Exception(f"Timer '{timer_name}' does not exist.")
        procedure_name = __get_procedure_inline_name(context, f"{timer_name}_set")
        return (
            CallBuilder()
            .withTarget(procedure_name)
            .withParameter(timer_interval)
            .build()
        )
    elif call.name.lower() == "reset_timer":
        if len(call.parameters) != 1:
            raise Exception("Invalid parameters for 'reset_timer' procedure.")
        if not isinstance(call.parameters[0], sdlmodel.VariableReference):
            raise Exception("Invalid parameters for 'set_timer' procedure.")
        timer_name = call.parameters[0].variableName.lower()
        if timer_name not in context.sdl_model.timers:
            raise Exception(f"Timer '{timer_name}' does not exist.")
        procedure_name = __get_procedure_inline_name(context, f"{timer_name}_reset")
        return CallBuilder().withTarget(procedure_name).build()
    else:
        procedure_inline_name = __get_procedure_inline_name(context, call.name)
        if call.name.lower() in context.sdl_model.procedures:
            if (
                context.sdl_model.procedures[call.name.lower()].type
                == sdlmodel.ProcedureType.EXTERNAL
            ):
                procedure_inline_name = __get_external_procedure_inline_name(
                    context, call.name
                )
            if (
                context.sdl_model.procedures[call.name.lower()].type
                == sdlmodel.ProcedureType.EXPORTED
            ):
                procedure_inline_name = __get_exported_procedure_inline_name(
                    context, call.name
                )
        inlineCall = CallBuilder()
        inlineCall.withTarget(procedure_inline_name)
        for parameter in call.parameters:
            inlineCall.withParameter(__generate_expression(context, parameter))
        return inlineCall.build()


@dispatch(Context, sdlmodel.Transition, sdlmodel.Output)
def __generate_statement(
    context: Context, transition: sdlmodel.Transition, output: sdlmodel.Output
) -> promelamodel.Statement:
    name = __get_remote_function_name(context, output)
    if len(output.parameters) == 0:
        return CallBuilder().withTarget(name).build()
    else:
        if _check_type_is_complex(
            context, output.parameters[0].type
        ) and not isinstance(output.parameters[0], sdlmodel.VariableReference):
            output_name = output.name.lower()
            if output_name not in context.sdl_model.outputs:
                raise Exception(
                    f"Cannot find signal with name {output_name}, while translating output block"
                )
            output_parameter_type = context.sdl_model.outputs[output_name]
            if output_parameter_type is None:
                raise Exception(
                    f"The output signal with name {output_name}, has not parameters, but some were given"
                )
            statements: List[promelamodel.Statement] = []
            tmp_variable_name = context.generate_temporary_variable()
            statements.append(
                VariableDeclarationBuilder(
                    tmp_variable_name, __type_name(output_parameter_type)
                ).build()
            )
            tmp_variable_ref = sdlmodel.VariableReference(tmp_variable_name)
            tmp_variable_ref.type = output_parameter_type
            statements.extend(
                __generate_assignment(
                    context,
                    tmp_variable_ref,
                    output.parameters[0],
                    output_parameter_type,
                )
            )
            statements.append(
                CallBuilder()
                .withTarget(name)
                .withParameter(__generate_expression(context, tmp_variable_ref))
                .build()
            )
            return promelamodel.StatementsWrapper(statements)
        else:
            parameter_name = __generate_expression(context, output.parameters[0])
            return CallBuilder().withTarget(name).withParameter(parameter_name).build()


def __should_generate_transition_stop(transition: sdlmodel.Transition) -> bool:
    if len(transition.actions) == 0:
        return True
    return False


def __generate_transition(
    context: Context, transition: sdlmodel.Transition
) -> List[promelamodel.Statement]:
    context.push_parent(transition)
    statements = []
    for action in transition.actions:
        statements.append(__generate_statement(context, transition, action))

    if not context.in_transition_chain:
        if not isinstance(transition.parent, sdlmodel.Procedure):
            # Procedures do not change the current transition
            if __should_generate_transition_stop(transition):
                statements.append(__terminate_transition_statement(context))

    context.pop_parent()
    return statements


def __generate_init_function(context: Context) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_init_function_name(context))
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    for name, info in context.sdl_model.variables.items():
        if info.value is not None:
            variable_ref = sdlmodel.VariableReference(name)
            variable_ref.type = info.type
            blockBuilder.withStatements(
                __generate_assignment(context, variable_ref, info.value, info.type)
            )

    transition_function_name = __get_transition_function_name(context)
    blockBuilder.withStatements(
        [
            CallBuilder()
            .withTarget(transition_function_name)
            .withParameter(VariableReferenceBuilder(str(0)).build())
            .build()
        ]
    )
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __generate_continuous_signals_alternative(
    context: Context,
    transition_id: str,
    signals: List[sdlmodel.ContinuousSignal],
    is_loop: bool,
) -> List[promelamodel.Statement]:
    statements: List[promelamodel.Statement] = []
    message = f"process continuous signals in {context.sdl_model.process_name}\\n"

    for signal in signals:
        statements.append(
            SwitchBuilder()
            .withAlternative(
                AlternativeBuilder()
                .withCondition(__generate_expression(context, signal.trigger))
                .withStatements(
                    [
                        PrintfBuilder()
                        .withParameter(promelamodel.StringValue(message))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder(transition_id).build())
                        .withSource(promelamodel.IntegerValue(signal.transition))
                        .build(),
                    ]
                )
                .build()
            )
            .withAlternative(
                AlternativeBuilder()
                .withStatements(
                    [promelamodel.Break() if is_loop else promelamodel.Skip()]
                )
                .build()
            )
            .build()
        )
    return statements


def __generate_continuous_signals_block(context: Context) -> promelamodel.Statement:
    inner_switch_builder = SwitchBuilder()
    state_variable_name = __get_state_variable_name(context)
    for name, signals in context.sdl_model.continuous_signals.items():
        if len(signals) > 0:
            statements = __generate_continuous_signals_alternative(
                context, context.get_transition_variable(), signals, False
            )
            state = context.sdl_model.states[name]
            state_name = __get_state_name(context, state)
            inner_switch_builder.withAlternative(
                AlternativeBuilder()
                .withCondition(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                    .withLeft(VariableReferenceBuilder(state_variable_name).build())
                    .withRight(VariableReferenceBuilder(state_name).build())
                    .build()
                )
                .withStatements(statements)
                .build()
            )

    inner_switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Skip()]).build()
    )

    return inner_switch_builder.build()


def __generate_continuous_signals_block_for_observer(
    context: Context,
) -> promelamodel.Statement:
    inner_switch_builder = DoBuilder()
    state_variable_name = __get_state_variable_name(context)
    for name, signals in context.sdl_model.continuous_signals.items():
        if len(signals) > 0:
            statements: List[promelamodel.Statement] = []
            statements.append(
                AssignmentBuilder()
                .withTarget(
                    VariableReferenceBuilder(
                        context.get_observer_transition_variable()
                    ).build()
                )
                .withSource(promelamodel.IntegerValue(-1))
                .build()
            )
            statements.extend(
                __generate_continuous_signals_alternative(
                    context, context.get_observer_transition_variable(), signals, True
                )
            )
            transition_inline = __get_transition_function_name(context)
            param = VariableReferenceBuilder(
                context.get_observer_transition_variable()
            ).build()
            statements.append(
                CallBuilder().withTarget(transition_inline).withParameter(param).build()
            )
            state = context.sdl_model.states[name]
            state_name = __get_state_name(context, state)
            inner_switch_builder.withAlternative(
                AlternativeBuilder()
                .withCondition(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                    .withLeft(VariableReferenceBuilder(state_variable_name).build())
                    .withRight(VariableReferenceBuilder(state_name).build())
                    .build()
                )
                .withStatements(statements)
                .build()
            )

    inner_switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Break()]).build()
    )

    return inner_switch_builder.build()


def __generate_continuous_signals(context: Context) -> promelamodel.Statement:
    block = __generate_continuous_signals_block(context)

    check_queue_inline = "{}_check_queue".format(context.sdl_model.process_name)
    switch_builder = SwitchBuilder()
    switch_builder.withAlternative(
        AlternativeBuilder()
        .withCondition(CallBuilder().withTarget(check_queue_inline).build())
        .withStatements([block])
        .build()
    )
    switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Skip()]).build()
    )

    return switch_builder.build()


def __generate_transition_function(context: Context) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_transition_function_name(context))
    builder.withParameter(__TRANSITION_ARGUMENT)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    do_builder = DoBuilder()
    switch_builder = SwitchBuilder()

    switch_builder.withAlternative(
        AlternativeBuilder()
        .withCondition(
            BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
            .withLeft(
                VariableReferenceBuilder(context.get_transition_variable()).build()
            )
            .withRight(VariableReferenceBuilder(__INVALID_ID).build())
            .build()
        )
        .withStatements([promelamodel.Break()])
        .build()
    )

    for id, transition in context.sdl_model.transitions.items():
        switch_builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(
                    VariableReferenceBuilder(context.get_transition_variable()).build()
                )
                .withRight(VariableReferenceBuilder(str(id)).build())
                .build()
            )
            .withStatements(__generate_transition(context, transition))
            .build()
        )

    statements: List[promelamodel.Statement] = []
    statements.append(switch_builder.build())
    statements.append(promelamodel.Label(context.get_continuous_signals_label()))
    continuous_signals_present = False
    for _, signals in context.sdl_model.continuous_signals.items():
        if len(signals) > 0:
            continuous_signals_present = True
    if continuous_signals_present and not context.is_observer:
        statements.append(__generate_continuous_signals(context))
    if context.sdl_model.floating_labels:
        statements.append(promelamodel.GoTo(__NEXT_TRANSITION_LABEL_NAME))
        for name, label in context.sdl_model.floating_labels.items():
            statements.append(promelamodel.Label(name.lower()))
            fake_transition = sdlmodel.Transition()
            fake_transition.actions = label.actions
            statements.extend(__generate_transition(context, fake_transition))
            statements.append(promelamodel.GoTo(__NEXT_TRANSITION_LABEL_NAME))
        statements.append(promelamodel.Label(__NEXT_TRANSITION_LABEL_NAME))

    do_builder.withAlternative(AlternativeBuilder().withStatements(statements).build())

    blockBuilder.withStatements(
        [
            VariableDeclarationBuilder(
                context.get_transition_variable(), __TRANSITION_TYPE_NAME
            ).build(),
            AssignmentBuilder()
            .withTarget(
                VariableReferenceBuilder(context.get_transition_variable()).build()
            )
            .withSource(VariableReferenceBuilder(__TRANSITION_ARGUMENT).build())
            .build(),
            do_builder.build(),
        ]
    )
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __generate_observer_check_inline(context: Context) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_observer_check_function_name(context))

    continuous_signals_present = False
    for _, signals in context.sdl_model.continuous_signals.items():
        if len(signals) > 0:
            continuous_signals_present = True

    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    if continuous_signals_present:
        blockBuilder.withStatement(
            VariableDeclarationBuilder(
                context.get_observer_transition_variable(), __TRANSITION_TYPE_NAME
            ).build()
        )
        blockBuilder.withStatement(
            __generate_continuous_signals_block_for_observer(context)
        )
    else:
        blockBuilder.withStatement(promelamodel.Skip())

    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __generate_implicit_variable_definition(
    context: Context, variable_name: str, variable_info: sdlmodel.VariableInfo
) -> promelamodel.VariableDeclaration:
    mangled_name = __get_implicit_variable_name(context, variable_name)
    return VariableDeclarationBuilder(
        mangled_name, __type_name(variable_info.type)
    ).build()


def __generate_aggregate_inline(
    context: Context, aggregate_name: str, transitions: List[int]
) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(aggregate_name)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    context.in_transition_chain = True
    for transition_id in transitions:
        if transition_id not in context.sdl_model.transitions:
            raise Exception(f"Missing transition with id {transition_id}")
        transition = context.sdl_model.transitions[transition_id]
        context.state_aggregation = True
        blockBuilder.withStatements(__generate_transition(context, transition))
        context.state_aggregation = False

    builder.withDefinition(blockBuilder.build())

    context.in_transition_chain = False

    return builder.build()


def translate(
    sdl_model: sdlmodel.Model, is_observer: bool = False
) -> promelamodel.Model:
    """
    Translate an SDL model into a Promela model.
    :param sdl_model: SDL model to be translated.
    :param is_observer: True if SDL model is an observer, otherwise False.
    :returns: Promela model.
    """
    builder = ModelBuilder()
    context = Context(sdl_model)
    context.is_observer = is_observer
    # Variables must be first
    for variable_name, variable_type in sdl_model.implicit_variables.items():
        builder.withVariable(
            __generate_implicit_variable_definition(
                context, variable_name, variable_type
            )
        )
    # Inlines for procedures must be before the transitions
    for procedure in sdl_model.procedures.values():
        if procedure.type != sdlmodel.ProcedureType.EXTERNAL:
            builder.withInline(__generate_procedure_inline(context, procedure))
    for aggregate_name, transitions in sdl_model.aggregates.items():
        builder.withInline(
            __generate_aggregate_inline(context, aggregate_name, transitions)
        )
    builder.withInline(__generate_transition_function(context))
    if context.is_observer:
        builder.withInline(__generate_observer_check_inline(context))
    builder.withInline(__generate_init_function(context))
    for name, input in sdl_model.inputs.items():
        builder.withInline(__generate_input_function(context, input))
    model = builder.build()
    return model
