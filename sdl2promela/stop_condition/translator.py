#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sdl2promela.promela.model as promela
from sdl2promela.sdl import Model
from sdl2promela.utils import resolve_asn1_type
from . import model
import sdl2promela.promela.modelbuilder as promelaBuilder
from multipledispatch import dispatch
from typing import List, Dict, Any, Optional, Union
import functools
import typing
from opengeode import ogAST

# from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR


class TranslateException(Exception):
    """Exception raised when model cannot be translated."""

    pass


class GenerateContext:
    """Context for translator."""

    processes: Dict[str, Model]
    """Dict of all processes"""

    observers_with_error: List[str]
    """List of observers which error states."""

    observers_with_success: List[str]
    """List of observer with success states."""

    observers_with_ignore: List[str]
    """List of observers with ignore states."""

    search_for_observer_success: bool
    """Generate never claim to search for success states."""

    choice_selection: Optional[str]
    """
    The name of the choice type, set when 'present' is used
    on left hand side of expression.
    It changes translation of right hand side of expression.
    """
    choice_selection_alternatives: Optional[List[str]]
    """
    List of all available choice alternatives, set when 'present is used
    on left hand side of expression.
    The alternatives are case-sensitive.
    """

    process_state_selection: Optional[str]
    """
    Optional process name, set when 'get_state' is used
    on the left hand side of expression.
    This allows to generate valid reference to process state definiton.
    """

    process_state_selection_substate: Optional[str]
    """
    Optional substate name, set when 'get_state' is used
    which references parallel state.
    This allows to generate valid reference to process state definition.
    """

    precheck_expressions: List[promela.Expression]
    """
    List of promela expressions, which should be checked before checking
    actual evaluation of stop condition expression.
    Usually this contains checks if variables are initialized.
    """

    def __init__(
        self, processes: Dict[str, ogAST.Process], search_for_observer_success: bool
    ):
        self.processes = processes
        self.choice_selection = None
        self.choice_selection_alternatives = None
        self.process_state_selection = None
        self.process_state_selection_substate = None
        self.precheck_expressions = []
        self.observers_with_error = []
        self.observers_with_success = []
        self.observers_with_ignore = []
        self.search_for_observer_success = search_for_observer_success

        for process_name, process in self.processes.items():
            if process.errorstates:
                self.observers_with_error.append(process_name.lower())
            if process.successstates:
                self.observers_with_success.append(process_name.lower())
            if process.ignorestates:
                self.observers_with_ignore.append(process_name.lower())

    def clear(self):
        """Clear context.
        Shall be called after translation of children nodes.
        """
        self.choice_selection = None
        self.choice_selection_alternatives = None
        self.process_state_selection = None
        self.process_state_selection_substate = None


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


def _get_process_state_name(
    process_name: str, state_name: str, substate: Optional[str]
) -> str:
    if substate is not None:
        return "{}_States_{}{}{}".format(
            process_name.capitalize(), substate.lower(), SEPARATOR, state_name.lower()
        )
    else:
        return "{}_States_{}".format(process_name.capitalize(), state_name.lower())


