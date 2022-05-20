#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sdl2promela.promela.model as promela
from sdl2promela.utils import resolve_asn1_type
from . import model
import sdl2promela.promela.modelbuilder as promelaBuilder
from multipledispatch import dispatch
from typing import List, Dict, Any, Optional, Tuple
import functools
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR


class TranslateException(Exception):
    """Exception raised when model cannot be translated."""

    pass


class GenerateContext:
    """Context for translator."""

    processes: Dict[str, ogAST.Process]
    """Dict of all processes"""

    aggregates: Dict[str, Dict[str, List[Any]]]
    """Aggregates created by Helper"""

    choice_selection: Optional[str]
    """The name of the choice type, set when 'present' is used
    on left hand side of expression.
    It changes translation of right hand side of expression.
    """
    choice_selection_alternatives: Optional[List[str]]
    """List of all available choice alternatives, set when 'present is used
    on left hand side of expression.
    The alternatives are case-sensitive.
    """

    def __init__(self, processes: Dict[str, ogAST.Process]):
        self.processes = processes
        self.aggregates = {}
        self.choice_selection = None

    def clear(self):
        """Clear context.
        Shall be called after translation of children nodes.
        """
        self.choice_selection = None
        self.choice_selection_alternatives = None


def _escape_asn1_typename(name: str) -> str:
    return name.replace("-", "_")


@dispatch(GenerateContext, model.OrExpression)
def _generate(context: GenerateContext, expr: model.OrExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.OR)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.AndExpression)
def _generate(context: GenerateContext, expr: model.AndExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.XorExpression)
def _generate(context: GenerateContext, expr: model.XorExpression):
    left = _generate(context, expr.lhs)
    right = _generate(context, expr.rhs)

    context.clear()

    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.OR)
        .withLeft(
            promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
            .withLeft(left)
            .withRight(
                promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                .withExpression(right)
                .build()
            )
            .build()
        )
        .withRight(
            promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
            .withLeft(
                promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                .withExpression(left)
                .build()
            )
            .withRight(right)
            .build()
        )
        .build()
    )


@dispatch(GenerateContext, model.EqualExpression)
def _generate(context: GenerateContext, expr: model.EqualExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.EQUAL)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.NotEqualExpression)
def _generate(context: GenerateContext, expr: model.NotEqualExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.NEQUAL)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.LessExpression)
def _generate(context: GenerateContext, expr: model.LessExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.LESS)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.LessEqualExpression)
def _generate(context: GenerateContext, expr: model.LessEqualExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.LEQUAL)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.GreaterExpression)
def _generate(context: GenerateContext, expr: model.GreaterExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.GREATER)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.GreaterEqualExpression)
def _generate(context: GenerateContext, expr: model.GreaterEqualExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.GEQUAL)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.NotExpression)
def _generate(context: GenerateContext, expr: model.NotExpression):
    result = (
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
        .withExpression(_generate(context, expr.expression))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.PlusExpression)
def _generate(context: GenerateContext, expr: model.PlusExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.ADD)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.MinusExpression)
def _generate(context: GenerateContext, expr: model.MinusExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.SUBTRACT)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.MulExpression)
def _generate(context: GenerateContext, expr: model.MulExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.MULTIPLY)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.DivExpression)
def _generate(context: GenerateContext, expr: model.DivExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.DIVIDE)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.ModExpression)
def _generate(context: GenerateContext, expr: model.ModExpression):
    result = (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.MODULO)
        .withLeft(_generate(context, expr.lhs))
        .withRight(_generate(context, expr.rhs))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.NegationExpression)
def _generate(context: GenerateContext, expr: model.NegationExpression):
    result = (
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NEGATIVE)
        .withExpression(_generate(context, expr.expression))
        .build()
    )
    context.clear()
    return result


@dispatch(GenerateContext, model.IntegerValue)
def _generate(context: GenerateContext, expr: model.IntegerValue):
    return promela.IntegerValue(expr.value)


@dispatch(GenerateContext, model.FloatValue)
def _generate(context: GenerateContext, expr: model.FloatValue):
    return promela.FloatValue(expr.value)


@dispatch(GenerateContext, model.BooleanValue)
def _generate(context: GenerateContext, expr: model.BooleanValue):
    return promela.BooleanValue(expr.value)


