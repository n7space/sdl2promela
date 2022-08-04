from typing import List, Union

from sdl2promela.promela.model import (
    InlineParameter,
    Model,
    Inline,
    Alternative,
    Block,
    Switch,
    Do,
    ForLoop,
    Statement,
    Call,
    VariableDeclaration,
    VariableReference,
    Assignment,
    BinaryExpression,
    BinaryOperator,
    BlockType,
    UnaryExpression,
    UnaryOperator,
    Expression,
    ArrayAccess,
    MemberAccess,
    Assert,
    NeverClaim,
    ConditionalExpression,
)


class ModelBuilder:
    """Promela model builder."""

    model: Model
    """Built model."""

    def __init__(self):
        self.model = Model()

    def build(self) -> Model:
        """
        Retrieve the built model.
        :returns: The built model.
        """
        return self.model

    def withPrologue(self, prologue: str) -> "ModelBuilder":
        """
        Set prologue.
        :param prologue: Prologue to be set.
        :returns: The buider itself (for call chaining).
        """
        self.model.prologue = prologue
        return self

    def withEpilogue(self, epilogue: str) -> "ModelBuilder":
        """
        Set epilogue.
        :param epilogue: Epilogue to be set.
        :returns: The buider itself (for call chaining).
        """
        self.model.epilogue = epilogue
        return self

    def withInline(self, inline: Inline) -> "ModelBuilder":
        """
        Add an inline function.
        :param inline: Inline to be added.
        :returns: The buider itself (for call chaining).
        """
        self.model.inlines.append(inline)
        return self

    def withNever(self, never: NeverClaim) -> "ModelBuilder":
        """
        Set a never claim in the model.
        :param never: Never claim to be added.
        :returns: The buider itself (for call chaining).
        """
        self.model.never = never
        return self

    def withVariable(self, variable: VariableDeclaration) -> "ModelBuilder":
        """
        Add a variable declaration.
        :param variable: Variable declaration to be added.
        :returns: The builder itself (for call chaining).
        """
        self.model.variable_declarations.append(variable)
        return self


class InlineBuilder:
    """Inline function builder."""

    inline: Inline
    """Built inline."""

    def __init__(self):
        self.inline = Inline()

    def build(self) -> Inline:
        """
        Retrieve the built inline.
        :returns: The built inline.
        """
        return self.inline

    def withName(self, name: str) -> "InlineBuilder":
        """
        Set name.
        :param name: Name to be set.
        :returns: The buider itself (for call chaining).
        """
        self.inline.name = name
        return self

    def withDefinition(self, definition: Block) -> "InlineBuilder":
        """
        Set definition.
        :param definition: Definition to be set.
        :returns: The buider itself (for call chaining).
        """
        self.inline.definition = definition
        return self

    def withParameter(self, parameterName: str) -> "InlineBuilder":
        """
        Add an inline parameter.
        :param parameterName: Name of the inline parameter.
        :returns: The buider itself (for call chaining).
        """
        parameter = InlineParameter()
        parameter.name = parameterName
        self.inline.parameters.append(parameter)
        return self


class NeverBuilder:
    """Never claim builder."""

    never: NeverClaim
    """Build never claim."""

    def __init__(self):
        self.never = NeverClaim()

    def build(self) -> NeverClaim:
        """
        Retrieve the built never claim..
        :returns: The built never claim.
        """
        return self.never

    def withDefinition(self, definition: Block) -> "NeverBuilder":
        """
        Set definition.
        :param definition: Definition to be set.
        :returns: The buider itself (for call chaining).
        """
        self.never.definition = definition
        return self


class StatementsBuilder:
    """Statement list builder."""

    statements: List[Statement]
    """Built list of statements."""

    def __init__(self):
        self.statements = []

    def build(self) -> List[Statement]:
        """
        Retrieve the built list of statements.
        :returns: The built list of statements.
        """
        return self.statements

    def withStatement(self, statement: Statement) -> "StatementsBuilder":
        """
        Add a statement.
        :param statement: Statement to be added.
        :returns: The buider itself (for call chaining).
        """
        self.statements.append(statement)
        return self

    def withStatements(self, statements: List[Statement]) -> "StatementsBuilder":
        """
        Add a list of statements.
        :param statements: List of statements to be added.
        :returns: The buider itself (for call chaining).
        """
        self.statements.extend(statements)
        return self


class BlockBuilder:
    """Statement block builder."""

    block: Block
    """Built block."""

    def __init__(self, type: BlockType):
        self.block = Block()
        self.block.type = type

    def build(self) -> Block:
        """
        Retrieve the built block.
        :returns: The built block.
        """
        return self.block

    def withStatement(self, statement: Statement) -> "BlockBuilder":
        """
        Add one statement.
        :param statement: One statement to be added.
        :returns: The buider itself (for call chaining).
        """
        self.block.statements.append(statement)
        return self

    def withStatements(self, statements: List[Statement]) -> "BlockBuilder":
        """
        Add a list of statements.
        :param statements: List of statements to be added.
        :returns: The buider itself (for call chaining).
        """
        self.block.statements.extend(statements)
        return self


