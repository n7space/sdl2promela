#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import antlr3
import opengeode

from opengeode import sdl92Lexer as lexer
from .model import StopConditionModel
from .model import Expression
from .model import Selector
from .model import IntegerValue
from .model import FloatValue
from .model import BooleanValue
from .model import VariableReference
from .model import CallExpression
from .model import OrExpression
from .model import AndExpression
from .model import XorExpression
from .model import EqualExpression
from .model import NotEqualExpression
from .model import LessExpression
from .model import LessEqualExpression
from .model import GreaterExpression
from .model import GreaterEqualExpression
from .model import NotExpression
from .model import PlusExpression
from .model import MinusExpression
from .model import MulExpression
from .model import DivExpression
from .model import ModExpression
from .model import NegationExpression
from .model import AlwaysStatement
from .model import NeverStatement
from .model import EventuallyStatement
from .model import FilterOutStatement


class TranslationException(Exception):
    """Exception during parsing Stop Condition model"""

    pass


def _parse_primary_expression(expr: antlr3.tree.CommonTree) -> Expression:
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


def _parse_selector(selector: antlr3.tree.CommonTree) -> Selector:
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

    elements: Selector.SelectorElements = []

    if selector.children[0].type == lexer.SELECTOR:
        nested = _parse_selector(selector.children[0])
        elements = elements + nested.elements
    elif selector.children[0].type == lexer.PRIMARY:
        # TODO - refactor this using parse_primary after adding test suite
        variable_reference = VariableReference(
            selector.children[0].children[0].children[0].getText()
        )
        elements.append(variable_reference)
    elif selector.children[0].type == lexer.CALL:
        call_expression = _parse_call_expression(selector.children[0])
        elements.append(call_expression)

    elements.append(VariableReference(selector.children[1].getText()))
    return Selector(elements)


def _parse_call_expression(expr: antlr3.tree.CommonTree) -> CallExpression:
    if len(expr.children) != 2:
        raise TranslationException(
            "Unexpected number of children in parse tree: expected 2 got {}".format(
                len(expr.children)
            )
        )

    if expr.children[0].type == lexer.PRIMARY:
        function = VariableReference(expr.children[0].children[0].children[0].getText())
    elif expr.children[0].type == lexer.SELECTOR:
        function = _parse_selector(expr.children[0])
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

    parameters = [_parse_expression(e) for e in expr.children[1].children]

    return CallExpression(function, parameters)


def _parse_expression(expr: antlr3.tree.CommonTree) -> Expression:
    if expr.type == lexer.OR:
        return OrExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.AND:
        return AndExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.XOR:
        return XorExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.GT:
        return GreaterExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.GE:
        return GreaterEqualExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.LT:
        return LessExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.LE:
        return LessEqualExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.EQ:
        return EqualExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NEQ:
        return NotEqualExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NOT:
        return NotExpression(_parse_expression(expr.children[0]))
    elif expr.type == lexer.PLUS:
        return PlusExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.DASH:
        return MinusExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.ASTERISK:
        return MulExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.DIV:
        return DivExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.MOD:
        return ModExpression(
            _parse_expression(expr.children[0]), _parse_expression(expr.children[1])
        )
    elif expr.type == lexer.NEG:
        return NegationExpression(_parse_expression(expr.children[0]))
    elif expr.type == lexer.CALL:
        return _parse_call_expression(expr)
    elif expr.type == lexer.PRIMARY:
        return _parse_primary_expression(expr.children[0])
    elif expr.type == lexer.STATE:
        raise TranslationException("Not implemented")
    elif expr.type == lexer.PAREN:
        return _parse_expression(expr.children[0])
    elif expr.type == lexer.SELECTOR:
        return _parse_selector(expr)
    else:
        raise TranslationException("Unexpected tree type {}".format(expr.type))


def _parse_always_statement(statement: antlr3.tree.CommonTree) -> AlwaysStatement:
    return AlwaysStatement(_parse_expression(statement.children[0]))


def _parse_never_statement(statement: antlr3.tree.CommonTree) -> NeverStatement:
    return NeverStatement(_parse_expression(statement.children[0]))


def _parse_eventually_statement(
    statement: antlr3.tree.CommonTree,
) -> EventuallyStatement:
    return EventuallyStatement(_parse_expression(statement.children[0]))


def _parse_filter_out_statement(
    statement: antlr3.tree.CommonTree,
) -> FilterOutStatement:
    return FilterOutStatement(_parse_expression(statement.children[0]))


def parse_stop_condition(text: str) -> StopConditionModel:
    """Parse Stop Condition from text.
    :param text: text to parse.
    :returns: StopConditionModel.
    """
    model = StopConditionModel()
    result = opengeode.ogParser.parseSingleElement("n7s_scl", text)
    data, syntaxx_errors, semantic_errors, warnings, _ = result
    for statement in data:
        if statement.type == lexer.ALWAYS:
            model.append_always(_parse_always_statement(statement))
        elif statement.type == lexer.NEVER:
            model.append_never(_parse_never_statement(statement))
        elif statement.type == lexer.EVENTUALLY:
            model.append_eventually(_parse_eventually_statement(statement))
        elif statement.type == lexer.FILTER_OUT:
            model.append_filter_out(_parse_filter_out_statement(statement))
        else:
            raise TranslationException()
    return model


def parse_stop_condition_file(filepath: str) -> StopConditionModel:
    """Parse Stop Condition from file.
    :param filepath: path to the text file.
    :returns: StopConditionModel.
    """
    with open(filepath, "r") as input_file:
        text = input_file.read()
        return parse_stop_condition(text)
