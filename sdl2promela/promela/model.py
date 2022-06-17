from typing import List, Union
from enum import Enum


class Statement:
    """Promela statement."""

    pass


class Expression(Statement):
    """Promela expression"""

    pass


class BinaryOperator(Enum):
    """Binary operator."""

    ADD = 1
    """Addition operator."""
    SUBTRACT = 2
    """Subtraction operator."""
    MULTIPLY = 3
    """Multiplication operator."""
    DIVIDE = 4
    """Division operator."""
    EQUAL = 5
    """Equality test operator."""
    LESS = 6
    """Less than test operator."""
    GREATER = 7
    """Greater than test operator."""
    LEQUAL = 8
    """Less or equal test operator."""
    GEQUAL = 9
    """Greater or equal test operator."""
    MODULO = 10
    """Modulo operator."""
    NEQUAL = 11
    """Not equal test operator."""
    AND = 12
    """Boolean and operator."""
    OR = 13
    """Boolean or operator."""


class BinaryExpression(Expression):
    """Binary expression statement."""

    operator: BinaryOperator
    """Binary operator."""
    left: Expression
    """Left side of the expression."""
    right: Expression
    """Right side of the expression."""

    def __init__(self):
        self.operator = None
        self.left = None
        self.right = None


class UnaryOperator(Enum):
    """Unary operator."""

    NOT = 1
    """Logical not operator"""

    NEGATIVE = 2
    """Arithmetic unary minus"""


class UnaryExpression(Expression):
    """Unary expression"""

    operator: UnaryOperator
    """Unary operator"""

    expression: Expression
    """Expression"""

    def __init__(self):
        self.operator = None
        self.expr = None


class PrimaryExpression(Expression):
    """Base class for primary expressions"""

    pass


class IntegerValue(PrimaryExpression):
    """Integer primary expression"""

    value: int
    """Integer value of primary expression"""

    def __init__(self, value: int):
        self.value = value


class FloatValue(PrimaryExpression):
    """Float primary expression"""

    value: float
    """Float value of primary expression"""

    def __init__(self, value: float):
        self.value = value


class BooleanValue(PrimaryExpression):
    """Boolean primary expression"""

    value: bool
    """Boolean value of primary expression"""

    def __init__(self, value: bool):
        self.value = value


class Parentheses(PrimaryExpression):
    """Parentheses for grouping expressions"""

    expression: Expression
    """Expression inside parentheses"""

    def __init__(self):
        self.expression = None


class VariableDeclaration(Statement):
    """Variable declaration statement."""

    name: str
    """Variable name."""
    type: str
    """Variable type."""

    def __init__(self):
        self.name = None
        self.type = None


class VariableReference(PrimaryExpression):
    """Variable reference expression."""

    name: str
    """Variable name."""

    def __init__(self):
        self.name = None


class ArrayAccess(Expression):
    """Access to element of array"""

    variable: Union[VariableReference, "MemberAccess"]
    """Reference to array variable"""

    index: Expression
    """Expression to calculate index in the array"""

    def __init__(self):
        self.variable = None
        self.index = None


class MemberAccess(Expression):
    """Access to the member of utype"""

    utype: Union["MemberAccess", ArrayAccess, VariableReference]
    """Left side - reference to utype"""

    member: VariableReference
    """Name of member"""

    def __init__(self):
        self.utype = None
        self.member = None


class Call(Statement):
    """Invocation of an inline function statement."""

    target: str
    """Target inline name."""
    parameters: List[Expression]
    """List of parameter values."""

    def __init__(self):
        self.target = None
        self.parameters = []


class Assert(Statement):
    """Assert statement."""

    expression: Expression
    """Expression to check."""

    def __init__(self):
        self.expression = None


class Assignment(Statement):
    """Assignment statement."""

    target: VariableReference
    """Target variable"""
    source: Expression
    """Value to be assigned."""

    def __init__(self):
        self.target = None
        self.source = None


class BlockType(Enum):
    """Statement block type."""

    BLOCK = 1
    """Normal block."""
    ATOMIC = 2
    """Atomic block."""


class Block(Statement):
    """Statement block."""

    type: BlockType
    """Block type."""
    statements: List[Statement]
    """List of the contained statements."""

    def __init__(self):
        self.type = None
        self.statements = []


class Alternative:
    """Alternative for a loop or switch statement."""

    condition: Statement
    """Condition unblocking the alternative (may be None)."""
    definition: List[Statement]
    """List of statements to be executed for the alternative."""
    type: BlockType
    """Block type."""

    def __init__(self):
        self.condition = None
        self.definition = []
        self.type = BlockType.BLOCK


class Label(Statement):
    """Label for use with goto."""

    name: str
    """Label name"""

    def __init__(self, name: str):
        self.name = name


class GoTo(Statement):
    """Goto statement."""

    target: str
    """Target label name."""

    def __init__(self, target):
        self.target = target


class Do(Statement):
    """Do loop."""

    alternatives: List[Alternative]
    """List of alternatives to loop over conditionally."""

    def __init__(self):
        self.alternatives = []


class ForLoop(Statement):
    """For loop."""

    iterator: VariableReference

    first: Union[int, VariableReference, MemberAccess]

    last: Union[int, VariableReference, MemberAccess]

    body: List[Statement]

    def __init__(
        self,
        iterator: VariableReference,
        first: Union[int, VariableReference, MemberAccess],
        last: Union[int, VariableReference, MemberAccess],
        body: List[Statement],
    ):
        self.iterator = iterator
        self.first = first
        self.last = last
        self.body = body


class Switch(Statement):
    """Switch statement."""

    alternatives: List[Alternative]
    """List of alternatives to execute conditionally."""

    def __init__(self):
        self.alternatives = []


class Skip(Statement):
    """Skip statement for a loop."""

    pass


class Break(Statement):
    """Break statement for a loop."""

    pass


class InlineParameter:
    """Parameter of an inline function."""

    name: str
    """Parameter name."""

    def __init__(self):
        self.name = None


class Inline:
    """Inline function."""

    name: str
    """Function name."""
    parameters: List[InlineParameter]
    """List of parameters."""
    definition: Block
    """Function definition."""

    def __init__(self):
        self.name = None
        self.parameters = []
        self.definition = None


class NeverClaim:
    """Never claim."""

    definition: Block
    """Never claim definition."""

    def __init__(self):
        self.definition = None


class StatementsWrapper:
    """Wrapper for passing a list of statements as a single item compatible with dispatch mechanics."""

    statements: List[Statement]
    """List of statements."""

    def __init__(self, statements: List[Statement]):
        self.statements = statements


class Model:
    """Promela model."""

    prologue: str
    """Free text to be included before the modelled statements."""
    epilogue: str
    """Free text to be included after the modelled statements."""
    inlines: List[Inline]
    """List of inline functions."""
    never: NeverClaim
    """Optional never claim."""
    variable_declarations: List[VariableDeclaration]
    """List of variable declarations."""

    def __init__(self):
        self.prologue = ""
        self.epilogue = ""
        self.inlines = []
        self.variable_declarations = []
        self.never = None
