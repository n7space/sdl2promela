#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sdl2promela.promela.model as promela
from . import model
import sdl2promela.promela.modelbuilder as promelaBuilder
from multipledispatch import dispatch
from typing import List
import functools


class TranslateException(Exception):
    """Exception raised when model cannot be translated."""

    pass


@dispatch(model.OrExpression)
def _generate(expr: model.OrExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.OR)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.AndExpression)
def _generate(expr: model.AndExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.AND)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.XorExpression)
def _generate(expr: model.XorExpression):
    left = _generate(expr.lhs)
    right = _generate(expr.rhs)

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


@dispatch(model.EqualExpression)
def _generate(expr: model.EqualExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.EQUAL)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.NotEqualExpression)
def _generate(expr: model.NotEqualExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.NEQUAL)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.LessExpression)
def _generate(expr: model.LessExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.LESS)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.LessEqualExpression)
def _generate(expr: model.LessEqualExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.LEQUAL)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.GreaterExpression)
def _generate(expr: model.GreaterExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.GREATER)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.GreaterEqualExpression)
def _generate(expr: model.GreaterEqualExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.GEQUAL)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.NotExpression)
def _generate(expr: model.NotExpression):
    return (
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
        .withExpression(expr.expression)
        .build()
    )


@dispatch(model.PlusExpression)
def _generate(expr: model.PlusExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.ADD)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.MinusExpression)
def _generate(expr: model.MinusExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.SUBTRACT)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.MulExpression)
def _generate(expr: model.MulExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.MULTIPLY)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.DivExpression)
def _generate(expr: model.DivExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.DIVIDE)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.ModExpression)
def _generate(expr: model.ModExpression):
    return (
        promelaBuilder.BinaryExpressionBuilder(promela.BinaryOperator.MODULO)
        .withLeft(_generate(expr.lhs))
        .withRight(_generate(expr.rhs))
        .build()
    )


@dispatch(model.NegationExpression)
def _generate(expr: model.NegationExpression):
    return (
        promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NEGATIVE)
        .withExpression(expr.expression)
        .build()
    )


@dispatch(model.IntegerValue)
def _generate(expr: model.IntegerValue):
    return promela.IntegerValue(expr.value)


@dispatch(model.FloatValue)
def _generate(expr: model.FloatValue):
    return promela.FloatValue(expr.value)


@dispatch(model.BooleanValue)
def _generate(expr: model.BooleanValue):
    return promela.BooleanValue(expr.value)


@dispatch(model.VariableReference)
def _generate(expr: model.VariableReference):
    return promelaBuilder.VariableReferenceBuilder(expr.name).build()


@dispatch(model.Selector)
def _generate(expr: model.Selector):

    promelaObjects = [_generate(elem) for elem in expr.elements]

    if not isinstance(promelaObjects[0], promela.VariableReference):
        raise TranslateException(
            "Call Expression is not allowed as first element of selector."
        )

    # TODO add support for access to ASN.1 SEQUENCE OF
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


@dispatch(model.CallExpression)
def _generate(expr: model.CallExpression):
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
    statements: List[model.FilterOutStatement],
) -> promela.Alternative:
    builder = promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)

    expressions = [_generate(s.expression) for s in statements]

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


def _generate_always_alternative(always: model.AlwaysStatement) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(
            promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
            .withExpression(_generate(always.expression))
            .build()
        )
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder()
                .withExpression(_generate(always.expression))
                .build()
            )
            .build()
        )
        .build()
    )


def _generate_never_alternative(never: model.NeverStatement) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(_generate(never.expression))
        .withStatements(
            promelaBuilder.StatementsBuilder()
            .withStatement(
                promelaBuilder.AssertBuilder()
                .withExpression(
                    promelaBuilder.UnaryExpressionBuilder(promela.UnaryOperator.NOT)
                    .withExpression(_generate(never.expression))
                    .build()
                )
                .build()
            )
            .build()
        )
        .build()
    )


def _generate_eventually_alternative(
    eventually: model.EventuallyStatement,
) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder(promela.BlockType.ATOMIC)
        .withCondition(_generate(eventually.expression))
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
    input_model: model.StopConditionModel, builder: promelaBuilder.BlockBuilder
):
    for always in input_model.always_statements:
        builder.withAlternative(_generate_always_alternative(always))

    for never in input_model.never_statements:
        builder.withAlternative(_generate_never_alternative(never))


def _build_simple_never_claim(
    input_model: model.StopConditionModel,
) -> promela.NeverClaim:
    do_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, do_loop_builder)

    if input_model.filter_out_statements:
        do_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements)
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
    input_model: model.StopConditionModel,
) -> promela.NeverClaim:

    accept_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, accept_loop_builder)

    accept_loop_builder.withAlternative(
        _generate_eventually_alternative(input_model.eventually_statements[0])
    )

    if input_model.filter_out_statements:
        accept_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements)
        )
    else:
        accept_loop_builder.withAlternative(_generate_true_alternative("accept_all"))

    state_0_loop_builder = promelaBuilder.DoBuilder()

    _translate_basic_statements(input_model, state_0_loop_builder)

    if input_model.filter_out_statements:
        state_0_loop_builder.withAlternative(
            _generate_filter_out_alternative(input_model.filter_out_statements)
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


def translate_model(input_model: model.StopConditionModel) -> promela.Model:
    """Translate Stop Condition model into Promela model.
    :param input_model: input Stop Condition model
    :returns: Promela Model
    """

    if input_model.eventually_statements:
        if len(input_model.eventually_statements) != 1:
            raise TranslateException("Only one eventually statement is allowed.")

        never_claim = _build_never_claim_for_acceptance_cycles(input_model)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
    else:
        never_claim = _build_simple_never_claim(input_model)
        return promelaBuilder.ModelBuilder().withNever(never_claim).build()
