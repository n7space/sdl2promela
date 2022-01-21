#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sdl2promela.promela.model as promela
from . import model
import sdl2promela.promela.modelbuilder as promelaBuilder
from multipledispatch import dispatch


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

    result: promela.MemberAccess = (
        promelaBuilder.MemberAccessBuilder()
        .withUtypeReference(
            promelaBuilder.MemberAccessBuilder()
            .withUtypeReference(
                promelaBuilder.VariableReferenceBuilder("global_state").build()
            )
            .withMember(promelaObjects[0])
            .build()
        )
        .withMember(promelaObjects[1])
        .build()
    )
    promelaObjects.pop(0)
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


def _generate_true_alternative() -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder()
        .withCondition(promela.BooleanValue(True))
        .withStatements(
            promelaBuilder.StatementsBuilder().withStatement(promela.Skip()).build()
        )
        .build()
    )


def _generate_always_alternative(always: model.AlwaysStatement) -> promela.Alternative:
    return (
        promelaBuilder.AlternativeBuilder()
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
        promelaBuilder.AlternativeBuilder()
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


def _generate_entry_loop() -> promela.Do:
    return (
        promelaBuilder.DoBuilder()
        .withAlternative(
            promelaBuilder.AlternativeBuilder()
            .withCondition(promelaBuilder.VariableReferenceBuilder("inited").build())
            .withStatements(
                promelaBuilder.StatementsBuilder()
                .withStatement(promela.Break())
                .build()
            )
            .build()
        )
        .withAlternative(_generate_true_alternative())
        .build()
    )


def translate_model(input_model: model.StopConditionModel) -> promela.Model:
    """Translate Stop Condition model into Promela model.
    :param input_model: input Stop Condition model
    :returns: Promela Model
    """

    main_block_builder = promelaBuilder.BlockBuilder()

    do_loop_builder = promelaBuilder.DoBuilder()

    for always in input_model.always_statements:
        do_loop_builder.withAlternative(_generate_always_alternative(always))

    for never in input_model.never_statements:
        do_loop_builder.withAlternative(_generate_never_alternative(never))

    for eventually in input_model.eventually_statements:
        raise TranslateException("Not implemented.")

    for filter_out in input_model.filter_out_statements:
        raise TranslateException("Not implemented.")

    do_loop_builder.withAlternative(_generate_true_alternative())

    main_block_builder.withStatements(_generate_entry_loop())
    main_block_builder.withStatements(do_loop_builder.build())

    never_claim = (
        promelaBuilder.NeverBuilder().withDefinition(main_block_builder.build()).build()
    )

    return promelaBuilder.ModelBuilder().withNever(never_claim).build()