@dispatch(GenerateContext, model.VariableReference)
def _generate(context: GenerateContext, expr: model.VariableReference):
    """Translate StopCondition VariableReference
    to Promela VariableReference.
    If choice_selection is set in context, it is a special case.
    It means that variable is a selector of CHOICE.
    """
    if (
        context.choice_selection is not None
        and context.choice_selection_alternatives is not None
    ):
        # The list of available alternatives of CHOICE is case-sensitive
        # Stop Condition Language is case-insensitive,
        # so, the existing identifier should be generated.
        selected_alternatives = [
            alternative
            for alternative in context.choice_selection_alternatives
            if alternative.lower() == expr.name.lower()
        ]
        if len(selected_alternatives) == 0:
            raise TranslateException(
                f"The CHOICE datatype '{context.choice_selection}' has no alternative with name '{expr.name}'"
            )
        elif len(selected_alternatives) > 1:
            available_alternatives = ", ".join(selected_alternatives)
            raise TranslateException(
                f"Ambiguous CHOICE selector '{expr.name}', available alternatives: {available_alternatives}"
            )

        return promelaBuilder.VariableReferenceBuilder(
            context.choice_selection + "_" + selected_alternatives[0] + "_PRESENT"
        ).build()
    elif context.process_state_selection is not None:
        return promelaBuilder.VariableReferenceBuilder(
            _get_process_state_name(
                context.process_state_selection,
                expr.name,
                context.process_state_selection_substate,
            )
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

    is_global_state: bool
    """Variable references a member in global_state."""

    additional_expression: Optional[promela.Expression]
    """
    Access to variable requires additional expression,
    which checks if variable is initialized.
    """

    def __init__(
        self,
        process_name: str,
        variable_name: str,
        variable_type: Any,
        consumed_elements: int,
        is_global_state: bool,
        additional_expression: Optional[promela.Expression],
    ):
        self.process_name = process_name
        self.variable_name = variable_name
        self.variable_type = variable_type
        self.consumed_elements = consumed_elements
        self.is_global_state = is_global_state
        self.additional_expression = additional_expression


def _find_state(context: GenerateContext, selector: model.Selector, process_name: str):
    process = context.processes[process_name].source
    aggregates = context.processes[process_name].input_aggregates
    composites = process.composite_states

    state_name = ""
    result_state_name = ""

    # Check if composite (nested) or aggregate (parallel) states exist
    # And construct state_name
    for index in range(1, len(selector.elements)):

        element_name = typing.cast(
            model.VariableReference, selector.elements[index]
        ).name.lower()

        if len(state_name) == 0:
            state_name = element_name
        else:
            state_name = state_name + SEPARATOR + element_name

        # Check if current element refers to a nested/parallel state
        candidates = [
            composite for composite in composites if composite.statename == state_name
        ]

        if len(candidates) == 1:
            result_state_name = state_name
            # The current element of selector refers to a composite or aggregate state
            # Modify variable prefix and go to next element

            process = candidates[0]

            # Choose candidates for the next possible nested states
            if state_name in aggregates:
                composites = aggregates[state_name]
            else:
                composites = process.composite_states
        elif len(candidates) > 1:
            raise TranslateException(f"Ambiguous state name {element_name}")
        else:
            # The element is not a state, possibly it is a variable
            break

    return result_state_name, index, process


def _find_first_variable(
    context: GenerateContext, selector: model.Selector
) -> FirstVariableInfo:
    """
    Find first variable referenced by Selector.
    The selector begins with the following elements:
    process name and optional nested state names.
    The variables defined inside nested states are placed directly
    in the context of the process and the name of the variable
    has a prefix, which consists of a name of nested state.

    This function resolves selector and gives information about type
    and real name of first referenced variable. The remaining
    elements of selector refers to possible elements of SEQUENCE.
    """
    index = 0

    if isinstance(selector.elements[0], model.CallExpression) and isinstance(
        selector.elements[0].function, model.VariableReference
    ):
        call_expression: model.CallExpression = selector.elements[0]
        function = typing.cast(model.VariableReference, call_expression.function)
        if function.name.lower() == "queue_last":
            queue_type = _find_type_of_queue_last_call(context, call_expression)
            nested_selector = typing.cast(model.Selector, call_expression.parameters[0])
            process_name = typing.cast(
                model.VariableReference, nested_selector.elements[0]
            ).name.lower()
            if process_name not in context.processes:
                raise TranslateException(
                    "Cannot find process with name '{}'".format(process_name)
                )
            queue_name = _construct_signal_parameter_variable_name_from_call(
                context, call_expression, "queue_last"
            )
            channel_used = _construct_channel_used_variable_name_from_call(
                context, call_expression, "queue_last"
            )

            additional_expression = promelaBuilder.VariableReferenceBuilder(
                channel_used
            ).build()

            return FirstVariableInfo(
                process_name,
                queue_name,
                queue_type,
                1,
                False,
                additional_expression,
            )

    # Find top-level process
    process_name = typing.cast(
        model.VariableReference, selector.elements[index]
    ).name.lower()
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )

    state_name, index, process = _find_state(context, selector, process_name)

    if len(state_name) == 0:
        variable_prefix = ""
    else:
        variable_prefix = state_name + SEPARATOR

    element_name = typing.cast(
        model.VariableReference, selector.elements[index]
    ).name.lower()
    if process.instance_of_ref:
        process_variables = process.instance_of_ref.variables
    else:
        process_variables = process.variables
    variable_name = variable_prefix + element_name
    if variable_name not in process_variables:
        raise TranslateException(
            f"Cannot find variable '{element_name}' ({variable_name})"
        )

    return FirstVariableInfo(
        process_name,
        variable_name,
        process_variables[variable_name][0],
        index + 1,
        True,
        None,
    )


