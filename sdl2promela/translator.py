from typing import List, Union
from multipledispatch import dispatch

from opengeode.AdaGenerator import SEPARATOR

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
from .utils import resolve_asn1_type

__TRANSITION_TYPE_NAME = "int"
__TRANSITION_ARGUMENT = "id"
__TRANSITION_ID = "transition_id"
__INVALID_ID = "-1"
__STATE_VARIABLE = "state"
__INIT = "init"
__STATES_SEPARATOR = "_States_"
__GLOBAL_STATE = "global_state"
__NEXT_TRANSITION_LABEL_NAME = "next_transition"
__PARAMETER_POSTFIX = "_param_in"

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


def __get_assign_value_inline_name(type: object) -> str:
    return "{}_assign_value".format(type.CName)


def __get_promela_binary_operator(
    op: sdlmodel.BinaryOperator,
) -> promelamodel.BinaryOperator:
    if op not in __BINARY_OPERATOR_DICTIONARY.keys():
        raise NotImplementedError(
            f"{str(op)} operator is not available in this context"
        )
    return __BINARY_OPERATOR_DICTIONARY[op]


def __get_transition_function_name(sdl_model: sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + "transition"


def __get_input_function_name(sdl_model: sdlmodel.Model, input: sdlmodel.Input) -> str:
    return sdl_model.process_name + SEPARATOR + "PI" + SEPARATOR + input.name


def __get_init_function_name(sdl_model: sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + __INIT


def __get_state_variable_name(sdl_model: sdlmodel.Model) -> str:
    return (
        __GLOBAL_STATE + "." + sdl_model.process_name.lower() + "." + __STATE_VARIABLE
    )


def __get_variable_name(sdl_model: sdlmodel.Model, variable: str):
    return (
        MemberAccessBuilder()
        .withUtypeReference(
            MemberAccessBuilder()
            .withUtypeReference(VariableReferenceBuilder(__GLOBAL_STATE).build())
            .withMember(
                VariableReferenceBuilder(sdl_model.process_name.lower()).build()
            )
            .build()
        )
        .withMember(VariableReferenceBuilder(variable.lower()).build())
        .build()
    )


@dispatch(sdlmodel.Model, sdlmodel.VariableReference, bool)
def __generate_variable_name(
    sdl_model: sdlmodel.Model,
    variable_reference: sdlmodel.VariableReference,
    toplevel: bool,
):
    if toplevel:
        return __get_variable_name(sdl_model, variable_reference.variableName)
    else:
        return VariableReferenceBuilder(variable_reference.variableName.lower()).build()


@dispatch(sdlmodel.Model, sdlmodel.ConstantReference, bool)
def __generate_variable_name(
    sdl_model: sdlmodel.Model,
    constant_reference: sdlmodel.ConstantReference,
    toplevel: bool,
):
    if constant_reference.constantName == "{}_ctxt".format(
        sdl_model.process_implementation_name.lower()
    ):
        # When process is an instance of process type,
        # this reference name shall be overwriten
        return VariableReferenceBuilder(
            "{}_ctxt".format(sdl_model.process_name.lower())
        ).build()
    else:
        return VariableReferenceBuilder(constant_reference.constantName.lower()).build()


@dispatch(sdlmodel.Model, sdlmodel.MemberAccess, bool)
def __generate_variable_name(
    sdl_model: sdlmodel.Model,
    member_access: sdlmodel.MemberAccess,
    toplevel: bool,
):
    return (
        MemberAccessBuilder()
        .withUtypeReference(
            __generate_variable_name(sdl_model, member_access.sequence, toplevel)
        )
        .withMember(__generate_variable_name(sdl_model, member_access.member, False))
        .build()
    )


@dispatch(sdlmodel.Model, sdlmodel.ArrayAccess, bool)
def __generate_variable_name(
    sdl_model: sdlmodel.Model,
    array_access: sdlmodel.ArrayAccess,
    toplevel: bool,
):
    return (
        ArrayAccessBuilder()
        .withArray(
            MemberAccessBuilder()
            .withUtypeReference(
                __generate_variable_name(sdl_model, array_access.array, toplevel)
            )
            .withMember(VariableReferenceBuilder(SEQUENCEOF_DATA_MEMBER_NAME).build())
            .build()
        )
        .withIndex(__generate_expression(sdl_model, array_access.element))
        .build()
    )


@dispatch(sdlmodel.Model, sdlmodel.Constant)
def __generate_expression(sdl_model: sdlmodel.Model, constant: sdlmodel.Constant):
    return VariableReferenceBuilder(constant.value).build()


@dispatch(sdlmodel.Model, sdlmodel.VariableReference)
def __generate_expression(
    sdl_model: sdlmodel.Model, variable: sdlmodel.VariableReference
):
    return __generate_variable_name(sdl_model, variable, True)


@dispatch(sdlmodel.Model, sdlmodel.EnumValue)
def __generate_expression(sdl_model: sdlmodel.Model, enumValue: sdlmodel.EnumValue):
    finalType = resolve_asn1_type(sdl_model.types, enumValue.type)
    value = "{}_{}".format(finalType.CName, enumValue.value)
    return VariableReferenceBuilder(value).build()


@dispatch(sdlmodel.Model, sdlmodel.ArrayAccess)
def __generate_expression(
    sdl_model: sdlmodel.Model, array_access: sdlmodel.ArrayAccess
):
    return __generate_variable_name(sdl_model, array_access, True)


@dispatch(sdlmodel.Model, sdlmodel.MemberAccess)
def __generate_expression(
    sdl_model: sdlmodel.Model, member_access: sdlmodel.MemberAccess
):
    return __generate_variable_name(sdl_model, member_access, True)


@dispatch(sdlmodel.Model, sdlmodel.BinaryExpression)
def __generate_expression(
    sdl_model: sdlmodel.Model, expression: sdlmodel.BinaryExpression
):
    if expression.operator == sdlmodel.BinaryOperator.ASSIGN:
        pass
    elif expression.operator == sdlmodel.BinaryOperator.XOR:
        return (
            BinaryExpressionBuilder(promelamodel.BinaryOperator.OR)
            .withLeft(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                .withLeft(
                    UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                    .withExpression(__generate_expression(sdl_model, expression.left))
                    .build()
                )
                .withRight(__generate_expression(sdl_model, expression.right))
                .build()
            )
            .withRight(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                .withLeft(__generate_expression(sdl_model, expression.left))
                .withRight(
                    UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                    .withExpression(__generate_expression(sdl_model, expression.right))
                    .build()
                )
                .build()
            )
            .build()
        )
    elif expression.operator == sdlmodel.BinaryOperator.IMPLIES:
        return (
            BinaryExpressionBuilder(promelamodel.BinaryOperator.OR)
            .withLeft(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.AND)
                .withLeft(__generate_expression(sdl_model, expression.left))
                .withRight(__generate_expression(sdl_model, expression.right))
                .build()
            )
            .withRight(
                UnaryExpressionBuilder(promelamodel.UnaryOperator.NOT)
                .withExpression(__generate_expression(sdl_model, expression.left))
                .build()
            )
            .build()
        )
    else:
        return (
            BinaryExpressionBuilder(__get_promela_binary_operator(expression.operator))
            .withLeft(__generate_expression(sdl_model, expression.left))
            .withRight(__generate_expression(sdl_model, expression.right))
            .build()
        )


@dispatch(sdlmodel.Model, sdlmodel.UnaryExpression)
def __generate_expression(
    sdl_model: sdlmodel.Model, expression: sdlmodel.UnaryExpression
):
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
        .withExpression(__generate_expression(sdl_model, expression.expression))
        .build()
    )