@dispatch(GenerateContext, model.VariableReference)
def _generate(context: GenerateContext, expr: model.VariableReference):
    """Translate StopCondition VariableReference
    to Promela VariableReference.
    If choice_selection is set in context, it is a special case.
    It means that variable is a selector of CHOICE.
    """
    if context.choice_selection is not None:
        # The list of available alternatives of CHOICE is case-sensitive
        # Stop Condition Language is case-insensitive,
        # so, the existing identifier should be generated.
        selected_alternatives = [
            alternative
            for alternative in context.choice_selection_alternatives
            if alternative.lower() == expr.name.lower()
        ]
        if len(selected_alternatives) != 1:
            raise TranslateException(
                f"The CHOICE datatype '{context.choice_selection}' has no alternative with name '{expr.name}'"
            )

        return promelaBuilder.VariableReferenceBuilder(
            context.choice_selection + "_" + selected_alternatives[0] + "_PRESENT"
        ).build()
    else:
        return promelaBuilder.VariableReferenceBuilder(expr.name).build()


class FirstVariableInfo:
    """
    Information about first variable of selector.
    """

    process_name: str
    """Name of process."""

    variable_name: str
    """Name of first variable."""

    variable_type: Any
    """Type of variable from OpenGEODE."""

    consumed_elements: int
    """Number of consumed elements of Selector."""

    def __init__(self, process_name, variable_name, variable_type, consumed_elements):
        self.process_name = process_name
        self.variable_name = variable_name
        self.variable_type = variable_type
        self.consumed_elements = consumed_elements


def _find_first_variable(
    context: GenerateContext, selector: model.Selector
) -> FirstVariableInfo:
    """
    The first element is variable name,
    The second element is variable type
    Third element, index
    """
    index = 0

    # Find top-level process
    process_name = selector.elements[index].name.lower()
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )

    process = context.processes[process_name]
    aggregates = context.aggregates[process_name]
    index = index + 1
    composites = process.composite_states

    variable_prefix = ""
    # Check composite states
    state_name = ""

    while True:
        if len(state_name) == 0:
            state_name = selector.elements[index].name.lower()
        else:
            state_name = state_name + SEPARATOR + selector.elements[index].name.lower()
        candidates = [
            composite for composite in composites if composite.statename == state_name
        ]
        if len(candidates) > 0:
            process = candidates[0]
            if state_name in aggregates:
                composites = aggregates[state_name]
            else:
                composites = process.composite_states
            index = index + 1
            variable_prefix = state_name + SEPARATOR
        else:
            break

    variable_name = variable_prefix + selector.elements[index].name.lower()
    if variable_name not in process.variables:
        raise TranslateException(
            f"Cannot find variable '{selector.elements[index].name.lower()}' {variable_name}"
        )

    return FirstVariableInfo(
        process_name, variable_name, process.variables[variable_name][0], index + 1
    )


@dispatch(GenerateContext, model.Selector)
def _generate(context: GenerateContext, expr: model.Selector):

    promelaObjects = [_generate(context, elem) for elem in expr.elements]
    context.clear()

    result: promela.Expression = None
    index = 0

    if isinstance(promelaObjects[0], promela.ArrayAccess):
        result = promelaObjects[0]
        index = 1
    else:
        variable_info = _find_first_variable(context, expr)
        # process_name, variable_name, variable_type, index
        index = variable_info.consumed_elements
        result = (
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                promelaBuilder.MemberAccessBuilder()
                .withUtypeReference(
                    promelaBuilder.VariableReferenceBuilder("global_state").build()
                )
                .withMember(
                    promelaBuilder.VariableReferenceBuilder(
                        variable_info.process_name
                    ).build()
                )
                .build()
            )
            .withMember(
                promelaBuilder.VariableReferenceBuilder(
                    variable_info.variable_name
                ).build()
            )
            .build()
        )

    for element in promelaObjects[index:]:
        result = (
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(result)
            .withMember(element)
            .build()
        )

    return result


def _resolve_remaining_element_of_selector(
    allTypes: Dict[str, Any],
    currentType: Any,
    selector: model.Selector,
    index: int,
):
    if currentType.kind != "SequenceType":
        raise TranslateException(
            "Invalid datatype, expected 'SequenceType', got {}".format(currentType.kind)
        )

    member_name = selector.elements[index].name.lower()

    if member_name not in currentType.Children:
        raise TranslateException(
            "Unable to find member '{}' in '{}".format(member_name, currentType.CName)
        )
    member = currentType.Children[member_name]
    memberType = resolve_asn1_type(allTypes, member.type)

    if index + 1 < len(selector.elements):
        return _resolve_remaining_element_of_selector(
            allTypes, memberType, selector, index + 1
        )
    else:
        return memberType


