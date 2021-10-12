import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict

class Statement:
    pass

class Expression(Statement):
    definition : str

class Block(Statement):
    statements : List[Statement]

class AtomicBlock(Block):
    pass

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