def _generate_state_reference(context: GenerateContext, expr: model.Selector):
    if not isinstance(expr.elements[0], model.VariableReference):
        raise TranslateException("Invalid nested state name.")

    if context.process_state_selection is None:
        raise TranslateException("Invalid state comparison.")

    elements = [
        typing.cast(model.VariableReference, element).name for element in expr.elements
    ]
    state_name = SEPARATOR.join(elements)

    return promelaBuilder.VariableReferenceBuilder(
        _get_process_state_name(
            context.process_state_selection,
            state_name,
            context.process_state_selection_substate,
        )
    ).build()


@dispatch(GenerateContext, model.Selector)
def _generate(context: GenerateContext, expr: model.Selector):

    if context.process_state_selection is not None:
        return _generate_state_reference(context, expr)

    promelaObjects = [_generate(context, elem) for elem in expr.elements]
    context.clear()

    result: Optional[
        Union[promela.MemberAccess, promela.ArrayAccess, promela.VariableReference]
    ] = None
    index = 0

    if isinstance(promelaObjects[0], promela.ArrayAccess):
        result = promelaObjects[0]
        index = 1
    else:
        variable_info = _find_first_variable(context, expr)
        if variable_info.additional_expression is not None:
            context.precheck_expressions.append(variable_info.additional_expression)
        index = variable_info.consumed_elements
        if variable_info.is_global_state:
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
        else:
            result = promelaBuilder.VariableReferenceBuilder(
                variable_info.variable_name
            ).build()

    for element in promelaObjects[index:]:
        result = (
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                typing.cast(
                    Union[
                        promela.MemberAccess,
                        promela.ArrayAccess,
                        promela.VariableReference,
                    ],
                    result,
                )
            )
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

    member_name = typing.cast(
        model.VariableReference, selector.elements[index]
    ).name.lower()

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


def _find_type_of_queue_last_call(context: GenerateContext, call: model.CallExpression):
    if len(call.parameters) != 1:
        raise TranslateException("Invalid parameters for 'queue_last'")
    if not isinstance(call.parameters[0], model.Selector):
        raise TranslateException(
            "Invalid parameter for 'queue_last', required <process>.<signal>"
        )
    selector = call.parameters[0]
    if not isinstance(selector.elements[0], model.VariableReference):
        raise TranslateException(
            "Invalid parameter for 'queue_last', required <process>.<signal>"
        )
    if not isinstance(selector.elements[1], model.VariableReference):
        raise TranslateException(
            "Invalid parameter for 'queue_last', required <process>.<signal>"
        )

    process_name = selector.elements[0].name.lower()
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )
    process = context.processes[process_name]
    signal_name = selector.elements[1].name.lower()
    found_signal_types = [
        signal["type"]
        for signal in process.source.input_signals
        if signal["name"] == signal_name
    ]

    if len(found_signal_types) == 0:
        raise TranslateException(
            f"Cannot find singal '{signal_name}' in process '{process_name}'"
        )
    elif len(found_signal_types) > 1:
        raise TranslateException(
            f"Ambiguous signal name '{signal_name}' in process '{process_name}'"
        )

    allTypes = getattr(process.source.DV, "types", {})

    finalType = resolve_asn1_type(allTypes, found_signal_types[0])

    return finalType, allTypes


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
        # Selector is in simple form, where first element refers to a process,
        # optional nested or parallel states,
        # and the next element is variable name
        variable_info = _find_first_variable(context, selector)
        index = variable_info.consumed_elements
        if variable_info.process_name not in context.processes:
            raise TranslateException(
                "Cannot find process with name '{}'".format(variable_info.process_name)
            )

        # Find the process, all available datatypes in the process
        process = context.processes[variable_info.process_name]
        allTypes = getattr(process.source.DV, "types", {})

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
    if isinstance(selector.function, model.VariableReference):
        if selector.function.name.lower() == "queue_last":
            return _find_type_of_queue_last_call(context, selector)
        else:
            raise TranslateException("Invalid function call")

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

    result = (
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

    return result


def _construct_interface_name_from_call(
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
        (
            x
            for x in process.source.input_signals
            if x["name"].lower() == queue_name.lower()
        ),
        None,
    )
    if queue_exist is None:
        raise TranslateException(
            "Cannot find queue with name '{}' in process '{}'".format(
                queue_name, process_name
            )
        )

    return "{}_{}".format(process_name.capitalize(), queue_name.lower())


def _construct_queue_variable_name_from_call(
    context: GenerateContext, expr: model.CallExpression, function: str
):
    return "{}_channel".format(
        _construct_interface_name_from_call(context, expr, function)
    )


def _construct_signal_parameter_variable_name_from_call(
    context: GenerateContext, expr: model.CallExpression, function: str
):
    return "{}_signal_parameter".format(
        _construct_interface_name_from_call(context, expr, function)
    )


def _construct_channel_used_variable_name_from_call(
    context: GenerateContext, expr: model.CallExpression, function: str
):
    return "{}_channel_used".format(
        _construct_interface_name_from_call(context, expr, function)
    )


def _generate_empty_call(context: GenerateContext, expr: model.CallExpression):
    queue_variable = _construct_queue_variable_name_from_call(context, expr, "empty")
    # direct usage of promela 'empty' is a cause
    # of issues, when it is used together with unary negation
    # 'empty(chan)' is translated to 'len(chan) == 0'
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.EQUAL)
        .withLeft(
            promelaBuilder.CallBuilder()
            .withTarget("len")
            .withParameter(
                promelaBuilder.VariableReferenceBuilder(queue_variable).build()
            )
            .build()
        )
        .withRight(promela.IntegerValue(0))
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