@dispatch(GenerateContext, model.Selector)
def _find_type(context: GenerateContext, selector: model.Selector):
    if isinstance(selector.elements[0], model.CallExpression):
        # Selector represents access to nested SEQUENCE OF
        # Example: controller.eight(0).nested(0).param
        #  selector.elements[0] = "controller.eight(0).nested(0)"
        #  selector. elements[1] = "param"
        # Find refered type and all available datatypes
        currentType, allTypes = _find_type(context, selector.elements[0])
        selectorType = _resolve_remaining_element_of_selector(
            allTypes, currentType, selector, 1
        )
        return selectorType, allTypes
    else:
        # Selector is in simple form, where first element refers to a process
        # and second element is variable
        # Find the process, all available datatypes in the process
        # Find type of first element in selector
        variable_info = _find_first_variable(context, selector)
        index = variable_info.consumed_elements
        # process_name, variable_name, variable_type, index
        # process_name = selector.elements[0].name
        if variable_info.process_name not in context.processes:
            raise TranslateException(
                "Cannot find process with name '{}'".format(variable_info.process_name)
            )

        process = context.processes[variable_info.process_name]
        allTypes = getattr(process.DV, "types", {})

        # variable_name = selector.elements[1].name

        # if variable_name not in process.variables:
        #     raise TranslateException(
        #         "Cannot find variable '{}' in process '{}'".format(
        #             variable_name, process_name
        #         )
        #     )
        # variable = process.variables[variable_name]

        currentType = resolve_asn1_type(allTypes, variable_info.variable_type)

        if len(selector.elements) > index:
            selectorType = _resolve_remaining_element_of_selector(
                allTypes, currentType, selector, index
            )
            return selectorType, allTypes
        else:
            return currentType, allTypes


@dispatch(GenerateContext, model.CallExpression)
def _find_type(context: GenerateContext, selector: model.CallExpression):
    sequenceOfType, allTypes = _find_type(context, selector.function)

    sequenceOfType = resolve_asn1_type(allTypes, sequenceOfType)

    if sequenceOfType.kind != "SequenceOfType":
        raise TranslateException("Invalid access to SEQUENCE OF")

    sequenceOfElementType = resolve_asn1_type(allTypes, sequenceOfType.type)

    return (sequenceOfElementType, allTypes)


def _set_choice_selection(context: GenerateContext, selector: model.Expression):
    type, _ = _find_type(context, selector)
    context.choice_selection = _escape_asn1_typename(type.CName)
    context.choice_selection_alternatives = type.Children.keys()


def _generate_array_access(context: GenerateContext, expr: model.CallExpression):
    if len(expr.parameters) != 1:
        raise TranslateException("Invalid array access")

    result = _generate(context, expr.function)
    result = (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(result)
        .withMember(promelaBuilder.VariableReferenceBuilder("data").build())
        .build()
    )

    return (
        promelaBuilder.ArrayAccessBuilder()
        .withArray(result)
        .withIndex(_generate(context, expr.parameters[0]))
        .build()
    )


def _generate_length(context: GenerateContext, expr: model.CallExpression):
    if len(expr.parameters) != 1:
        raise TranslateException("Function 'length' requires one parameter")

    result = _generate(context, expr.parameters[0])
    return (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(result)
        .withMember(promelaBuilder.VariableReferenceBuilder("length").build())
        .build()
    )


def _generate_present_call(context: GenerateContext, expr: model.CallExpression):
    if len(expr.parameters) != 1:
        raise TranslateException("Function 'present' requires one parameter")
    result = _generate(context, expr.parameters[0])

    if not isinstance(result, promela.MemberAccess) and not isinstance(
        result, promela.ArrayAccess
    ):
        raise TranslateException(
            "Invalid parameter for present function: {}".format(result)
        )

    _set_choice_selection(context, expr.parameters[0])

    return (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(result)
        .withMember(promelaBuilder.VariableReferenceBuilder("selection").build())
        .build()
    )


