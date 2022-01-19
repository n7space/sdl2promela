#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import List, Union
from abc import ABC, abstractmethod


class Expression(ABC):
    @abstractmethod
    def visit(self, visitor: "AbstractVisitor"):
        pass


class BinaryExpression(Expression):

    lhs: Expression
    rhs: Expression

    def __init__(self, lhs: Expression, rhs: Expression):
        super().__init__()
        self.lhs = lhs
        self.rhs = rhs


class OrExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_or(self)


class AndExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_and(self)


class XorExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_xor(self)


class EqualExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit.equal(self)


class NotEqualExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit.not_equal(self)


class LessExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_less(self)


class LessEqualExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_less_equal(self)


class GreaterExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_greater(self)


class GreaterEqualExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_greater_equal(self)


class NotExpression(Expression):

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_not(self)


class PlusExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_plus(self)


class MinusExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_minus(self)


class MulExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_mul(self)


class DivExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_div(self)


class ModExpression(BinaryExpression):
    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_mod(self)


class NegationExpression(Expression):

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_negation(self)


class IntegerValue(Expression):

    value: int

    def __init__(self, value: int):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_integer(self)


class FloatValue(Expression):

    value: float

    def __init__(self, value: float):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_float(self)


class BooleanValue(Expression):

    value: bool

    def __init__(self, value: bool):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_boolean(self)


class VariableReference(Expression):

    name: str

    def __init__(self, name: str):
        self.name = name

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_variable(self)


class Selector(Expression):

    SelectorElements = List[Union[VariableReference, "CallExpression"]]

    elements: SelectorElements

    def __init__(self, elements: SelectorElements):
        self.elements = elements

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_selector(self)


class CallExpression(Expression):

    function: Expression
    parameters: List[Expression]

    def __init__(self, function: Expression, parameters: List[Expression]):
        self.function = function
        self.parameters = parameters

    def visit(self, visitor: "AbstractVisitor"):
        visitor.visit_call(self)


class AbstractVisitor(ABC):
    @abstractmethod
    def visit_or(expr: OrExpression):
        pass

    @abstractmethod
    def visit_and(expr: AndExpression):
        pass

    @abstractmethod
    def visit_xor(expr: AndExpression):
        pass

    @abstractmethod
    def visit_equal(expr: EqualExpression):
        pass

    @abstractmethod
    def visit_not_equal(expr: NotEqualExpression):
        pass

    @abstractmethod
    def visit_less(expr: LessExpression):
        pass

    @abstractmethod
    def visit_less_equal(expr: LessEqualExpression):
        pass

    @abstractmethod
    def visit_greater(expr: GreaterExpression):
        pass

    @abstractmethod
    def visit_greater_equal(expr: GreaterEqualExpression):
        pass

    @abstractmethod
    def visit_not(expr: NotExpression):
        pass

    @abstractmethod
    def visit_plus(expr: PlusExpression):
        pass

    @abstractmethod
    def visit_minus(expr: MinusExpression):
        pass

    @abstractmethod
    def visit_mul(expr: MulExpression):
        pass

    @abstractmethod
    def visit_div(expr: DivExpression):
        pass

    @abstractmethod
    def visit_mod(expr: ModExpression):
        pass

    @abstractmethod
    def visit_negation(expr: NegationExpression):
        pass

    @abstractmethod
    def visit_integer(expr: IntegerValue):
        pass

    @abstractmethod
    def visit_float(expr: FloatValue):
        pass

    @abstractmethod
    def visit_boolean(expr: BooleanValue):
        pass

    @abstractmethod
    def visit_variable(expr: VariableReference):
        pass

    @abstractmethod
    def visit_selector(expr: Selector):
        pass

    @abstractmethod
    def visit_call(expr: CallExpression):
        pass


class AlwaysStatement:

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression


class NeverStatement:

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression


class EventuallyStatement:

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression


class FilterOutStatement:

    expression: Expression

    def __init__(self, expression: Expression):
        self.expression = expression


class StopConditionModel:

    always_statements: List[AlwaysStatement]
    never_statements: List[NeverStatement]
    eventually_statements: List[EventuallyStatement]
    filter_out_statements: List[FilterOutStatement]

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