def _get_state_variable_name(process_name: str):
    return (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                promelaBuilder.VariableReferenceBuilder("global_state").build()
            )
            .withMember(promelaBuilder.VariableReferenceBuilder(process_name).build())
            .build()
        )
        .withMember(promelaBuilder.VariableReferenceBuilder("state").build())
        .build()
    )


def _generate_get_state_for_toplevel(
    context: GenerateContext, process_reference: model.VariableReference
):
    process_name = process_reference.name.lower()
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )
    process = context.processes[process_name]
    context.process_state_selection = process.process_implementation_name
    return _get_state_variable_name(process_name)


def _generate_get_state_for_parallel(
    context: GenerateContext, state_reference: model.Selector
):
    if not isinstance(state_reference.elements[0], model.VariableReference):
        raise TranslateException("Invalid parameter for function 'get_state'")

    process_name = typing.cast(
        model.VariableReference, state_reference.elements[0]
    ).name
    if process_name not in context.processes:
        raise TranslateException(
            "Cannot find process with name '{}'".format(process_name)
        )

    process = context.processes[process_name]

    # Construct name of the state variable
    state_name, index, _ = _find_state(context, state_reference, process_name)
    if index != len(state_reference.elements) - 1:
        raise TranslateException(
            f"Cannot construct state name, len {len(state_reference.elements)}, {index}, {state_name}"
        )

    context.process_state_selection = process.process_implementation_name
    context.process_state_selection_substate = state_name

    state_name = state_name + SEPARATOR + "state"

    return (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                promelaBuilder.VariableReferenceBuilder("global_state").build()
            )
            .withMember(promelaBuilder.VariableReferenceBuilder(process_name).build())
            .build()
        )
        .withMember(promelaBuilder.VariableReferenceBuilder(state_name).build())
        .build()
    )


def _generate_get_state_call(context: GenerateContext, expr: model.CallExpression):
    if len(expr.parameters) != 1:
        raise TranslateException("Function 'get_state' requires one parameter")

    parameter = expr.parameters[0]

    if isinstance(parameter, model.VariableReference):
        return _generate_get_state_for_toplevel(context, parameter)
    elif isinstance(parameter, model.Selector):
        return _generate_get_state_for_parallel(context, parameter)
    else:
        raise TranslateException("Invalid parameter for function 'get_state'")


def _generate_queue_last_call(context: GenerateContext, expr: model.CallExpression):
    signal_param_variable_name = _construct_signal_parameter_variable_name_from_call(
        context, expr, "queue_last"
    )
    channel_used_variable_name = _construct_channel_used_variable_name_from_call(
        context, expr, "queue_last"
    )

    context.precheck_expressions.append(
        promelaBuilder.VariableReferenceBuilder(channel_used_variable_name).build()
    )

    return promelaBuilder.VariableReferenceBuilder(signal_param_variable_name).build()


@dispatch(GenerateContext, model.CallExpression)
def _generate(context: GenerateContext, expr: model.CallExpression):
    if isinstance(expr.function, model.Selector):
        return _generate_array_access(context, expr)
    elif isinstance(expr.function, model.CallExpression):
        return _generate_array_access(context, expr)
    elif isinstance(expr.function, model.VariableReference):
        if expr.function.name == "get_state":
            return _generate_get_state_call(context, expr)
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
        elif expr.function.name == "queue_last":
            return _generate_queue_last_call(context, expr)

        raise TranslateException(
            "Function '{}' is not supported.".format(expr.function.name)
        )
    else:
        raise TranslateException("Not implemented.")