def _generate_exist_call(context: GenerateContext, expr: model.CallExpression):
    if len(expr.parameters) != 1:
        raise TranslateException("Function 'exist' requires one parameter")
    result = _generate(context, expr.parameters[0])

    if not isinstance(result, promela.MemberAccess):
        raise TranslateException(
            "Internal error, expected MemberAccess, got {}".format(type(result))
        )

    member = result.member

    return (
        promelaBuilder.MemberAccessBuilder()
        .withMember(member)
        .withUtypeReference(
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(result.utype)
            .withMember(promelaBuilder.VariableReferenceBuilder("exist").build())
            .build()
        )
        .build()
    )


def _construct_queue_variable_name_from_call(
    context: GenerateContext, expr: model.CallExpression, function: str
):
    if len(expr.parameters) != 1:
        raise TranslateException(
            "Function '{}' requires one parameter".format(function)
        )
    if not isinstance(expr.parameters[0], model.Selector):
        raise TranslateException("Invalid parameter for function '{}'".format(function))
    selector: model.Selector = expr.parameters[0]
    if len(selector.elements) != 2:
        raise TranslateException("Invalid parameter for function '{}'".format(function))
    if not isinstance(selector.elements[0], model.VariableReference):
        raise TranslateException("Invalid parameter for function '{}'".format(function))
    if not isinstance(selector.elements[1], model.VariableReference):
        raise TranslateException("Invalid parameter for function '{}'".format(function))
    process_name = selector.elements[0].name.lower()
    queue_name = selector.elements[1].name.lower()
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )

    process = context.processes[process_name]

    queue_exist = next(
        (x for x in process.input_signals if x["name"].lower() == queue_name.lower()),
        None,
    )
    if queue_exist is None:
        raise TranslateException(
            "Cannot find queue with name '{}' in process '{}'".format(
                queue_name, process_name
            )
        )

    return "{}_{}_channel".format(process_name.lower(), queue_name.lower())


def _generate_empty_call(context: GenerateContext, expr: model.CallExpression):
    queue_variable = _construct_queue_variable_name_from_call(context, expr, "empty")
    return (
        promelaBuilder.CallBuilder()
        .withTarget("empty")
        .withParameter(promelaBuilder.VariableReferenceBuilder(queue_variable).build())
        .build()
    )


def _generate_queue_length_call(context: GenerateContext, expr: model.CallExpression):
    queue_variable = _construct_queue_variable_name_from_call(context, expr, "length")
    return (
        promelaBuilder.CallBuilder()
        .withTarget("len")
        .withParameter(promelaBuilder.VariableReferenceBuilder(queue_variable).build())
        .build()
    )


@dispatch(GenerateContext, model.CallExpression)
def _generate(context: GenerateContext, expr: model.CallExpression):
    if isinstance(expr.function, model.Selector):
        return _generate_array_access(context, expr)
    elif isinstance(expr.function, model.VariableReference):
        if expr.function.name == "get_state":
            raise TranslateException("Not implemented.")
        elif expr.function.name == "length":
            return _generate_length(context, expr)
        elif expr.function.name == "present":
            return _generate_present_call(context, expr)
        elif expr.function.name == "exist":
            return _generate_exist_call(context, expr)
        elif expr.function.name == "empty":
            return _generate_empty_call(context, expr)
        elif expr.function.name == "queue_length":
            return _generate_queue_length_call(context, expr)

        raise TranslateException(
            "Function '{}' is not supported.".format(expr.function.name)
        )
    else:
        raise TranslateException("Not implemented.")


def _generate_true_alternative(label: str) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(promela.GoTo(label))
            .build()
        )
        .build()
    )


def _generate_filter_out_alternative(
    statements: List[model.FilterOutStatement], context: GenerateContext
) -> promela.Alternative:
    builder = promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)

    expressions = [_generate(context, s.expression) for s in statements]

    negate_expressions = [
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
        .withExpression(e)
        .build()
        for e in expressions
    ]

    def joiner(lhs: promela.Expression, rhs: promela.Expression) -> promela.Expression:
        return (
            promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
            .withLeft(lhs)
            .withRight(rhs)
            .build()
        )

    condition = functools.reduce(joiner, negate_expressions[1:], negate_expressions[0])

    builder.withCondition(condition)
    builder.withStatements(
        promelaBuilder.StatementsBuilder().withStatement(promela.Skip()).build()
    )
    return builder.build()