def __get_parameter_name(variable_reference: sdlmodel.VariableReference) -> str:
    return variable_reference.variableName.lower() + __PARAMETER_POSTFIX


def __get_state_name(sdl_model: sdlmodel.Model, state: sdlmodel.State) -> str:
    return sdl_model.process_implementation_name + __STATES_SEPARATOR + state.name


def __get_remote_function_name(
    sdl_model: sdlmodel.Model, output: sdlmodel.Output
) -> str:
    return sdl_model.process_name + SEPARATOR + "RI" + SEPARATOR + output.name


def __generate_input_function(
    sdl_model: sdlmodel.Model, input: sdlmodel.Input
) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_input_function_name(sdl_model, input))
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    for parameter in input.parameters:
        builder.withParameter(__get_parameter_name(parameter.target_variable))

        variable = sdl_model.variables[parameter.target_variable.variableName]
        variableType = resolve_asn1_type(sdl_model.types, variable[0])
        assignInlineName = __get_assign_value_inline_name(variableType)

        blockBuilder.withStatements(
            [
                CallBuilder()
                .withTarget(assignInlineName)
                .withParameter(
                    __generate_variable_name(sdl_model, parameter.target_variable, True)
                )
                .withParameter(
                    VariableReferenceBuilder(
                        __get_parameter_name(parameter.target_variable)
                    ).build()
                )
                .build()
            ]
        )

    switch_builder = SwitchBuilder()

    state_variable_name = __get_state_variable_name(sdl_model)
    transition_function_name = __get_transition_function_name(sdl_model)

    for index, state in input.transitions.items():
        switch_builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder(state_variable_name).build())
                .withRight(
                    VariableReferenceBuilder(__get_state_name(sdl_model, state)).build()
                )
                .build()
            )
            .withStatements(
                [
                    CallBuilder()
                    .withTarget(transition_function_name)
                    .withParameter(VariableReferenceBuilder(str(index)).build())
                    .build()
                ]
            )
            .build()
        )

    switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Break()]).build()
    )

    blockBuilder.withStatements([switch_builder.build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __translate_answer_condition(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    left: sdlmodel.Expression,
    right: sdlmodel.Expression,
) -> promelamodel.Statement:
    if right.left is None:
        expression = sdlmodel.BinaryExpression()
        expression.left = left
        expression.operator = right.operator
        expression.right = right.right
        return __generate_expression(sdl_model, expression)
    raise NotImplementedError(
        "translate_answer_condition not implemented for " + left + " and " + right
    )


@dispatch
def __generate_statement(sdl_model, transition, action) -> promelamodel.Statement:
    raise NotImplementedError("generate_statement not implemented for " + action)


def __generate_for_over_a_numeric_range(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    task: sdlmodel.ForLoopTask,
    inner_statements: List[promelamodel.Statement],
) -> promelamodel.Statement:
    block_builder = BlockBuilder(promelamodel.BlockType.BLOCK)
    iteratorReference = __generate_variable_name(sdl_model, task.iteratorName, True)
    block_builder.withStatements(
        [
            AssignmentBuilder()
            .withTarget(iteratorReference)
            .withSource(__generate_expression(sdl_model, task.range.start))
            .build()
        ]
    )
    block_builder.withStatements(
        [
            DoBuilder()
            .withAlternative(
                AlternativeBuilder()
                .withCondition(
                    BinaryExpressionBuilder(promelamodel.BinaryOperator.LESS)
                    .withLeft(iteratorReference)
                    .withRight(__generate_expression(sdl_model, task.range.stop))
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
                            .withRight(
                                __generate_expression(sdl_model, task.range.step)
                            )
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
    return block_builder.build()


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.ForLoopTask)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    task: sdlmodel.ForLoopTask,
) -> promelamodel.Statement:
    inner_statements = []
    for action in task.actions:
        statement = __generate_statement(sdl_model, transition, action)
        inner_statements.append(statement)

    if isinstance(task.range, sdlmodel.NumericForLoopRange):
        return __generate_for_over_a_numeric_range(
            sdl_model, transition, task, inner_statements
        )
    else:
        raise NotImplementedError(
            "generate_statement not implemented for the used range specification"
        )


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.Label)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    label: sdlmodel.Label,
) -> promelamodel.Statement:
    return promelamodel.Label(label.name)


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.Join)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    join: sdlmodel.Join,
) -> promelamodel.Statement:
    return promelamodel.GoTo(join.label_name)


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.AssignmentTask)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    assignment: sdlmodel.AssignmentTask,
) -> promelamodel.Statement:
    statements: List[promelamodel.Statement] = __generate_assignment(
        sdl_model,
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


@dispatch(
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Expression,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Expression,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)

    assignInlineName = __get_assign_value_inline_name(finalType)

    statements: List[promelamodel.Statement] = []
    statements.append(
        CallBuilder()
        .withTarget(assignInlineName)
        .withParameter(__generate_variable_name(sdl_model, left, True))
        .withParameter(__generate_expression(sdl_model, right))
        .build()
    )

    return statements


def append_length_assignment_for_string_type(
    sdl_model: sdlmodel.Model,
    statements: List[promelamodel.Statement],
    target: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    target_type: object,
    length: int,
):
    length_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(sdl_model, target, True))
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
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.EmptyStringValue,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.EmptyStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        if int(finalType.Min) != 0:
            raise Exception(f"Invalid assignment to type{finalType.CName}")

        data_field = sdlmodel.MemberAccess(
            left, sdlmodel.VariableReference(STRING_DATA_MEMBER_NAME)
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            sdl_model, statements, left, finalType, 0
        )

        for index in range(int(finalType.Max)):
            element = (
                ArrayAccessBuilder()
                .withArray(__generate_variable_name(sdl_model, data_field, True))
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


def check_length_constraint(target_type: object, length: int):
    if length < int(target_type.Min) or length > int(target_type.Max):
        raise Exception(
            f"Invalid assignment: {target_type.CName} does not accept value with length {length}"
        )


@dispatch(
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.StringValue,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.StringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.value)
        check_length_constraint(finalType, length)
        data_field = sdlmodel.MemberAccess(
            left, sdlmodel.VariableReference(STRING_DATA_MEMBER_NAME)
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            sdl_model, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                ord(right.value[index]) if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(__generate_variable_name(sdl_model, data_field, True))
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
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.OctetStringValue,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.OctetStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.elements)
        check_length_constraint(finalType, length)

        data_field = sdlmodel.MemberAccess(
            left, sdlmodel.VariableReference(STRING_DATA_MEMBER_NAME)
        )

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            sdl_model, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                right.elements[index] if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(__generate_variable_name(sdl_model, data_field, True))
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
        raise Exception(f"Unsupported assignment: {finalType.kind} Octet String Value")


@dispatch(
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.BitStringValue,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.BitStringValue,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    if (
        finalType.kind == OCTET_STRING_TYPE_NAME
        or finalType.kind == IA5_STRING_TYPE_NAME
    ):
        length = len(right.elements)
        check_length_constraint(finalType, length)

        statements: List[promelamodel.Statement] = []

        append_length_assignment_for_string_type(
            sdl_model, statements, left, finalType, length
        )

        for index in range(int(finalType.Max)):
            value = promelamodel.IntegerValue(
                right.elements[index] if index < length else 0
            )
            element = (
                ArrayAccessBuilder()
                .withArray(__generate_variable_name(sdl_model, left, True))
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
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Sequence,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Sequence,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
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
            statements.extend(
                __generate_assignment(
                    sdl_model,
                    sdlmodel.MemberAccess(left, sdlmodel.VariableReference(name)),
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
                            __generate_variable_name(sdl_model, left, True)
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
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.SequenceOf,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.SequenceOf,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    if finalType.kind != SEQUENCEOF_TYPE_NAME:
        raise Exception(
            f"Invalid assignment: {finalType.CName} does not accept SEQUENCE OF value"
        )

    statements: List[promelamodel.Statement] = []

    length = len(right.elements)

    check_length_constraint(finalType, length)

    length_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(sdl_model, left, True))
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
        statements.extend(
            __generate_assignment(
                sdl_model,
                sdlmodel.ArrayAccess(left, sdlmodel.Constant(str(index))),
                right.elements[index],
                finalType.type,
            )
        )

    return statements


@dispatch(
    sdlmodel.Model,
    (
        sdlmodel.VariableReference,
        sdlmodel.ArrayAccess,
        sdlmodel.MemberAccess,
    ),
    sdlmodel.Choice,
    type,
)
def __generate_assignment(
    sdl_model: sdlmodel.Model,
    left: Union[
        sdlmodel.VariableReference, sdlmodel.ArrayAccess, sdlmodel.MemberAccess
    ],
    right: sdlmodel.Choice,
    left_type: type,
) -> List[promelamodel.Statement]:
    finalType = resolve_asn1_type(sdl_model.types, left_type)
    statements: List[promelamodel.Statement] = []

    if right.choice not in finalType.Children:
        raise Exception(
            "Invalid assignment to CHOICE: variant {} does not exist".format(
                right.choice
            )
        )

    valueType = finalType.Children[right.choice].type

    selection = finalType.CName + "_" + right.choice + "_PRESENT"

    selection_field = (
        MemberAccessBuilder()
        .withUtypeReference(__generate_variable_name(sdl_model, left, True))
        .withMember(VariableReferenceBuilder(CHOICE_SELECTION_MEMBER_NAME).build())
        .build()
    )

    data_field = sdlmodel.MemberAccess(
        sdlmodel.MemberAccess(
            left, sdlmodel.VariableReference(CHOICE_DATA_MEMBER_NAME)
        ),
        sdlmodel.VariableReference(right.choice),
    )

    statements.append(
        AssignmentBuilder()
        .withTarget(selection_field)
        .withSource(VariableReferenceBuilder(selection).build())
        .build()
    )

    statements.extend(
        __generate_assignment(sdl_model, data_field, right.value, valueType)
    )

    return statements


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.Decision)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    decision: sdlmodel.Decision,
) -> promelamodel.Statement:
    builder = SwitchBuilder()
    for answer in decision.answers:
        statements = []
        for action in answer.actions:
            statements.append(__generate_statement(sdl_model, transition, action))
        if len(statements) == 0:
            statements.append(promelamodel.Skip())
        for condition in answer.conditions:
            builder.withAlternative(
                AlternativeBuilder()
                .withCondition(
                    __translate_answer_condition(
                        sdl_model, transition, decision.condition, condition
                    )
                )
                .withStatements(statements)
                .build()
            )
    return builder.build()


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.NextState)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    next_state: sdlmodel.NextState,
) -> promelamodel.Statement:
    state_variable = __get_state_variable_name(sdl_model)
    state = sdl_model.states[next_state.state_name.lower()]
    state_name = __get_state_name(sdl_model, state)
    return (
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(state_variable).build())
        .withSource(VariableReferenceBuilder(state_name).build())
        .build()
    )


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.Output)
def __generate_statement(
    sdl_model: sdlmodel.Model, transition: sdlmodel.Transition, output: sdlmodel.Output
) -> promelamodel.Statement:
    name = __get_remote_function_name(sdl_model, output)
    if len(output.parameters) == 0:
        return CallBuilder().withTarget(name).build()
    else:
        parameter_name = __generate_variable_name(sdl_model, output.parameters[0], True)
        return CallBuilder().withTarget(name).withParameter(parameter_name).build()