class AlternativeBuilder:
    """Alternative builder."""

    alternative: Alternative
    """Built alternative."""

    def __init__(self, type: BlockType = BlockType.BLOCK):
        self.alternative = Alternative()
        self.alternative.type = type

    def build(self) -> Alternative:
        """
        Retrieve the built alternative.
        :returns: The built alternative.
        """
        return self.alternative

    def withCondition(self, condition: Statement) -> "AlternativeBuilder":
        """
        Set condition.
        :param condition: Condition to be set.
        :returns: The buider itself (for call chaining).
        """
        self.alternative.condition = condition
        return self

    def withStatements(self, statements: List[Statement]) -> "AlternativeBuilder":
        """
        Add a list of statements.
        :param statements: List of statements to be added.
        :returns: The buider itself (for call chaining).
        """
        self.alternative.definition.extend(statements)
        return self


class SwitchBuilder:
    """Switch statement builder."""

    switch: Switch
    """Built switch statement."""

    def __init__(self):
        self.switch = Switch()

    def build(self) -> Switch:
        """
        Retrieve the built switch statement.
        :returns: The built switch statement.
        """
        return self.switch

    def withAlternative(self, alternative: Alternative) -> "SwitchBuilder":
        """
        Add an alternative.
        :param alternative: Alternative to be added.
        :returns: The buider itself (for call chaining).
        """
        self.switch.alternatives.append(alternative)
        return self


class DoBuilder:
    """Do loop builder."""

    do: Do
    """Built do loop."""

    def __init__(self):
        self.do = Do()

    def build(self) -> Do:
        """
        Retrieve the built do loop.
        :returns: The built do loop.
        """
        return self.do

    def withAlternative(self, alternative: Alternative) -> "DoBuilder":
        """
        Add an alternative.
        :param alternative: Alternative to be added.
        :returns: The buider itself (for call chaining).
        """
        self.do.alternatives.append(alternative)
        return self


class ForLoopBuilder:
    """For loop builder."""

    _iterator: VariableReference

    _first: Union[int, Expression]

    _last: Union[int, Expression]

    _body: List[Statement]

    def __init__(self):
        self._iterator = None
        self._first = None
        self._last = None
        self._body = []

    def withIterator(self, iterator: VariableReference):
        """
        Add Iterator name.
        :param iterator: Reference to iterator variable.
        :returns: The builder itself (for call chaining).
        """
        self._iterator = iterator
        return self

    def withFirst(self, first: Union[int, Expression]):
        """
        Add First value.
        :param first: Value for first.
        :returns: The builder itself (for call chaining).
        """
        self._first = first
        return self

    def withLast(self, last: Union[int, Expression]):
        """
        Add Last value.
        :param last: Value for last
        :returns: The builder itself (for call chaining).
        """
        self._last = last
        return self

    def withBody(self, body: List[Statement]):
        """
        Add Body.
        :param body: Body of for loop.
        :returns: The builder itself (for call chaining).
        """
        self._body = body
        return self

    def build(self):
        """
        Retrieve the built for loop.
        :returns: The built for loop.
        """
        return ForLoop(self._iterator, self._first, self._last, self._body)


class CallBuilder:
    """Inline call builder."""

    call: Call
    """Built call."""

    def __init__(self):
        self.call = Call()

    def build(self) -> Call:
        """
        Retrieve the built call.
        :returns: The built call.
        """
        return self.call

    def withTarget(self, target: str) -> "CallBuilder":
        """
        Set target inline name.
        :param target: Target inline name to be set.
        :returns: The buider itself (for call chaining).
        """
        self.call.target = target
        return self

    def withParameter(self, parameter: Expression) -> "CallBuilder":
        """
        Add a parameter.
        :param parameter: Parameter to be added.
        :returns: The buider itself (for call chaining).
        """
        self.call.parameters.append(parameter)
        return self


class AssertBuilder:

    assertStatement: Assert

    def __init__(self):
        self.assertStatement = Assert()

    def withExpression(self, expression: Expression) -> "AssertBuilder":
        self.assertStatement.expression = expression
        return self

    def build(self) -> Assert:
        return self.assertStatement


class AssignmentBuilder:
    """Assignment statement builder."""

    assignment: Assignment
    """Built assignment statement."""

    def __init__(self):
        self.assignment = Assignment()

    def build(self) -> Assignment:
        """
        Retrieve the built assignment statement.
        :returns: The built assignment.
        """
        return self.assignment

    def withTarget(self, target: VariableReference) -> "AssignmentBuilder":
        """
        Set target variable reference.
        :param target: Target variable reference to be set.
        :returns: The buider itself (for call chaining).
        """
        self.assignment.target = target
        return self

    def withSource(self, source: Expression) -> "AssignmentBuilder":
        """
        Set source expression.
        :param source: Source expression to be set.
        :returns: The buider itself (for call chaining).
        """
        self.assignment.source = source
        return self


