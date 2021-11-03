import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
from enum import Enum

class Statement:
    '''Promela statement.'''
    pass

class VariableDeclaration(Statement):
    '''Variable declaration statement.'''
    name : str
    '''Variable name.'''
    type : str
    '''Variable type.'''

    def __init__(self):
        self.name = None
        self.type = None

class VariableReference(Statement):
    '''Variable reference statement.'''
    name : str
    '''Variable name.'''

    def __init__(self):
        self.name = None

class Call(Statement):
    '''Invocation of an inline function statement.'''
    target : str
    '''Target inline name.'''
    parameters : List[Statement]
    '''List of parameter values.'''

    def __init__(self):
        self.target = None
        self.parameters = []


class Assignment(Statement):
    '''Assignment statement.'''
    target : VariableReference
    '''Target variable'''
    source : Statement
    '''Value to be assigned.'''

    def __init__(self):
        self.target = None
        self.source = None


class BinaryOperator(Enum):
    '''Binary operator.'''
    ADD = 1
    '''Addition operator.'''
    SUBTRACT = 2
    '''Subtraction operator.'''
    MULTIPLY = 3
    '''Multiplication operator.'''
    DIVIDE = 4
    '''Division operator.'''
    EQUAL = 5
    '''Equality test operator.'''
    LESS = 6
    '''Less than test operator.'''
    GREATER = 7
    '''Greater than test operator.'''
    LEQUAL = 8
    '''Less or equal test operator.'''
    GEQUAL = 9
    '''Greater or equal test operator.'''

class BinaryExpression(Statement):
    '''Binary expression statement.'''
    operator : BinaryOperator
    '''Binary operator.'''
    left : Statement
    '''Left side of the expression.'''
    right : Statement
    '''Right side of the expression.'''

    def __init__(self):
        self.operator = None
        self.left = None
        self.right = None

class BlockType(Enum):
    '''Statement block type.'''
    BLOCK = 1
    '''Normal block.'''
    ATOMIC = 2
    '''Atomic block.'''

class Block(Statement):
    '''Statement block.'''
    type : BlockType
    '''Block type.'''
    statements : List[Statement]
    '''List of the contained statements.'''

    def __init__(self):
        self.type = None
        self.statements = []

class Alternative:
    '''Alternative for a loop or swich statement.'''
    condition : Statement
    '''Condition unblocking the alternative (may be None).'''
    definition : List[Statement]
    '''List of statements to be executed for the alternative.'''

    def __init__(self):
        self.condition = None
        self.definition = []

class Do(Statement):
    '''Do loop.'''
    alternatives : List[Alternative]
    '''List of alternatives to loop over conditionally.'''

    def __init__(self):
        self.alternatives = []

class Switch(Statement):
    '''Switch statement.'''
    alternatives : List[Alternative]
    '''List of alternatives to execute conditionally.'''

    def __init__(self):
        self.alternatives = []

class Skip(Statement):
    '''Skip statement for a loop.'''
    pass

class Break(Statement):
    '''Break statement for a loop.'''
    pass

class InlineParameter:
    '''Parameter of an inline function.'''
    name : str
    '''Parameter name.'''

    def __init__(self):
        self.name = None

class Inline:
    '''Inline function.'''
    name : str
    '''Function name.'''
    parameters : List[InlineParameter]
    '''List of parameters.'''
    definition : Block
    '''Function definition.'''

    def __init__(self):
        self.name = None
        self.parameters = []
        self.definition = None

class Model:
    '''Promela model.'''
    prologue : str
    '''Free text to be included before the modelled statements.'''
    epilogue : str
    '''Free text to be included after the modelled statements.'''
    inlines : List[Inline]
    '''List of inline functions.'''

    def __init__(self):
        self.prologue = ""
        self.epilogue = ""
        self.inlines = []