def __generate_transition(
    sdl_model: sdlmodel.Model, transition: sdlmodel.Transition
) -> List[promelamodel.Statement]:
    statements = []
    for action in transition.actions:
        statements.append(__generate_statement(sdl_model, transition, action))

    # TODO - this should be conditional
    statements.append(
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(__TRANSITION_ID).build())
        .withSource(VariableReferenceBuilder(__INVALID_ID).build())
        .build()
    )

    return statements


def __generate_init_function(sdl_model: sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_init_function_name(sdl_model))
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    transition_function_name = __get_transition_function_name(sdl_model)
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


def __generate_continuous_signals(sdl_model: sdlmodel.Model) -> promelamodel.Statement:
    inner_switch_builder = SwitchBuilder()
    state_variable_name = __get_state_variable_name(sdl_model)
    for name, signals in sdl_model.continuous_signals.items():
        if len(signals) > 0:
            statements = []
            for signal in signals:
                statements.append(
                    SwitchBuilder()
                    .withAlternative(
                        AlternativeBuilder()
                        .withCondition(__generate_expression(sdl_model, signal.trigger))
                        .withStatements(
                            [
                                AssignmentBuilder()
                                .withTarget(
                                    VariableReferenceBuilder(__TRANSITION_ID).build()
                                )
                                .withSource(
                                    promelamodel.IntegerValue(signal.transition)
                                )
                                .build()
                            ]
                        )
                        .build()
                    )
                    .withAlternative(
                        AlternativeBuilder()
                        .withStatements([promelamodel.Skip()])
                        .build()
                    )
                    .build()
                )
            state = sdl_model.states[name]
            state_name = __get_state_name(sdl_model, state)
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

    check_queue_inline = "{}_check_queue".format(sdl_model.process_name)
    switch_builder = SwitchBuilder()
    switch_builder.withAlternative(
        AlternativeBuilder()
        .withCondition(CallBuilder().withTarget(check_queue_inline).build())
        .withStatements([inner_switch_builder.build()])
        .build()
    )
    switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Skip()]).build()
    )

    return switch_builder.build()


