#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sdl2promela.promela.model as promela
from . import model
import sdl2promela.promela.modelbuilder as promelaBuilder
from multipledispatch import dispatch
from typing import List, Dict, Tuple
import functools
from opengeode import ogAST


class TranslateException(Exception):
    """Exception raised when model cannot be translated."""

    pass


class GenerateContext:

    processes: Dict[str, ogAST.Process]
    choice_selection: str

    def __init__(self, processes: Dict[str, ogAST.Process]):
        self.processes = processes
        self.choice_selection = None

    def clear(self):
        self.choice_selection = None


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
    if context.choice_selection is not None:
        return promelaBuilder.VariableReferenceBuilder(
            context.choice_selection + "_" + expr.name + "_PRESENT"
        ).build()
    else:
        return promelaBuilder.VariableReferenceBuilder(expr.name).build()


@dispatch(GenerateContext, model.Selector)
def _generate(context: GenerateContext, expr: model.Selector):
    promelaObjects = [_generate(context, elem) for elem in expr.elements]
    context.clear()

    if isinstance(promelaObjects[0], promela.ArrayAccess):
        result = promelaObjects[0]
    else:
        result: promela.MemberAccess = (
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                promelaBuilder.VariableReferenceBuilder("global_state").build()
            )
            .withMember(promelaObjects[0])
            .build()
        )

    promelaObjects.pop(0)

    for element in promelaObjects:
        result = (
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(result)
            .withMember(element)
            .build()
        )

    return result


def _resolve_type(allTypes, t):
    while t.kind == "ReferenceType":
        if t.ReferencedTypeName not in allTypes:
            raise ("Cannot resolve type {}".format(t.ReferencedTypeNam))
        t = allTypes[t.ReferencedTypeName].type

    return t


@dispatch(GenerateContext, model.Selector)
def _find_type(context: GenerateContext, selector: model.Selector):
    index = 0
    if isinstance(selector.elements[index], model.CallExpression):
        finalType, allTypes = _find_type(context, selector.elements[index])
        index = index + 1
    else:
        process_name = selector.elements[index].name
        if process_name not in context.processes:
            raise TranslateException(
                "Cannot find process with name '{}'".format(process_name)
            )

        process = context.processes[process_name]
        allTypes = getattr(process.DV, "types", {})

        index = index + 1
        variable_name = selector.elements[index].name

        if variable_name not in process.variables:
            raise TranslateException(
                "Cannot find variable '{}' in process '{}'".format(
                    variable_name, process_name
                )
            )
        variable = process.variables[variable_name]

        finalType = _resolve_type(allTypes, variable[0])
        index = index + 1

    while index < len(selector.elements):
        member_name = selector.elements[index].name

        if finalType.kind != "SequenceType":
            raise TranslateException("Doom")

        if member_name not in finalType.Children:
            raise TranslateException(
                "Unable to find member '{}' in '{}".format(member_name, finalType.CName)
            )
        member = finalType.Children[member_name]
        finalType = _resolve_type(allTypes, member.type)
        index = index + 1

    return finalType, allTypes

    if _is_entry(selector):
        return _find_entry_type(context, selector)

    utype, allTypes = _find_type(context, selector.utype)

    if utype.kind != "SequenceType":
        raise TranslateException(
            "Invalid access to SEQUENCE member {}".format(utype.kind)
        )

    member_name = selector.member.name

    if member_name not in utype.Children:
        raise TranslateException(
            "Unable to find member '{}' in '{}".format(member_name, utype.CName)
        )

    member = utype.Children[member_name]
    finalType = _resolve_type(allTypes, member)
    return (finalType, allTypes)


@dispatch(GenerateContext, model.CallExpression)
def _find_type(context: GenerateContext, selector: model.CallExpression):
    finalType, allTypes = _find_type(context, selector.function)

    finalType = _resolve_type(allTypes, finalType)

    if finalType.kind != "SequenceOfType":
        raise TranslateException("Invalid access to SEQUENCE OF")

    finalType = _resolve_type(allTypes, finalType.type)

    return (finalType, allTypes)


def _set_choice_selection(context: GenerateContext, selector: model.Expression):
    type, _ = _find_type(context, selector)
    context.choice_selection = _escape_asn1_typename(type.CName)


@dispatch(GenerateContext, model.CallExpression)
def _generate(context: GenerateContext, expr: model.CallExpression):
    if isinstance(expr.function, model.Selector):
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

    elif isinstance(expr.function, model.VariableReference):
        if expr.function.name == "get_state":
            # special
            pass
        elif expr.function.name == "length":
            if len(expr.parameters) != 1:
                raise TranslateException("Invalid array access")

            result = _generate(context, expr.parameters[0])
            return (
                promelaBuilder.MemberAccessBuilder()
                .withUtypeReference(result)
                .withMember(promelaBuilder.VariableReferenceBuilder("length").build())
                .build()
            )
        elif expr.function.name == "present":
            if len(expr.parameters) != 1:
                raise TranslateException("Invalid array access")
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
                .withMember(
                    promelaBuilder.VariableReferenceBuilder("selection").build()
                )
                .build()
            )
        elif expr.function.name == "exist":
            if len(expr.parameters) != 1:
                raise TranslateException("Invalid array access")
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
                    .withMember(
                        promelaBuilder.VariableReferenceBuilder("exist").build()
                    )
                    .build()
                )
                .build()
            )
        elif expr.function.name == "empty":
            pass
        elif expr.function.name == "queue_length":
            pass

        raise TranslateException("Not implemented.")
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

    context = GenerateContext(processes)

    if input_model.eventually_statements:
        if len(input_model.eventually_statements) != 1:
            raise TranslateException("Only one eventually statement is allowed.")

        never_claim = _build_never_claim_for_acceptance_cycles(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
    else:
        never_claim = _build_simple_never_claim(input_model, context)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
