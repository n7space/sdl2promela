#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import List, Union
from abc import ABC, abstractmethod


class Expression(ABC):
    """Stop Condition base class for all expression."""

    @abstractmethod
    def visit(self, visitor: "AbstractVisitor"):
        """Abstract method for expression visitor.
        :param visitor: AbstractVisitor instance.
        """
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

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'or'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_or(self)


class AndExpression(BinaryExpression):
    """Stop Condition and expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'and'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_and(self)


class XorExpression(BinaryExpression):
    """Stop Condition xor expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'xor'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_xor(self)


class EqualExpression(BinaryExpression):
    """Stop Condition equal expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'equal'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit.equal(self)


class NotEqualExpression(BinaryExpression):
    """Stop Condition not equal expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'not equal'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit.not_equal(self)


class LessExpression(BinaryExpression):
    """Stop Condition less expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'less'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_less(self)


class LessEqualExpression(BinaryExpression):
    """Stop Condition less equal expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'less equal'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_less_equal(self)


class GreaterExpression(BinaryExpression):
    """Stop Condition greater expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'greater'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_greater(self)


class GreaterEqualExpression(BinaryExpression):
    """Stop Condition greater equal expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor
        for 'greater equal'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_greater_equal(self)


class NotExpression(Expression):
    """Stop Condition not expression."""

    expression: Expression
    """Expression after not operator."""

    def __init__(self, expression: Expression):
        self.expression = expression

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'not'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_not(self)


class PlusExpression(BinaryExpression):
    """Stop Condition greater plus expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'plus'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_plus(self)


class MinusExpression(BinaryExpression):
    """Stop Condition greater minus expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'minus'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_minus(self)


class MulExpression(BinaryExpression):
    """Stop Condition greater multiply  expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'multiply'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_mul(self)


class DivExpression(BinaryExpression):
    """Stop Condition greater divide expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'divide'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_div(self)


class ModExpression(BinaryExpression):
    """Stop Condition greater modulo expression."""

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'modulo'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_mod(self)


class NegationExpression(Expression):
    """Stop Condition unary negation expression."""

    expression: Expression
    """Expression after not operator."""

    def __init__(self, expression: Expression):
        self.expression = expression

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for 'negation'.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_negation(self)


class IntegerValue(Expression):
    """Stop Condition integer value expression."""

    value: int
    """Value of expression."""

    def __init__(self, value: int):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for integer.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_integer(self)


class FloatValue(Expression):
    """Stop Condition float value expression."""

    value: float
    """Value of expression."""

    def __init__(self, value: float):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for float.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_float(self)


class BooleanValue(Expression):
    """Stop Condition boolean value expression."""

    value: bool
    """Value of expression."""

    def __init__(self, value: bool):
        self.value = value

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for boolean.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_boolean(self)


class VariableReference(Expression):
    """Stop Condition reference to single variable."""

    name: str
    """Name of the variable."""

    def __init__(self, name: str):
        self.name = name

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for variable.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_variable(self)


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

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for selector.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_selector(self)


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

    def visit(self, visitor: "AbstractVisitor"):
        """Implementation of method for expression visitor for call.
        :param visitor: AbstractVisitor instance.
        """
        visitor.visit_call(self)


class AbstractVisitor(ABC):
    """Abstract visitor for Stop Condition expressions."""

    @abstractmethod
    def visit_or(expr: OrExpression):
        """Visit or expression.
        :param expr: OrExpression instance.
        """
        pass

    @abstractmethod
    def visit_and(expr: AndExpression):
        """Visit and expression.
        :param expr: AndExpression instance.
        """
        pass

    @abstractmethod
    def visit_xor(expr: AndExpression):
        """Visit xor expression.
        :param expr: XorExpression instance.
        """
        pass

    @abstractmethod
    def visit_equal(expr: EqualExpression):
        """Visit equal expression.
        :param expr: EqualExpression instance.
        """
        pass

    @abstractmethod
    def visit_not_equal(expr: NotEqualExpression):
        """Visit not equal expression.
        :param expr: NotEqualExpression instance.
        """
        pass

    @abstractmethod
    def visit_less(expr: LessExpression):
        """Visit less expression.
        :param expr: LessExpression instance.
        """
        pass

    @abstractmethod
    def visit_less_equal(expr: LessEqualExpression):
        """Visit less or equal expression.
        :param expr: LessEqualExpression instance.
        """
        pass

    @abstractmethod
    def visit_greater(expr: GreaterExpression):
        """Visit greater expression.
        :param expr: GreaterExpression instance.
        """
        pass

    @abstractmethod
    def visit_greater_equal(expr: GreaterEqualExpression):
        """Visit greater or equal expression.
        :param expr: GreaterEqualExpression instance.
        """
        pass

    @abstractmethod
    def visit_not(expr: NotExpression):
        """Visit not expression.
        :param expr: NotExpression instance.
        """
        pass

    @abstractmethod
    def visit_plus(expr: PlusExpression):
        """Visit plus expression.
        :param expr: PlusExpression instance.
        """
        pass

    @abstractmethod
    def visit_minus(expr: MinusExpression):
        """Visit minus expression.
        :param expr: MinusExpression instance.
        """
        pass

    @abstractmethod
    def visit_mul(expr: MulExpression):
        """Visit multiply expression.
        :param expr: MulExpression instance.
        """
        pass

    @abstractmethod
    def visit_div(expr: DivExpression):
        """Visit divide expression.
        :param expr: DivExpression instance.
        """
        pass

    @abstractmethod
    def visit_mod(expr: ModExpression):
        """Visit modulo expression.
        :param expr: ModExpression instance.
        """
        pass

    @abstractmethod
    def visit_negation(expr: NegationExpression):
        """Visit negation expression.
        :param expr: NefationExpression instance.
        """
        pass

    @abstractmethod
    def visit_integer(expr: IntegerValue):
        """Visit integer value.
        :param expr: IntegerValue instance.
        """
        pass

    @abstractmethod
    def visit_float(expr: FloatValue):
        """Visit float value.
        :param expr: FloatValue instance.
        """
        pass

    @abstractmethod
    def visit_boolean(expr: BooleanValue):
        """Visit boolean value.
        :param expr: BooleanValue instance.
        """
        pass

    @abstractmethod
    def visit_variable(expr: VariableReference):
        """Visit variable reference.
        :param expr: VariableReference instance.
        """
        pass

    @abstractmethod
    def visit_selector(expr: Selector):
        """Visit selector expression.
        :param expr: Selector instance.
        """
        pass

    @abstractmethod
    def visit_call(expr: CallExpression):
        """Visit call expression.
        :param expr: CallExpression instance.
        """
        pass


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