def __generate_transition_function(sdl_model: sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_transition_function_name(sdl_model))
    builder.withParameter(__TRANSITION_ARGUMENT)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    do_builder = DoBuilder()
    switch_builder = SwitchBuilder()

    switch_builder.withAlternative(
        AlternativeBuilder()
        .withCondition(
            BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
            .withLeft(VariableReferenceBuilder(__TRANSITION_ID).build())
            .withRight(VariableReferenceBuilder(__INVALID_ID).build())
            .build()
        )
        .withStatements([promelamodel.Break()])
        .build()
    )

    for id, transition in sdl_model.transitions.items():
        switch_builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder(__TRANSITION_ID).build())
                .withRight(VariableReferenceBuilder(str(id)).build())
                .build()
            )
            .withStatements(__generate_transition(sdl_model, transition))
            .build()
        )

    statements = []
    statements.append(switch_builder.build())
    continuous_signals_present = False
    for _, signals in sdl_model.continuous_signals.items():
        if len(signals) > 0:
            continuous_signals_present = True
    if continuous_signals_present:
        statements.append(__generate_continuous_signals(sdl_model))
    if sdl_model.floating_labels:
        statements.append(promelamodel.GoTo(__NEXT_TRANSITION_LABEL_NAME))
        for name, label in sdl_model.floating_labels.items():
            statements.append(promelamodel.Label(name))
            fake_transition = sdlmodel.Transition()
            fake_transition.actions = label.actions
            statements.extend(__generate_transition(sdl_model, fake_transition))
            statements.append(promelamodel.GoTo(__NEXT_TRANSITION_LABEL_NAME))
        statements.append(promelamodel.Label(__NEXT_TRANSITION_LABEL_NAME))

    do_builder.withAlternative(AlternativeBuilder().withStatements(statements).build())

    blockBuilder.withStatements(
        [
            VariableDeclarationBuilder(__TRANSITION_ID, __TRANSITION_TYPE_NAME).build(),
            AssignmentBuilder()
            .withTarget(VariableReferenceBuilder(__TRANSITION_ID).build())
            .withSource(VariableReferenceBuilder(__TRANSITION_ARGUMENT).build())
            .build(),
            do_builder.build(),
        ]
    )
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def translate(sdl_model: sdlmodel.Model) -> promelamodel.Model:
    """
    Translate an SDL model into a Promela model.
    :param sdl_model: SDL model to be translated.
    :returns: Promela model.
    """
    builder = ModelBuilder()
    builder.withInline(__generate_transition_function(sdl_model))
    builder.withInline(__generate_init_function(sdl_model))
    for name, input in sdl_model.inputs.items():
        builder.withInline(__generate_input_function(sdl_model, input))
    model = builder.build()
    return model
