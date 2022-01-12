#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import List, Union


class Expression:
    pass


class BinaryExpression(Expression):
    def __init__(self, lhs: Expression, rhs: Expression):
        super().__init__()
        self.lhs = lhs
        self.rhs = rhs


class OrExpression(BinaryExpression):
    pass


class AndExpression(BinaryExpression):
    pass


class XorExpression(BinaryExpression):
    pass


class EqualExpression(BinaryExpression):
    pass


class NotEqualExpression(BinaryExpression):
    pass


class LessExpression(BinaryExpression):
    pass


class LessEqualExpression(BinaryExpression):
    pass


class GreaterExpression(BinaryExpression):
    pass


class GreaterEqualExpression(BinaryExpression):
    pass


class NotExpression(Expression):
    def __init__(self, expr: Expression):
        super().__init__()
        self.expr = expr


class PlusExpression(BinaryExpression):
    pass


class MinusExpression(BinaryExpression):
    pass


class MulExpression(BinaryExpression):
    pass


class DivExpression(BinaryExpression):
    pass


class ModExpression(BinaryExpression):
    pass


class NegationExpression(Expression):
    def __init__(self, expr: Expression):
        super().__init__()
        self.expr = expr


class IntegerValue(Expression):
    def __init__(self, value: int):
        super().__init__()
        self.value = value


class FloatValue(Expression):
    def __init__(self, value: float):
        super().__init__()
        self.value = value


class BooleanValue(Expression):
    def __init__(self, value: bool):
        super().__init__()
        self.value = value


class VariableReference(Expression):
    def __init__(self, name: str):
        super().__init__()
        self.name = name


class Selector(Expression):

    SelectorElement = List[Union[VariableReference, "CallExpression"]]

    def __init__(self, elements: List[SelectorElement]):
        super().__init__()
        self.elements = elements


class CallExpression(Expression):
    def __init__(self, function: Expression, parameters: List[Expression]):
        super().__init__()
        self.function = function
        self.parameters = parameters


class AlwaysStatement:
    def __init__(self, expression: Expression):
        self.expression = expression


class NeverStatement:
    def __init__(self, expression: Expression):
        self.expression = expression


class EventuallyStatement:
    def __init__(self, expression: Expression):
        self.expression = expression


class FilterOutStatement:
    def __init__(self, expression: Expression):
        self.expression = expression


class StopConditionModel:
    def __init__(self):
        self.always_statements = []
        self.never_statements = []
        self.eventually_statements = []
        self.filter_out_statements = []

    def append_always(self, statement: AlwaysStatement):
        self.always_statements.append(statement)

    def append_never(self, statement: NeverStatement):
        self.never_statements.append(statement)

    def append_eventually(self, statement: EventuallyStatement):
        self.eventually_statements.append(statement)

    def append_filter_out(self, statement: FilterOutStatement):
        self.filter_out_statements.append(statement)