def _generate_always_alternative(
    always: model.AlwaysStatement, context: GenerateContext
) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(
            promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
            .withExpression(_generate(context, always.expression))
            .build()
        )
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder()
                .withExpression(_generate(context, always.expression))
                .build()
            )
            .build()
        )
        .build()
    )


def _generate_never_alternative(
    never: model.NeverStatement, context: GenerateContext
) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(_generate(context, never.expression))
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder()
                .withExpression(
                    promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                    .withExpression(_generate(context, never.expression))
                    .build()
                )
                .build()
            )
            .build()
        )
        .build()
    )


def _generate_eventually_alternative(
    eventually: model.EventuallyStatement, context: GenerateContext
) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(_generate(context, eventually.expression))
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(promela.GoTo("state_0"))
            .build()
        )
        .build()
    )


def _generate_entry_loop() -> promela.Do:
    return (
        promelaBuilder.DoBuilder()
        .withAlternative(
            promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
            .withCondition(promelaBuilder.VariableReferenceBuilder("inited").build())
            .withStatements(
                promelaBuilder.StatementsBuilder()
                .withStatement(promela.Break())
                .build()
            )
            .build()
        )
        .withAlternative(_generate_true_alternative("start"))
        .build()
    )


def _translate_basic_statements(
    input_model: model.StopConditionModel,
    builder: promelaBuilder.BlockBuilder,
    context: GenerateContext,
):
    for always in input_model.always_statements:
        builder.withAlternative(_generate_always_alternative(always, context))

    for never in input_model.never_statements:
        builder.withAlternative(_generate_never_alternative(never, context))


def _build_simple_never_claim(
    input_model: model.StopConditionModel, context: GenerateContext
) -> promela.NeverClaim:
    do_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, do_loop_builder, context)

    if input_model.filter_out_statements:
        do_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements, context)
        )
    else:
        do_loop_builder.withAlternative(_generate_true_alternative("start"))

    main_block_builder = promelaBuilder.BlockBuilder(promela.BlockType.BLOCK)

    main_block_builder.withStatement(promela.Label("start"))
    main_block_builder.withStatement(_generate_entry_loop())
    main_block_builder.withStatement(do_loop_builder.build())

    return (
        promelaBuilder.NeverBuilder().withDefinition(main_block_builder.build()).build()
    )


def _build_never_claim_for_acceptance_cycles(
    input_model: model.StopConditionModel, context: GenerateContext
) -> promela.NeverClaim:

    accept_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, accept_loop_builder, context)

    accept_loop_builder.withAlternative(
        _generate_eventually_alternative(input_model.eventually_statements[0], context)
    )

    if input_model.filter_out_statements:
        accept_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements, context)
        )
    else:
        accept_loop_builder.withAlternative(_generate_true_alternative("accept_all"))

    state_0_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, state_0_loop_builder, context)

    if input_model.filter_out_statements:
        state_0_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements, context)
        )
    else:
        state_0_loop_builder.withAlternative(_generate_true_alternative("state_0"))

    main_block_builder = promelaBuilder.BlockBuilder(promela.BlockType.BLOCK)

    main_block_builder.withStatement(promela.Label("start"))
    main_block_builder.withStatement(_generate_entry_loop())
    main_block_builder.withStatement(promela.Label("accept_all"))
    main_block_builder.withStatement(accept_loop_builder.build())
    main_block_builder.withStatement(promela.Label("state_0"))
    main_block_builder.withStatement(state_0_loop_builder.build())

    return (
        promelaBuilder.NeverBuilder().withDefinition(main_block_builder.build()).build()
    )


def translate_model(
    input_model: model.StopConditionModel, processes: Dict[str, ogAST.Process]
) -> promela.Model:
    """Translate Stop Condition model into Promela model.
    :param input_model: input Stop Condition model
    :returns: Promela Model
    """

    aggregates: Dict[str, Dict[str, List[Any]]] = {}

    for name, process in processes.items():
        Helper.flatten(process, sep=SEPARATOR)
        input_aggregates = Helper.state_aggregations(process)
        aggregates[name] = input_aggregates
        Helper.parallel_states(input_aggregates)
        Helper.map_input_state(process)

    context = GenerateContext(processes)
    context.aggregates = aggregates

    if input_model.eventually_statements:
        if len(input_model.eventually_statements) != 1:
            raise TranslateException("Only one eventually statement is allowed.")

        never_claim = _build_never_claim_for_acceptance_cycles(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
    else:
        never_claim = _build_simple_never_claim(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