def _generate_true_alternative(label: str) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.BLOCK)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(promela.GoTo(label))
            .build()
        )
        .build()
    )


def _add_precheck_expressions(
    context: GenerateContext, expression: promela.Expression
) -> promela.Expression:
    """
    Adds optional precheck expressions to expressions connecting them using
    logical AND operator.
    """
    while context.precheck_expressions:
        expression = (
            promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
            .withLeft(context.precheck_expressions[0])
            .withRight(expression)
            .build()
        )
        context.precheck_expressions.pop(0)
    return expression


def _join_expressions(
    expressions: List[promela.Expression], op: promela.BinaryOperator
) -> promela.Expression:
    def joiner(lhs: promela.Expression, rhs: promela.Expression) -> promela.Expression:
        return (
            promelaBuilder.BinaryExpressionBuilder(op)
            .withLeft(lhs)
            .withRight(rhs)
            .build()
        )

    return functools.reduce(
        joiner,
        expressions[1:],
        expressions[0],
    )


def _create_observer_state_check(
    states: List[str], observer: str
) -> promela.Expression:
    state_variable = _get_state_variable_name(observer)
    expressions: List[promela.Expression] = []
    for state in states:
        statename = observer.capitalize() + "_States_" + state
        expressions.append(
            promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.EQUAL)
            .withLeft(state_variable)
            .withRight(promelaBuilder.VariableReferenceBuilder(statename).build())
            .build()
        )

    condition = _join_expressions(expressions, promela.BinaryOperator.OR)

    return condition


def _generate_filter_out_alternative(
    statements: List[model.FilterOutStatement], context: GenerateContext
) -> promela.Alternative:
    builder = promelaBuilder.AlternativeBuilder(promela.BlockType.BLOCK)

    expressions = []
    # For all 'filter_out' clauses generate list of expressions together with
    # precheck expressions
    for index in range(len(statements)):
        context.precheck_expressions = []
        expression = _generate(context, statements[index].expression)
        expression = _add_precheck_expressions(context, expression)
        expressions.append(expression)
    # For all observers with ignore state generate list of expressions
    for observer in context.observers_with_ignore:
        ignorestates = context.processes[observer].ignorestates
        expression = _create_observer_state_check(ignorestates, observer)
        expressions.append(expression)

    if context.observers_with_success:
        # If the observers contains SUCCESS states,
        # then if all observers reached their SUCCESS states
        # the model checker shall stop further state exploration.
        # Generate one expression AND for all observers with success state
        # Join generated expression using AND
        # Append result to list of expression
        all_observer_expressions: List[promela.Expression] = []
        for observer in context.observers_with_success:
            successstates = context.processes[observer].successstates
            condition = _create_observer_state_check(successstates, observer)
            all_observer_expressions.append(
                promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                .withExpression(condition)
                .build()
            )

        expressions.append(
            _join_expressions(all_observer_expressions, promela.BinaryOperator.AND)
        )

    negate_expressions: List[promela.Expression] = [
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
        .withExpression(e)
        .build()
        for e in expressions
    ]

    condition = _join_expressions(negate_expressions, promela.BinaryOperator.AND)

    builder.withCondition(condition)
    builder.withStatements(
        promelaBuilder.StatementsBuilder().withStatement(promela.Skip()).build()
    )
    return builder.build()


def _generate_always_alternative(
    always: model.AlwaysStatement, context: GenerateContext
) -> promela.Alternative:
    context.precheck_expressions = []
    assert_expression = _generate(context, always.expression)
    context.precheck_expressions = []
    entry_expression = _generate(context, model.NotExpression(always.expression))

    entry_expression = _add_precheck_expressions(context, entry_expression)
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(entry_expression)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder().withExpression(assert_expression).build()
            )
            .build()
        )
        .build()
    )


def _generate_never_alternative(
    never: model.NeverStatement, context: GenerateContext
) -> promela.Alternative:
    context.precheck_expressions = []
    entry_expression = _generate(context, never.expression)
    context.precheck_expressions = []
    assert_expression = _generate(context, model.NotExpression(never.expression))
    entry_expression = _add_precheck_expressions(context, entry_expression)

    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(entry_expression)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder().withExpression(assert_expression).build()
            )
            .build()
        )
        .build()
    )


