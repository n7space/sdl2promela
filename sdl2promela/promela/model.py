import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
from enum import Enum

class Statement:
    pass

class VariableDeclaration(Statement):
    name : str
    type : str

    def __init__(self):
        self.name = None
        self.type = None

class VariableReference(Statement):
    name : str

    def __init__(self):
        self.name = None

class Call(Statement):
    target : str
    parameters : List[Statement]

    def __init__(self):
        self.target = None
        self.parameters = []


class Assignment(Statement):
    target : VariableReference
    source : Statement

    def __init__(self):
        self.target = None
        self.source = None


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

    def __init__(self):
        self.operator = None
        self.left = None
        self.right = None

class BlockType(Enum):
    BLOCK = 1
    ATOMIC = 2

class Block(Statement):
    type : BlockType
    statements : List[Statement]

    def __init__(self):
        self.type = None
        self.statements = []

class Alternative:
    condition : Statement
    definition : List[Statement]

    def __init__(self):
        self.condition = None
        self.definition = []

class Do(Statement):
    alternatives : List[Alternative]

    def __init__(self):
        self.alternatives = []

class Switch(Statement):
    alternatives : List[Alternative]

    def __init__(self):
        self.alternatives = []

class Skip(Statement):
    pass

class Break(Statement):
    pass

class InlineParameter:
    name : str

    def __init__(self):
        self.name = None

class Inline:
    name : str
    parameters : List[InlineParameter]
    definition : Block

    def __init__(self):
        self.name = None
        self.parameters = []
        self.definition = None

class Model:
    prologue : str
    epilogue : str
    inlines : List[Inline]

    def __init__(self):
        self.prologue = ""
        self.epilogue = ""
        self.inlines = []
