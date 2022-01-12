#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import antlr3
import opengeode

from opengeode import sdl92Lexer as lexer
from StopConditionModel import StopConditionModel
from StopConditionModel import Expression
from StopConditionModel import Selector
from StopConditionModel import IntegerValue
from StopConditionModel import FloatValue
from StopConditionModel import BooleanValue
from StopConditionModel import VariableReference
from StopConditionModel import CallExpression
from StopConditionModel import OrExpression
from StopConditionModel import AndExpression
from StopConditionModel import XorExpression
from StopConditionModel import EqualExpression
from StopConditionModel import NotEqualExpression
from StopConditionModel import LessExpression
from StopConditionModel import LessEqualExpression
from StopConditionModel import GreaterExpression
from StopConditionModel import GreaterEqualExpression
from StopConditionModel import NotExpression
from StopConditionModel import PlusExpression
from StopConditionModel import MinusExpression
from StopConditionModel import MulExpression
from StopConditionModel import DivExpression
from StopConditionModel import ModExpression
from StopConditionModel import NegationExpression
from StopConditionModel import AlwaysStatement
from StopConditionModel import NeverStatement
from StopConditionModel import EventuallyStatement
from StopConditionModel import FilterOutStatement


class TranslationException(Exception):
    pass


def parse_primary_expression(expr: antlr3.tree.CommonTree) -> Expression:
    if expr.type == lexer.INT:
        return IntegerValue(int(expr.getText()))
    if expr.type == lexer.FLOAT:
        return FloatValue(float(expr.getText()))
    if expr.type == lexer.VARIABLE:
        return VariableReference(expr.children[0].getText())
    if expr.type == lexer.TRUE:
        return BooleanValue(True)
    if expr.type == lexer.FALSE:
        return BooleanValue(False)
    else:
        raise TranslationException("Unexpected tree type: {}".format(expr.type))
    return Expression()


def parse_selector(selector: antlr3.tree.CommonTree) -> Selector:
    if len(selector.children) != 2:
        raise TranslationException(
            "Unexpected number of children in parse tree: expected 2 got {}".format(
                len(selector.children)
            )
        )
    if not selector.children[0].type in [lexer.SELECTOR, lexer.PRIMARY, lexer.CALL]:
        raise TranslationException(
            "Unexpected tree type {}".format(selector.children[0].type)
        )
    if selector.children[1].type != lexer.ID:
        raise TranslationException(
            "Unexpected tree type {}".format(selector.children[1].type)
        )

    elements = []

    if selector.children[0].type == lexer.SELECTOR:
        nested = parse_selector(selector.children[0])
        elements = elements + nested.elements
    elif selector.children[0].type == lexer.PRIMARY:
        variable_reference = VariableReference(
            selector.children[0].children[0].children[0].getText()
        )
        elements.append(variable_reference)
    elif selector.children[0].type == lexer.CALL:
        call_expression = parse_call_expression(selector.children[0])
        elements.append(call_expression)

    elements.append(selector.children[1].getText())
    return Selector(elements)


def parse_call_expression(expr: antlr3.tree.CommonTree) -> CallExpression:
    if len(expr.children) != 2:
        raise TranslationException(
            "Unexpected number of children in parse tree: expected 2 got {}".format(
                len(expr.children)
            )
        )

    if expr.children[0].type == lexer.PRIMARY:
        function = VariableReference(expr.children[0].children[0].children[0].getText())
    elif expr.children[0].type == lexer.SELECTOR:
        function = parse_selector(expr.children[0])
    else:
        raise TranslationException(
            "Unexpected tree type {}".format(expr.children[0].type)
        )

    if not expr.children[0].children[0].type in [
        lexer.VARIABLE,
        lexer.SELECTOR,
        lexer.PRIMARY,
    ]:
        raise TranslationException(
            "Unexpected tree type {}".format(expr.children[0].children[0].type)
        )
    if expr.children[1].type != lexer.PARAMS:
        raise TranslationException(
            "Unexpected tree type {}".format(expr.children[1].type)
        )

    parameters = [parse_expression(e) for e in expr.children[1].children]

    return CallExpression(function, parameters)


def parse_expression(expr: antlr3.tree.CommonTree) -> Expression:
    if expr.type == lexer.OR:
        return OrExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.AND:
        return AndExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.XOR:
        return XorExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.GT:
        return GreaterExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.GE:
        return GreaterEqualExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.LT:
        return LessExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.LE:
        return LessEqualExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.EQ:
        return EqualExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NEQ:
        return NotEqualExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NOT:
        return NotExpression(parse_expression(expr.children[0]))
    elif expr.type == lexer.PLUS:
        return PlusExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.DASH:
        return MinusExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.ASTERISK:
        return MulExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.DIV:
        return DivExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.MOD:
        return ModExpression(
            parse_expression(expr.children[0]), parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NEG:
        return NegationExpression(parse_expression(expr.children[0]))
    elif expr.type == lexer.CALL:
        return parse_call_expression(expr)
    elif expr.type == lexer.PRIMARY:
        return parse_primary_expression(expr.children[0])
    elif expr.type == lexer.STATE:
        raise TranslationException("Not implemented")
    elif expr.type == lexer.PAREN:
        return parse_expression(expr.children[0])
    elif expr.type == lexer.SELECTOR:
        return parse_selector(expr)
    else:
        raise TranslationException("Unexpected tree type {}".format(expr.type))


def parse_always_statement(statement: antlr3.tree.CommonTree) -> AlwaysStatement:
    return AlwaysStatement(parse_expression(statement.children[0]))


def parse_never_statement(statement: antlr3.tree.CommonTree) -> NeverStatement:
    return NeverStatement(parse_expression(statement.children[0]))


def parse_eventually_statement(
    statement: antlr3.tree.CommonTree,
) -> EventuallyStatement:
    return EventuallyStatement(parse_expression(statement.children[0]))


def parse_filter_out_statement(statement: antlr3.tree.CommonTree) -> FilterOutStatement:
    return FilterOutStatement(parse_expression(statement.children[0]))


def parse_stop_condition_file(input: str) -> StopConditionModel:
    model = StopConditionModel()
    with open(input, "r") as pt:
        result = opengeode.ogParser.parseSingleElement("n7s_scl", pt.read())
        data, syntaxx_errors, semantic_errors, warnings, _ = result
        for statement in data:
            if statement.type == lexer.ALWAYS:
                model.append_always(parse_always_statement(statement))
            elif statement.type == lexer.NEVER:
                model.append_never(parse_never_statement(statement))
            elif statement.type == lexer.EVENTUALLY:
                model.append_eventually(parse_eventually_statement(statement))
            elif statement.type == lexer.FILTER_OUT:
                model.append_filter_out(parse_filter_out_statement(statement))
            else:
                raise TranslationException()

    return model