def _generate_eventually_alternative(
    eventually: model.EventuallyStatement, context: GenerateContext
) -> promela.Alternative:
    context.precheck_expressions = []
    entry_expression = _generate(context, eventually.expression)
    entry_expression = _add_precheck_expressions(context, entry_expression)
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.BLOCK)
        .withCondition(entry_expression)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(promela.GoTo("state_0"))
            .build()
        )
        .build()
    )


def _create_alternative_for_success_observers(
    context: GenerateContext,
) -> promela.Alternative:
    all_observer_expressions: List[promela.Expression] = []
    for observer in context.observers_with_success:
        successstates = context.processes[observer].successstates
        condition = _create_observer_state_check(successstates, observer)
        all_observer_expressions.append(condition)

    expression = _join_expressions(all_observer_expressions, promela.BinaryOperator.AND)

    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.BLOCK)
        .withCondition(expression)
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
            promelaBuilder.AlternativeBuilder(promela.BlockType.BLOCK)
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


def _create_never_alternative_for_observer(
    states: List[str], observer: str
) -> promela.Alternative:
    condition = _create_observer_state_check(states, observer)

    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(condition)
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder()
                .withExpression(
                    promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                    .withExpression(condition)
                    .build()
                )
                .build()
            )
            .build()
        )
        .build()
    )


def _translate_basic_statements(
    input_model: model.StopConditionModel,
    builder: promelaBuilder.DoBuilder,
    context: GenerateContext,
):
    for always in input_model.always_statements:
        builder.withAlternative(_generate_always_alternative(always, context))

    for never in input_model.never_statements:
        builder.withAlternative(_generate_never_alternative(never, context))

    if context.observers_with_error:
        for observer in context.observers_with_error:
            states = context.processes[observer].errorstates
            builder.withAlternative(
                _create_never_alternative_for_observer(states, observer)
            )

    if context.search_for_observer_success and context.observers_with_success:
        # search for observer success is enabled
        # convert success states to never states.
        for observer in context.observers_with_success:
            states = context.processes[observer].ignorestates
            builder.withAlternative(
                _create_never_alternative_for_observer(states, observer)
            )


def _build_simple_never_claim(
    input_model: model.StopConditionModel, context: GenerateContext
) -> promela.NeverClaim:
    do_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, do_loop_builder, context)

    if (
        input_model.filter_out_statements
        or context.observers_with_ignore
        or context.observers_with_success
    ):
        do_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements, context)
        )
    else:
        do_loop_builder.withAlternative(_generate_true_alternative("system_inited"))

    main_block_builder = promelaBuilder.BlockBuilder(promela.BlockType.BLOCK)

    main_block_builder.withStatement(promela.Label("start"))
    main_block_builder.withStatement(_generate_entry_loop())
    main_block_builder.withStatement(promela.Label("system_inited"))
    main_block_builder.withStatement(do_loop_builder.build())

    return (
        promelaBuilder.NeverBuilder().withDefinition(main_block_builder.build()).build()
    )


def _build_never_claim_for_acceptance_cycles(
    input_model: model.StopConditionModel, context: GenerateContext
) -> promela.NeverClaim:

    accept_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, accept_loop_builder, context)

    if input_model.eventually_statements:
        accept_loop_builder.withAlternative(
            _generate_eventually_alternative(
                input_model.eventually_statements[0], context
            )
        )
    else:
        accept_loop_builder.withAlternative(
            _create_alternative_for_success_observers(context)
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
    input_model: model.StopConditionModel,
    processes: Dict[str, ogAST.Process],
    search_for_observer_success: bool,
) -> promela.Model:
    """Translate Stop Condition model into Promela model.
    :param input_model: input Stop Condition model
    :param processes:
    :param search_for_observer_success:
    :returns: Promela Model
    """
    context = GenerateContext(processes, search_for_observer_success)

    if input_model.eventually_statements or context.observers_with_success:
        if len(input_model.eventually_statements) > 1:
            raise TranslateException("Only one eventually statement is allowed.")
        if input_model.eventually_statements and context.observers_with_success:
            raise TranslateException(
                "Not supported 'eventually' in stop conditions and observer with success state"
            )

        never_claim = _build_never_claim_for_acceptance_cycles(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
    else:
        never_claim = _build_simple_never_claim(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
