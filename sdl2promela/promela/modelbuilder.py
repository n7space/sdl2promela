import typing
from typing import List, Set, SupportsRound, Tuple, Type, Dict
from enum import Enum

from sdl2promela.promela.model import InlineParameter, Model, Inline, \
    Alternative, Block, Break, Skip, Switch, Do, Statement, Call, VariableDeclaration, VariableReference, \
    Assignment, BinaryExpression, BinaryOperator, BlockType

class ModelBuilder:
    model : Model

    def __init__(self):
        self.model = Model()

    def build(self) -> Model:
        return self.model

    def withPrologue(self, prologue : str) -> 'ModelBuilder':
        self.model.prologue = prologue
        return self

    def withEpilogue(self, epilogue : str) -> 'ModelBuilder':
        self.model.epilogue = epilogue
        return self

    def withInline(self, inline : Inline) -> 'ModelBuilder':
        self.model.inlines.append(inline)
        return self

class InlineBuilder:
    inline : Inline

    def __init__(self):
        self.inline = Inline()

    def build(self) -> Inline:
        return self.inline

    def withName(self, name : str) -> 'InlineBuilder':
        self.inline.name = name
        return self

    def withDefinition(self, definition : Block) -> 'InlineBuilder':
        self.inline.definition = definition
        return self

    def withParameter(self, parameterName : str) -> 'InlineBuilder':
        parameter = InlineParameter()
        parameter.name = parameterName
        self.inline.parameters.append(parameter)
        return self

class StatementsBuilder:
    statements : List[Statement]

    def __init__(self):
        self.statements = []

    def build(self) -> List[Statement]:
        return self.statements

    def withStatement(self, statement : Statement) -> 'StatementsBuilder':
       self.statements.append(statement)
       return self

    def withStatements(self, statements : List[Statement]) -> 'StatementsBuilder':
       self.statements.extend(statements)
       return self


class BlockBuilder:
    block : Block

    def __init__(self, type : BlockType):
        self.block = Block()
        self.block.type = type

    def build(self) -> Block:
        return self.block

    def withStatements(self, statements :  List[Statement]) -> 'BlockBuilder':
        self.block.statements.extend(statements)
        return self

class AlternativeBuilder:
    alternative : Alternative

    def __init__(self):
        self.alternative = Alternative()

    def build(self) -> Alternative:
        return self.alternative

    def withCondition(self, condition : Statement) -> 'AlternativeBuilder':
        self.alternative.condition = condition
        return self

    def withStatements(self, statements : List[Statement]) -> 'AlternativeBuilder':
        self.alternative.definition.extend(statements)
        return self

class SwitchBuilder:
    switch : Switch

    def __init__(self):
        self.switch = Switch()

    def build(self) -> Switch:
        return self.switch

    def withAlternative(self, alternative : Alternative) -> 'SwitchBuilder':
        self.switch.alternatives.append(alternative)
        return self

class DoBuilder:
    do : Do

    def __init__(self):
        self.do = Do()

    def build(self) -> Switch:
        return self.do

    def withAlternative(self, alternative : Alternative) -> 'DoBuilder':
        self.do.alternatives.append(alternative)
        return self

class CallBuilder:
    call : Call

    def __init__(self):
        self.call = Call()

    def build(self) -> Call:
        return self.call

    def withTarget(self, target : str) -> 'CallBuilder':
        self.call.target = target
        return self

    def withParameter(self, statement : Statement) -> 'CallBuilder':
        self.call.parameters.append(statement)
        return self

class AssignmentBuilder:
    assignment : Assignment

    def __init__(self):
        self.assignment = Assignment()

    def build(self) -> Assignment:
        return self.assignment

    def withTarget(self, target : VariableReference) -> 'AssignmentBuilder':
        self.assignment.target = target
        return self

    def withSource(self, source : Statement) -> 'AssignmentBuilder':
        self.assignment.source = source
        return self

class BinaryExpressionBuilder:
    expression : BinaryExpression

    def __init__(self, operator : BinaryOperator):
        self.expression = BinaryExpression()
        self.expression.operator = operator

    def build(self) -> BinaryExpression:
        return self.expression

    def withLeft(self, left : Statement) -> 'BinaryExpressionBuilder':
        self.expression.left = left
        return self

    def withRight(self, right : Statement) -> 'BinaryExpressionBuilder':
        self.expression.right = right
        return self

class VariableReferenceBuilder:
    reference : VariableReference

    def __init__(self, name : str):
        self.reference = VariableReference()
        self.reference.name = name

    def build(self) -> VariableReference:
        return self.reference

class VariableDeclarationBuilder:
    declaration : VariableDeclaration

    def __init__(self, name : str, type : str):
        self.declaration = VariableDeclaration()
        self.declaration.name = name
        self.declaration.type = type

    def build(self) -> VariableDeclaration:
        return self.declaration
