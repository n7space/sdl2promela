import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
from enum import Enum

class Statement:
    pass

class VariableDeclaration(Statement):
    name : str
    type : str

class VariableReference(Statement):
    name : str

class Call(Statement):
    target : str
    parameters : List[Statement]

class Assignment(Statement):
    target : VariableReference
    source : Statement

class BinaryOperator(Enum):
    ADD = 1
    SUBTRACT = 2
    MULTIPLY = 3
    DIVIDE = 4
    EQUAL = 5
    LESS = 6
    GREATER = 7
    LEQUAL = 8
    GEQUAL = 9

class BinaryExpression(Statement):
    operator : BinaryOperator
    left : Statement
    right : Statement

class BlockType(Enum):
    BLOCK = 1
    ATOMIC = 2

class Block(Statement):
    type : BlockType
    statements : List[Statement]

class Alternative:
    condition : Statement
    definition : List[Statement]

class Do(Statement):
    alternatives : List[Alternative]

class Switch(Statement):
    alternatives : List[Alternative]

class Skip(Statement):
    pass

class Break(Statement):
    pass

class InlineParameter:
    name : str

class Inline:
    name : str
    parameters : List[InlineParameter]
    definition : Block

class Model:
    prologue : str
    epilogue : str
    inlines : List[Inline]