class BinaryExpressionBuilder:
    """Binary expression builder."""

    expression: BinaryExpression
    """Built binary expression."""

    def __init__(self, operator: BinaryOperator):
        self.expression = BinaryExpression()
        self.expression.operator = operator

    def build(self) -> BinaryExpression:
        """
        Retrieve the built binary expression.
        :returns: The built expression.
        """
        return self.expression

    def withLeft(self, left: Expression) -> "BinaryExpressionBuilder":
        """
        Set left side of the expression.
        :param left: Left side of the expression to be set.
        :returns: The buider itself (for call chaining).
        """
        self.expression.left = left
        return self

    def withRight(self, right: Expression) -> "BinaryExpressionBuilder":
        """
        Set right side of the expression.
        :param right: Right side of the expression to be set.
        :returns: The buider itself (for call chaining).
        """
        self.expression.right = right
        return self


class UnaryExpressionBuilder:
    """Unary expression builder."""

    expression: UnaryExpression
    """Build unary expression."""

    def __init__(self, operator: UnaryOperator):
        self.expression = UnaryExpression()
        self.expression.operator = operator

    def build(self) -> UnaryExpression:
        """
        Retrieve the built unary expression.
        :returns: The built expression.
        """
        return self.expression

    def withExpression(self, expression: Expression) -> "UnaryExpressionBuilder":
        """
        Set the expression.
        :param expression: the expression to be set.
        :returns: The buider itself (for call chaining).
        """
        self.expression.expression = expression
        return self


class ConditionalExpressionBuilder:
    """Conditional expression builder."""

    expression: ConditionalExpression
    """Build conditional expression."""

    def __init__(self):
        self.expression = ConditionalExpression()

    def build(self) -> ConditionalExpression:
        """
        Retrieve the built conditional expression.
        :returns: The built expression.
        """
        return self.expression

    def withCondition(self, condition: Expression) -> "ConditionalExpressionBuilder":
        """
        Set the condition expression.
        :param expression: the condition expression.
        :returns: The builder itself (for call chaining).
        """
        self.expression.condition = condition
        return self

    def withTrueExpression(
        self, expression: Expression
    ) -> "ConditionalExpressionBuilder":
        """
        Set the true expression.
        :param expression: the true expression.
        :returns: The builder itself (for call chaining).
        """
        self.expression.trueExpression = expression
        return self

    def withFalseExpression(
        self, expression: Expression
    ) -> "ConditionalExpressionBuilder":
        """
        Set the false expression.
        :param expression: the false expression.
        :returns: The builder itself (for call chaining).
        """
        self.expression.falseExpression = expression
        return self


class ArrayAccessBuilder:
    """ArrayAccess builder."""

    arrayAccess: ArrayAccess
    """Built variable reference."""

    def __init__(self):
        self.arrayAccess = ArrayAccess()

    def build(self) -> ArrayAccess:
        """
        Retrieve the built array access expression.
        :returns: The built expression.
        """
        return self.arrayAccess

    def withArray(
        self, array: Union[VariableReference, MemberAccess]
    ) -> "ArrayAccessBuilder":
        """
        Set the reference to array.
        :param array: the reference to array to be set.
        :returns: The buider itself (for call chaining).
        """
        self.arrayAccess.variable = array
        return self

    def withIndex(self, index: Expression) -> "ArrayAccessBuilder":
        """
        Set the index expression.
        :param index: the index expression to be set.
        :returns: The buider itself (for call chaining).
        """
        self.arrayAccess.index = index
        return self


class MemberAccessBuilder:
    """Member access builder."""

    memberAccess: MemberAccess
    """Build member access expression."""

    def __init__(self):
        self.memberAccess = MemberAccess()

    def build(self) -> MemberAccess:
        """
        Retrieve the built member access expression.
        :returns: The built expression.
        """
        return self.memberAccess

    def withUtypeReference(
        self, utypeReference: Union[MemberAccess, ArrayAccess, VariableReference]
    ):
        """
        Set the reference to utype.
        :param utypeReference: the reference to utype, which might be:
        reference to variable, element of array or member in another utype
        :returns: The buider itself (for call chaining).
        """
        self.memberAccess.utype = utypeReference
        return self

    def withMember(self, member: VariableReference):
        """
        Set the member of utype;
        :param field: the field to set;
        :returns: The buider itself (for call chaining).
        """
        self.memberAccess.member = member
        return self


class VariableReferenceBuilder:
    """Variable reference builder."""

    reference: VariableReference
    """Built variable reference."""

    def __init__(self, name: str):
        self.reference = VariableReference()
        self.reference.name = name

    def build(self) -> VariableReference:
        """
        Retrieve the built variable reference.
        :returns: The built variable reference.
        """
        return self.reference


class VariableDeclarationBuilder:
    """Variable declaration builder."""

    declaration: VariableDeclaration
    """Built variable declaration."""

    def __init__(self, name: str, type: str):
        self.declaration = VariableDeclaration()
        self.declaration.name = name
        self.declaration.type = type

    def build(self) -> VariableDeclaration:
        """
        Retrieve the built variable declaration.
        :returns: The built variable declaration.
        """
        return self.declaration
