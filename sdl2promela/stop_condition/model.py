#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import List, Union


class Expression:
    """Stop Condition base class for all expression."""

    pass


class BinaryExpression(Expression):
    """Stop Condition base class for binary expressions."""

    lhs: Expression
    """Left hand side of binary expression."""
    rhs: Expression
    """Right hand side of binary expression."""

    def __init__(self, lhs: Expression, rhs: Expression):
        super().__init__()
        self.lhs = lhs
        self.rhs = rhs


class OrExpression(BinaryExpression):
    """Stop Condition or expression."""

    pass


class AndExpression(BinaryExpression):
    """Stop Condition and expression."""

    pass


class XorExpression(BinaryExpression):
    """Stop Condition xor expression."""

    pass


class EqualExpression(BinaryExpression):
    """Stop Condition equal expression."""

    pass


class NotEqualExpression(BinaryExpression):
    """Stop Condition not equal expression."""

    pass


class LessExpression(BinaryExpression):
    """Stop Condition less expression."""

    pass


class LessEqualExpression(BinaryExpression):
    """Stop Condition less equal expression."""

    pass


class GreaterExpression(BinaryExpression):
    """Stop Condition greater expression."""

    pass


class GreaterEqualExpression(BinaryExpression):
    """Stop Condition greater equal expression."""

    pass


class NotExpression(Expression):
    """Stop Condition not expression."""

    expression: Expression
    """Expression after not operator."""

    def __init__(self, expression: Expression):
        self.expression = expression


class PlusExpression(BinaryExpression):
    """Stop Condition greater plus expression."""

    pass


class MinusExpression(BinaryExpression):
    """Stop Condition greater minus expression."""

    pass


class MulExpression(BinaryExpression):
    """Stop Condition greater multiply  expression."""

    pass


class DivExpression(BinaryExpression):
    """Stop Condition greater divide expression."""

    pass


class ModExpression(BinaryExpression):
    """Stop Condition greater modulo expression."""

    pass


class NegationExpression(Expression):
    """Stop Condition unary negation expression."""

    expression: Expression
    """Expression after not operator."""

    def __init__(self, expression: Expression):
        self.expression = expression


class IntegerValue(Expression):
    """Stop Condition integer value expression."""

    value: int
    """Value of expression."""

    def __init__(self, value: int):
        self.value = value


class FloatValue(Expression):
    """Stop Condition float value expression."""

    value: float
    """Value of expression."""

    def __init__(self, value: float):
        self.value = value


class BooleanValue(Expression):
    """Stop Condition boolean value expression."""

    value: bool
    """Value of expression."""

    def __init__(self, value: bool):
        self.value = value


class VariableReference(Expression):
    """Stop Condition reference to single variable."""

    name: str
    """Name of the variable."""

    def __init__(self, name: str):
        self.name = name


class Selector(Expression):
    """Stop Condition selector expression.

    Selector expression consists of list of elements separated by '.'.
    Every element is a simple variable reference
    or CallExpression, which represents access to the element of array.
    """

    SelectorElements = List[Union[VariableReference, "CallExpression"]]
    """Type for list of elements."""

    elements: SelectorElements
    """List of all elements of selector."""

    def __init__(self, elements: SelectorElements):
        self.elements = elements


class CallExpression(Expression):
    """Stop Condition call expression.

    Call Expression represents a call to predefined function or,
    an access to element of array."""

    function: Union[VariableReference, Selector]
    """Funcion or the selector to the array."""
    parameters: List[Expression]
    """List of parameters, or array index."""

    def __init__(self, function: Expression, parameters: List[Expression]):
        self.function = function
        self.parameters = parameters


class AlwaysStatement:
    """Stop Condition always statement."""

    expression: Expression
    """Expression of always statement."""

    def __init__(self, expression: Expression):
        self.expression = expression


class NeverStatement:
    """Stop Condition never statement."""

    expression: Expression
    """Expression of never statement."""

    def __init__(self, expression: Expression):
        self.expression = expression


class EventuallyStatement:
    """Stop Condition eventually statement."""

    expression: Expression
    """Expression of eventually statement."""

    def __init__(self, expression: Expression):
        self.expression = expression


class FilterOutStatement:
    """Stop Condition filter_out statement."""

    expression: Expression
    """Expression of filter_out statement."""

    def __init__(self, expression: Expression):
        self.expression = expression


class StopConditionModel:
    """Stop Condition model.

    The moodel consists of a set of independent statements."""

    always_statements: List[AlwaysStatement]
    """List of always statements."""
    never_statements: List[NeverStatement]
    """List of never statements."""
    eventually_statements: List[EventuallyStatement]
    """List of eventually statements."""
    filter_out_statements: List[FilterOutStatement]
    """List of filter_out statements."""

    def __init__(self):
        self.always_statements = []
        self.never_statements = []
        self.eventually_statements = []
        self.filter_out_statements = []

    def append_always(self, statement: AlwaysStatement):
        """Append always statement to the model.
        :param statement: AlwaysStatement instance.
        """
        self.always_statements.append(statement)

    def append_never(self, statement: NeverStatement):
        """Append never statement to the model.
        :param statement: NeverStatement instance.
        """
        self.never_statements.append(statement)

    def append_eventually(self, statement: EventuallyStatement):
        """Append eventually statement to the model.
        :param statement: EventuallyStatement instance.
        """
        self.eventually_statements.append(statement)

    def append_filter_out(self, statement: FilterOutStatement):
        """Append filter_out statement to the model.
        :param statement: FilterOutStatement instance.
        """
        self.filter_out_statements.append(statement)

    def join(self, other: "StopConditionModel"):
        """Adds all definition from other model.
        :param other: Other StopConditionModel.
        """
        self.always_statements += other.always_statements
        self.never_statements += other.never_statements
        self.eventually_statements += other.eventually_statements
        self.filter_out_statements += other.filter_out_statements
