from typing import List, Dict, Union, Tuple, Any, Optional
from multipledispatch import dispatch
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR
from opengeode import sdl92Lexer as lexer
from enum import Enum
from sdl2promela.utils import Asn1Type


class State:
    """SDL state."""

    name: str
    """State name."""

    def __init__(self):
        self.name = None

    def __str__(self):
        return f"State(name={self.name})"

    def __eq__(self, other):
        return self.name == other.name

    def __ne__(self, other):
        return self.name != other.name

    def __hash__(self):
        return hash(self.name)


class Expression:
    """Base class for expressions."""

    """Expression type."""
    type: Asn1Type

    def __init__(self):
        self.type = None


class Constant(Expression):
    """Constant value."""

    value: str
    """Constant value."""

    def __init__(self, value: str):
        super().__init__()
        self.value = value

    def __str__(self):
        return f"Constant(value={self.value})"


class RealConstant(Expression):
    """Real constant value."""

    value: str
    """Real constant value."""

    def __init__(self, value: str):
        super().__init__()
        self.value = value

    def __str__(self):
        return f"RealConstant(value={self.value})"


class BooleanConstant(Expression):
    """Boolean constant value."""

    value: bool
    """Boolean value."""

    def __init__(self, value: bool):
        super().__init__()
        self.value = value

    def __str__(self):
        return f"BooleanConstant(value={self.value})"


class EnumValue(Expression):
    """Enum value."""

    value: str
    """Name of enum value."""

    type: Asn1Type
    """Type of enumerated."""

    def __init__(self, value, type):
        self.value = value
        self.type = type

    def __str__(self):
        return f"EnumValue(value={self.value})"


class EmptyStringValue(Expression):
    """Empty string literal from OpenGEODE."""

    def __str__(self):
        return "EmptyStringValue()"


class StringValue(Expression):
    """String literal from OpenGEODE."""

    value: str
    """String value."""

    def __init__(self, value: str):
        self.value = value

    def __str__(self):
        return f"StringValue(value={self.value})"


class OctetStringValue(Expression):
    """Octet String literal from OpenGEODE."""

    elements: List[int]
    """List of values, every element is a number from 0 to 255."""

    def __init__(self, elements: List[int]):
        self.elements = elements

    def __str__(self):
        return f"OctetStringValue(elements={self.elements})"

    def integer_value(self) -> int:
        """Return integer value of OCTET STRING."""
        result: int = 0
        for e in self.elements:
            result = (result << 8) + e
        return result


class BitStringValue(Expression):
    """Bit String literal from OpenGEODE."""

    elements: List[int]
    """List of values, every element is a number from 0 to 255."""

    def __init__(self, elements: List[int]):
        self.elements = elements

    def __str__(self):
        return f"OctetStringValue(elements={self.elements})"


class VariableReference(Expression):
    """Variable reference."""

    variableName: str
    """Variable name."""

    def __init__(self, name):
        self.variableName = name

    def __str__(self):
        return f"VariableReference(name={self.variableName})"


class ConstantReference(Expression):
    """Constant reference."""

    constantName: str
    """Constant name defined elsewhere, usually in ASN.1 datamodel."""

    def __init__(self, name):
        self.constantName = name

    def __str__(self):
        return f"ConstantReference(name={self.constantName})"


class ArrayAccess(Expression):
    """Access to element of SEQUENCE OF."""

    array: Union[VariableReference, "MemberAccess"]
    """Reference to array."""
    element: Expression
    """Index to the element of array."""

    def __init__(
        self, array: Union[VariableReference, "MemberAccess"], element: Expression
    ):
        self.array = array
        self.element = element

    def __str__(self):
        return f"ArrayAccess(array={self.array}, element={self.element})"


class MemberAccess(Expression):
    """Access to Member of SEQUENCE."""

    sequence: Union[VariableReference, "MemberAccess", ArrayAccess]
    """Reference to te SEQUENCE variable."""
    member: VariableReference
    """Name of the member."""

    def __init__(
        self,
        sequence: Union[VariableReference, "MemberAccess", ArrayAccess],
        member: VariableReference,
    ):
        self.sequence = sequence
        self.member = member

    def __str__(self):
        return f"MemberAccess(sequence={self.sequence}, member={self.member})"


class Sequence(Expression):
    """Value of SEQUENCE datatype."""

    elements: Dict[str, Expression]
    """Elements of SEQUENCE value."""
    type: Asn1Type
    """Type of value."""

    def __init__(self, elements: Dict[str, Expression], type: Asn1Type):
        self.elements = elements
        self.type = type

    def __str__(self):
        return f"Sequence(elements={self.elements}, type={self.type})"


class SequenceOf(Expression):
    """Value of SEQUENCE OF datatype."""

    elements: List[Expression]
    """Elements of SEQUENCE OF value."""
    type: Asn1Type
    """Type of value."""

    def __init__(self, elements: List[Expression], type: Asn1Type):
        self.elements = elements
        self.type = type

    def __str__(self):
        return f"SequenceOf(elements={self.elements}, type={self.type})"


class Choice(Expression):
    """Value of CHOICE datatype."""

    choice: str
    """Name of the selected alternative."""
    value: Expression
    """Value of the selected alternative."""

    def __init__(self, choice: str, value: Expression):
        self.choice = choice
        self.value = value

    def __str__(self):
        return f"Choice(choice={self.choice}, value={self.value})"


class Parameter:
    """Parameter for a signal or procedure."""

    target_variable: VariableReference
    """Target variable reference."""

    declared_type: Optional[Asn1Type]
    """Type of the parameter."""

    def __init__(self, name: str):
        self.target_variable = VariableReference(name)
        self.declared_type = None

    def __str__(self):
        return f"Parameter(target_variable={self.target_variable})"


class InputBlock:
    """Input block from SDL."""

    transition_id: int
    """Transition identifier which shall be executed after input."""

    target_variables: List[VariableReference]
    """List of variable references which shall receive input parameters."""

    def __init__(self, transition_id):
        self.transition_id = transition_id
        self.target_variables = []


class Input:
    """Input signal for an SDL state machine."""

    name: str
    """Signal name."""
    parameters: List[Parameter]
    """List of signal parameters."""
    transitions: Dict[State, InputBlock]
    """Map associating state with Input block"""

    def __init__(self):
        self.name = None
        self.parameters = []
        self.transitions = {}


class ContinuousSignal:
    """SDL Continuous Signal."""

    trigger: Expression
    """Condition expression associated with continous signal."""
    transition: int
    """Transition id associated with continuous signal."""

    def __init__(self):
        self.trigger = None
        self.transitions = {}


class BinaryOperator(Enum):
    """Binary operator for use in expressions."""

    EQUAL = 0
    """=="""
    NEQUAL = 1
    """!="""
    GREATER = 2
    """>"""
    LESS = 3
    """<"""
    LEQUAL = 4
    """<="""
    GEQUAL = 5
    """>="""
    ADD = 6
    """+"""
    SUB = 7
    """-"""
    MUL = 8
    """*"""
    DIV = 9
    """/"""
    MOD = 10
    """mod - modulo"""
    REM = 11
    """rem - modulo's remainder"""
    ASSIGN = 12
    """:="""
    XOR = 13
    """xor"""
    OR = 14
    """or"""
    AND = 15
    """and"""
    IMPLIES = 16
    "=>"


class UnaryOperator(Enum):
    """Unary operator for use in expressions."""

    NEG = 0
    """unary -"""

    NOT = 1
    """not"""


class BinaryExpression(Expression):
    """Expression involving a binary operator."""

    operator: BinaryOperator
    """Binary operator."""

    left: Expression
    """Left side of the expression, can be None if it is partial (e.g. used in Answer)."""

    right: Expression
    """Right side of the expression, can be None if it is partial (e.g. used in Answer)."""

    def __init__(self):
        self.operator = None
        self.left = None
        self.right = None

    def __str__(self):
        return f"BinaryExpression(operator={self.operator}, left={self.left}, right={self.right})"


class UnaryExpression(Expression):
    """Expression involving unary operator."""

    operator: UnaryOperator
    """Unary operator."""

    expression: Expression
    """Expression."""

    def __init__(self):
        self.operator = None
        self.expression = None

    def __str__(self):
        return (
            f"UnaryExpression(operator={self.operator}, expression={self.expression})"
        )


class ConditionalExpression(Expression):
    """Conditional ternary expression."""

    condition: Expression
    """Condition expression."""

    trueExpression: Expression
    """Expression evaluated when condition is true."""

    falseExpression: Expression
    """Expression evaluated when condition is false."""

    def __init__(self):
        self.condition = None
        self.trueExpression = None
        self.falseExpression = None

    def __str__(self):
        return f"ConditionalExpression(condition={self.condition}, trueExpression={self.trueExpression}, falseExpression={self.falseExpression})"


class ProcedureCall(Expression):
    """Procedure call."""

    name: str
    """Name of the called procedure."""

    parameters: List[Expression]
    """List of call parameters (any expression is possible)."""

    def __init__(self):
        self.name = None
        self.parameters = []

    def __str__(self) -> str:
        result = f"ProcedureCall(name={self.name},parameters="
        parameters = [str(param) for param in self.parameters]
        result += "[" + (", ".join(parameters)) + "]"
        result += ")"
        return result


class Action:
    """Base class for a transition action."""

    pass


class Actions(Action):
    """Wrapper to return multiple actions as a single one."""

    actions: List[Action]
    """List of actions."""

    def __init__(self):
        self.actions = []


class Task(Action):
    """Task action."""

    pass


class AssignmentTask(Task):
    """Assignment action."""

    assignment: BinaryExpression
    """Assignment expression."""

    type: Asn1Type
    """Type of assignment destination."""


class ForLoopRange:
    """Base class for ranges that can be iterated over"""

    pass


class NumericForLoopRange(ForLoopRange):
    """Numeric range that can be iterated over"""

    start: Expression
    """Start of the range, inclusive."""

    stop: Expression
    """End of the range, exclusive."""

    step: Expression
    """Iteration step, defaults to 1."""

    def __init__(self):
        self.start = None
        self.stop = None
        self.step = Constant("1")


class ForEachLoopRange(ForLoopRange):
    """Range over elements of sequenceof"""

    variable: Union[VariableReference, MemberAccess, ArrayAccess]
    """Reference to object to iterate, i.e. sequence of."""

    variableType: Optional[Asn1Type]
    """Type of variable."""

    type: Optional[Asn1Type]
    """Type of iterator variable."""

    def __init__(self):
        self.variable = None
        self.variableType = None
        self.type = None


class ForLoopTask(Task):
    """Task with a for loop."""

    iteratorName: VariableReference
    """Name of the iterator variable."""

    range: ForLoopRange
    """Range to iterate over."""

    actions: List[Action]
    """List of actions to be executed within the loop"""

    def __init__(self):
        self.actions = []
        self.range = None
        self.iteratorName = None


class Output(Action):
    """Signal output action."""

    name: str
    """Signal name."""
    parameters: List[Expression]
    """Output signal parameters."""

    def __init__(self):
        self.name = None
        self.parameters = []


class Terminator(Action):
    """Terminator action."""

    pass


class NextState(Terminator):
    """Next state action."""

    state_name: str
    """Next state name."""

    substate: str
    """Substate."""

    def __init__(self):
        self.state_name = None
        self.substate = None


class NextTransition(Terminator):
    """Next transition."""

    transition_id: Union[int, str]
    """Transition identifier to execute."""

    state_name: Optional[str]
    """Next state name."""

    def __init__(self):
        self.transition_id = None
        self.state_name = None


class TransitionChoice(Terminator):
    """Next transiton depending on current state."""

    candidates: Dict[State, Union[int, str]]
    """Map from state to transition_id."""

    def __init__(self):
        self.candidates = {}


class Join(Terminator):
    """Join action."""

    label_name: str
    """Label name."""

    def __init__(self):
        self.label_name = None


class Label(Action):
    """Label action."""

    name: str
    """Label name."""


class Answer(Action):
    """Answer to a Decision."""

    condition: Optional[Expression]
    """Guard condition. If empty, the Answer represents 'else'"""

    actions: List[Action]
    """Sequence of actions to be performed if the answer is applicable"""

    def __init__(self):
        self.actions = []
        self.condition = None


class Decision(Action):
    """Decision action."""

    condition: Expression
    """Decision expression."""

    answers: List[Answer]
    """List of possible answers."""

    def __init__(self):
        self.answers = []


class Transition:
    """SDL state machine transition."""

    id: int
    """Transition ID."""
    actions: List[Action]
    """List of transition actions."""

    parent: Union["Model", "Procedure"]
    """Parent of the transition"""

    possible_states: List[str]
    """List of possible states, which can lead do this transition."""

    def __init__(self):
        self.id = 0
        self.actions = []
        self.parent = None


class FloatingLabel:
    """SDL Floating (not attached directly to action sequence) Label"""

    name: str
    """Label name"""
    actions: List[Action]
    """List of label transition actions."""

    def __init__(self):
        self.name = ""
        self.actions = []


class VariableInfo:
    """
    Holds information about type and initial value of variable.
    """

    type: Asn1Type
    """Type of variable from opengeode."""

    value: Optional[Expression]
    """Optional initial value of variable."""

    def __init__(self, type, value):
        self.type = type
        self.value = value


class ProcedureParameterDirection(Enum):
    """Direction of a procedure parameter."""

    IN = 1
    """Input parameter."""

    OUT = 2
    """Output parameter."""


class ProcedureReturn(Terminator):
    """SDL procedure return statement."""

    expression: Expression
    """Return statement value."""

    def __init__(self):
        self.expression = None


class ProcedureParameter:
    """Procedure parameter."""

    name: str
    """Parameter name."""

    direction: ProcedureParameterDirection
    """Parameter direction."""

    typeObject: Asn1Type
    """Parameter type."""

    def __init__(self):
        self.name = ""
        self.direction = ProcedureParameterDirection.IN
        self.typeObject = None


class ProcedureType(Enum):
    INTERNAL = 1
    EXTERNAL = 2
    EXPORTED = 3


class Procedure:
    """SDL procedure."""

    name: str
    """Procedure name."""

    parameters: List[ProcedureParameter]
    """Procedure parameters."""

    transition: Transition
    """Procedure actions."""

    variables: Dict[str, VariableInfo]
    """
    All variables defined in the procedure, the key is a variable name,
    The value is an object where field 'type' is type and optional field 'value'
    is initial value of variable.
    """

    returnType: Asn1Type
    """Procedure return type. Can be None."""

    type: ProcedureType

    def __init__(self):
        self.name = ""
        self.parameters = []
        self.variables = {}
        self.transition = None
        self.returnType = None
        self.type = ProcedureType.INTERNAL


class ObservedSignalKind(Enum):
    """Kind of the observed signal."""

    INPUT = 1
    """Input Observer, inspecting input to a function."""

    OUTPUT = 2
    """Output Observer, inspecting and mutating output from a function."""

    CONTINUOUS_SIGNAL = 3
    """Continuous signal observer, reaction to change in system state."""

    UNHANDLED_INPUT = 4
    """Unhandled input, inspecting signal loss."""


class ObserverAttachmentInfo:
    """Observer attachment info sourced from the Renames clause."""

    observerSignalName: str
    """Name of the signal within the Observer."""

    originalSignalName: str
    """Name of the signal in the model."""

    kind: ObservedSignalKind
    """Kind of the observerd signal."""

    senderName: str
    """Name of the Sender."""

    recipientName: str
    """Name of the Recipient."""

    unhandled_input: bool
    """Detection of unhandled input, in such case the originalSignalName may be empty."""

    def __init__(self):
        self.observerSignalName = ""
        self.originalSignalName = ""
        self.kind = None
        self.senderName = None
        self.recipientName = None
        self.unhandled_input = False

    def __str__(self):
        return f"ObserverAttachmentInfo(observerSignalName={self.observerSignalName}, originalSignalName={self.originalSignalName}, kind={self.kind}, senderName={self.senderName}, recipientName={self.recipientName})"


def appendAllActions(destination, source):
    """
    Append all actions (and terminators) from the source to the destination.
    This function can be though of as a template, as the source and destination
    types can vary.
    :param destination: Destination container with "actions" member of type List[Action].
    :param source:  Source container with "actions" and "terminator" members.
    """
    if source.actions is not None:
        for source_action in source.actions:
            action = convert(source_action)
            if action is not None:
                destination.actions.append(action)
    if source.terminator is not None:
        action = convert(source.terminator)
        if action is not None:
            destination.actions.append(action)


@dispatch
def getBinaryOperatorEnum(op) -> BinaryOperator:
    """
    Convert OpenGEODE's binary operator to a consistent enumerated value.
    :param op: Operator.
    :returns: Binary operator.
    """
    raise NotImplementedError("getBinaryOperatorEnum not implemented for " + op)


__STR_BINARY_OPERATOR_DICTIONARY = {
    "+": BinaryOperator.ADD,
    "*": BinaryOperator.MUL,
    "-": BinaryOperator.SUB,
    "=": BinaryOperator.EQUAL,
    "/=": BinaryOperator.NEQUAL,
    ">": BinaryOperator.GREATER,
    ">=": BinaryOperator.GEQUAL,
    "<": BinaryOperator.LESS,
    "<=": BinaryOperator.LEQUAL,
    "/": BinaryOperator.DIV,
    "mod": BinaryOperator.MOD,
    "rem": BinaryOperator.REM,
    ":=": BinaryOperator.ASSIGN,
    "xor": BinaryOperator.XOR,
    "or": BinaryOperator.OR,
    "and": BinaryOperator.AND,
    "=>": BinaryOperator.IMPLIES,
}


@dispatch(str)
def getBinaryOperatorEnum(op: str) -> BinaryOperator:
    if op not in __STR_BINARY_OPERATOR_DICTIONARY.keys():
        raise ValueError("Unsupported operator: " + op)
    return __STR_BINARY_OPERATOR_DICTIONARY[op]


__AST_BINARY_OPERATOR_DICTIONARY = {
    ogAST.ExprPlus: BinaryOperator.ADD,
    ogAST.ExprMul: BinaryOperator.MUL,
    ogAST.ExprMinus: BinaryOperator.SUB,
    ogAST.ExprEq: BinaryOperator.EQUAL,
    ogAST.ExprNeq: BinaryOperator.NEQUAL,
    ogAST.ExprGt: BinaryOperator.GREATER,
    ogAST.ExprGe: BinaryOperator.GEQUAL,
    ogAST.ExprLt: BinaryOperator.LESS,
    ogAST.ExprLe: BinaryOperator.LEQUAL,
    ogAST.ExprDiv: BinaryOperator.DIV,
    ogAST.ExprMod: BinaryOperator.MOD,
    ogAST.ExprRem: BinaryOperator.REM,
    ogAST.ExprAssign: BinaryOperator.ASSIGN,
    ogAST.ExprXor: BinaryOperator.XOR,
    ogAST.ExprOr: BinaryOperator.OR,
    ogAST.ExprAnd: BinaryOperator.AND,
    ogAST.ExprImplies: BinaryOperator.IMPLIES,
}


@dispatch(type)
def getBinaryOperatorEnum(op: type) -> BinaryOperator:
    if op not in __AST_BINARY_OPERATOR_DICTIONARY.keys():
        raise ValueError("Unsupported operator: " + op.__name__)
    return __AST_BINARY_OPERATOR_DICTIONARY[op]


@dispatch
def convert(source) -> Action:
    """
    Convert OpenGEODE's action to a simplified action.
    :param source: Action object, as retrieved from the OpenGEODE's parser.
    :returns: Simplified action object.
    """
    raise NotImplementedError("convert not implemented for " + source)


@dispatch(ogAST.Label)
def convert(source: ogAST.Label):
    label = Label()
    label.name = source.inputString
    return label


@dispatch(ogAST.TaskForLoop)
def convert(source: ogAST.TaskForLoop):
    if len(source.elems) != 1:
        raise ValueError(
            "Assignment with an unsupported number of elements: " + len(source.elems)
        )
    for_loop = source.elems[0]
    task = ForLoopTask()
    task.iteratorName = VariableReference(for_loop["var"])
    task.iteratorName.type = for_loop["type"]
    if for_loop["range"]:
        range = NumericForLoopRange()
        if for_loop["range"]["start"] is None:
            range.start = None
        else:
            range.start = convert(for_loop["range"]["start"])
        range.stop = convert(for_loop["range"]["stop"])
        range.step = convert(for_loop["range"]["step"])
        task.range = range
    else:
        range = ForEachLoopRange()
        range.variable = convert(for_loop["list"])
        range.variableType = for_loop["list"].exprType
        range.type = for_loop["type"]
        task.range = range

    appendAllActions(task, for_loop["transition"])

    return task


@dispatch(ogAST.TaskAssign)
def convert(source: ogAST.TaskAssign):
    if len(source.elems) == 1:
        task = AssignmentTask()
        task.assignment = convert(source.elems[0])
        task.type = source.elems[0].left.exprType
        return task
    actions = Actions()
    for element in source.elems:
        task = AssignmentTask()
        task.assignment = convert(element)
        task.type = element.left.exprType
        actions.actions.append(task)
    return actions


@dispatch(ogAST.TaskInformalText)
def convert(source: ogAST.TaskInformalText):
    # Ignore informal text
    return None


@dispatch(ogAST.PrimVariable)
def convert(source: ogAST.PrimVariable):
    variableReference = VariableReference(source.value[0])

    variableReference.type = source.exprType

    return variableReference


@dispatch(ogAST.PrimSequence)
def convert(source: ogAST.PrimSequence):
    elements: Dict[str, Expression] = {}
    for elem, value in source.value.items():
        elements[elem] = convert(value)

    sequence = Sequence(elements, source.exprType)
    sequence.type = source.exprType
    return sequence


@dispatch(ogAST.PrimSequenceOf)
def convert(source: ogAST.PrimSequenceOf):
    elements: List[Expression] = []
    for elem in source.value:
        elements.append(convert(elem))

    sequenceof = SequenceOf(elements, source.exprType)
    sequenceof.type = source.exprType
    return sequenceof


@dispatch(ogAST.PrimEmptyString)
def convert(source: ogAST.PrimEmptyString):
    string = EmptyStringValue()
    string.type = source.exprType
    return string


@dispatch(ogAST.PrimStringLiteral)
def convert(source: ogAST.PrimStringLiteral):
    string = StringValue(source.value[1:-1])
    string.type = source.exprType
    return string


def decode_hex_bytes(characters) -> List[int]:
    """Decode string with hex digits into list of byte values."""
    length: int = len(characters)
    elements: List[int] = []

    for index in range(0, length, 2):
        byte_value = int("".join(characters[index : index + 2]), 16)
        elements.append(byte_value)

    return elements


@dispatch(ogAST.PrimOctetStringLiteral)
def convert(source: ogAST.PrimOctetStringLiteral):
    characters = list(source.value[1:-1])
    string = OctetStringValue(decode_hex_bytes(characters))
    string.type = source.exprType
    return string


@dispatch(ogAST.PrimBitStringLiteral)
def convert(source: ogAST.PrimBitStringLiteral):
    characters = list(source.value[1:-1])

    string = OctetStringValue(decode_hex_bytes(characters))
    string.type = source.exprType
    return string


@dispatch(ogAST.PrimChoiceItem)
def convert(source: ogAST.PrimChoiceItem):
    value = convert(source.value["value"])
    choice = Choice(source.value["choice"], value)
    choice.type = source.exprType
    return choice


@dispatch(ogAST.PrimConstant)
def convert(source: ogAST.PrimConstant):
    constantReference = ConstantReference(source.value[0])
    constantReference.type = source.exprType
    return constantReference


@dispatch(int)
def convert(source: int):
    constant = Constant(str(source))
    constant.type = int
    return constant


@dispatch(ogAST.PrimInteger)
def convert(source: ogAST.PrimInteger):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        constant = Constant(source.value[0])
    else:
        constant = Constant(source.value)

    constant.type = source.exprType
    return constant


@dispatch(ogAST.PrimReal)
def convert(source: ogAST.PrimReal):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        constant = RealConstant(source.value[0])
    else:
        constant = RealConstant(source.value)

    constant.type = source.exprType
    return constant


@dispatch(ogAST.PrimBoolean)
def convert(source: ogAST.PrimBoolean):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        constant = BooleanConstant(source.value[0].lower() == "true")
    else:
        constant = BooleanConstant(source.value.lower() == "true")

    constant.type = source.exprType
    return constant


@dispatch(ogAST.PrimEnumeratedValue)
def convert(source: ogAST.PrimEnumeratedValue):
    value = EnumValue(source.value[0], source.exprType)
    value.type = source.exprType
    return value


def __make_binary_expression(source: ogAST.Expression):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    expression.type = source.exprType
    return expression


@dispatch(ogAST.ExprPlus)
def convert(source: ogAST.ExprPlus):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprMul)
def convert(source: ogAST.ExprMul):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprMinus)
def convert(source: ogAST.ExprMinus):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprEq)
def convert(source: ogAST.ExprEq):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprNeq)
def convert(source: ogAST.ExprNeq):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprGt)
def convert(source: ogAST.ExprGt):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprGe)
def convert(source: ogAST.ExprGe):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprLt)
def convert(source: ogAST.ExprLt):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprLe)
def convert(source: ogAST.ExprLe):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprDiv)
def convert(source: ogAST.ExprDiv):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprMod)
def convert(source: ogAST.ExprMod):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprRem)
def convert(source: ogAST.ExprRem):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprAssign)
def convert(source: ogAST.ExprAssign):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprXor)
def convert(source: ogAST.ExprXor):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprOr)
def convert(source: ogAST.ExprOr):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprAnd)
def convert(source: ogAST.ExprAnd):
    return __make_binary_expression(source)


@dispatch(ogAST.ExprImplies)
def convert(source: ogAST.ExprImplies):
    # __make_binary_expression does not work here
    # The required property 'operand' isn't present in source
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = BinaryOperator.IMPLIES
    expression.right = convert(source.right)
    expression.type = source.exprType
    return expression


@dispatch(ogAST.ExprNeg)
def convert(source: ogAST.ExprNeg):
    expression = UnaryExpression()
    expression.operator = UnaryOperator.NEG
    expression.expression = convert(source.expr)
    expression.type = source.exprType
    return expression


@dispatch(ogAST.ExprNot)
def convert(source: ogAST.ExprNot):
    expression = UnaryExpression()
    expression.operator = UnaryOperator.NOT
    expression.expression = convert(source.expr)
    expression.type = source.exprType
    return expression


@dispatch(ogAST.Output)
def convert(source: ogAST.Output) -> Action:
    output = Output()
    # TODO handle parameters
    output.name = source.output[0]["outputName"]
    output.parameters = [
        convert(expression) for expression in source.output[0]["params"]
    ]
    return output


@dispatch(ogAST.PrimSelector)
def convert(source: ogAST.Output):
    result = convert(source.value[0])

    for elem in source.value[1:]:
        result = MemberAccess(result, VariableReference(elem))

    result.type = source.exprType
    return result


@dispatch(ogAST.PrimIndex)
def convert(source: ogAST.PrimIndex):
    variable = convert(source.value[0])

    index = convert(source.value[1]["index"][0])

    result = ArrayAccess(variable, index)

    result.type = source.exprType

    return result


@dispatch(ogAST.PrimConditional)
def convert(source: ogAST.PrimConditional):
    result = ConditionalExpression()

    result.condition = convert(source.value["if"])
    result.trueExpression = convert(source.value["then"])
    result.falseExpression = convert(source.value["else"])

    result.type = source.exprType
    return result


@dispatch(ogAST.PrimCall)
def convert(source: ogAST.PrimCall):
    call = ProcedureCall()
    call.name = source.value[0]
    call.parameters = [
        convert(expression) for expression in source.value[1]["procParams"]
    ]
    call.type = source.exprType
    return call


@dispatch(ogAST.ProcedureCall)
def convert(source: ogAST.ProcedureCall):
    call = ProcedureCall()
    call.name = source.output[0]["outputName"]
    call.parameters = [convert(expression) for expression in source.output[0]["params"]]

    call.type = source.exprType
    return call


@dispatch(ogAST.Terminator)
def convert(source: ogAST.Terminator) -> Action:
    if source.kind == "next_state":
        if source.inputString == "-":
            result = TransitionChoice()
            for transition_id, states in source.candidate_id.items():
                if transition_id != -1:
                    for state in states:
                        key = State()
                        key.name = state
                        result.candidates[key] = transition_id
            if len(result.candidates) > 0:
                return result
            else:
                next_state = NextState()
                next_state.state_name = ""
                return next_state
        if source.inputString == "-*":
            return None
        if source.next_id != -1:
            # Next State might lead to nested state,
            # In such case the another transition shall be executed
            next_transition = NextTransition()
            next_transition.transition_id = source.next_id
            next_transition.state_name = source.inputString
            return next_transition
        next_state = NextState()
        next_state.state_name = source.inputString
        next_state.substate = source.substate
        return next_state
    elif source.kind == "join":
        join = Join()
        join.label_name = source.inputString
        return join
    elif source.kind == "return":
        if source.next_id != -1:
            # Return can be used to exit from nested state
            next_transition = NextTransition()
            next_transition.transition_id = source.next_id
            return next_transition
        r = ProcedureReturn()
        if source.return_expr is not None:
            r.expression = convert(source.return_expr)
        return r
    else:
        raise ValueError("Unsupported terminator type: " + source)
    return None


@dispatch(ogAST.Answer)
def convert(source: ogAST.Answer) -> Action:
    answer = Answer()
    expressions: List[Expression] = []
    for item in source.answers:
        if item["kind"] == "open_range":
            expression = BinaryExpression()
            expression.operator = getBinaryOperatorEnum(item["content"][0])
            expression.right = convert(item["content"][1])
            expressions.append(expression)
        elif item["kind"] == "closed_range":
            expression = BinaryExpression()
            expression.operator = BinaryOperator.AND
            lhs = BinaryExpression()
            lhs.operator = BinaryOperator.GEQUAL
            lhs.right = convert(item["content"][0])
            expression.left = lhs
            rhs = BinaryExpression()
            rhs.operator = BinaryOperator.LEQUAL
            rhs.right = convert(item["content"][1])
            expression.right = rhs
            expressions.append(expression)
        elif item["kind"] == "constant":
            expression = BinaryExpression()
            expression.operator = BinaryOperator.EQUAL
            expression.right = convert(item["content"][1])
            expressions.append(expression)
        elif item["kind"] == "else":
            # In this case the Answer with empty conditions will be returned
            continue
        else:
            raise ValueError("Unsupported answer kind: " + item["kind"])

    if expressions:
        # Join all conditions using 'OR' operator
        condition = expressions[-1]
        expressions.pop(-1)
        while expressions:
            aux = BinaryExpression()
            aux.operator = BinaryOperator.OR
            aux.left = expressions[-1]
            aux.right = condition
            condition = aux
            expressions.pop(-1)
        answer.condition = condition

    transition = source.transition
    if transition is not None:
        appendAllActions(answer, transition)

    return answer


@dispatch(ogAST.Decision)
def convert(source: ogAST.Decision) -> Action:
    if source.kind == "question":
        if source.question is not None:
            decision = Decision()
            decision.condition = convert(source.question)
            for sourceAnswer in source.answers:
                answer = convert(sourceAnswer)
                decision.answers.append(answer)
            return decision
        else:
            raise ValueError("Empty (informal?) decision question")
    elif source.kind == "any":
        decision = Decision()
        decision.condition = None
        for sourceAnswer in source.answers:
            answer = convert(sourceAnswer)
            decision.answers.append(answer)
        return decision
    elif source.kind == "informal_text":
        # Ignore decision with informal text
        return None
    else:
        raise ValueError("Unsupported decision type: " + source.kind)
    return None


class Model:
    """SDL model in a simplified, normalized form (with no nested or parallel states)."""

    process_name: str
    """Process implementation name (name of process or process type if it exists)."""
    process_implementation_name: str
    """Prefix for state names."""
    floating_labels: Dict[str, FloatingLabel]
    """Map associating floating label names with the labels themselves"""
    states: Dict[str, State]
    """Map associating state names with the states themselves."""
    errorstates: List[str]
    """List of Error states for observers."""
    successstates: List[str]
    """List of Success states for observers."""
    ignorestates: List[str]
    """List of Ingore states for observers."""
    inputs: Dict[str, Input]
    """Map associating input signal names with the signals themselves."""
    outputs: Dict[str, Optional[Asn1Type]]
    """Map associating output signal names with the parameter types."""
    transitions: Dict[int, Transition]
    """Map associating transition IDs with the transitions themselves."""
    continuous_signals: Dict[str, List[ContinuousSignal]]
    """Map acociatting state with continuous signals."""
    source: ogAST.Process
    """The source (complex, as retrieved from the parser) SDL model."""
    types: Dict[str, Asn1Type]
    """All ASN.1 types available in process."""
    variables: Dict[str, VariableInfo]
    """
    All variables defined in the process, the key is a variable name,
    The value is a tuple where first element is type and the second
    is initial variable value.
    """
    constants: List[str]
    """
    Names of ASN.1 constants.
    """
    implicit_variables: Dict[str, VariableInfo]
    """
    Dictionary of implicitly defined variables, such as
    arguments of observer signals.
    """
    procedures: Dict[str, Procedure]
    """Dictionary of procedures."""
    observer_attachments: List[ObserverAttachmentInfo]
    """List of observer attachments."""
    named_transition_ids: Dict[str, int]
    """
    Dictionary with named transition identifiers.
    """
    aggregates: Dict[str, List[int]]
    """
    Aggregates contain information necessary for parallel states.
    Every item contains Name of parallel state and a list of
    transition ids which shall be executed on entry to the parallel state.
    """
    timers: List[str]
    """
    Names of declared timers.
    """
    monitors: Dict[str, VariableInfo]

    def __init__(self, process: ogAST.Process):
        if process.instance_of_ref:
            self.source = process.instance_of_ref
        else:
            self.source = process
        Helper.flatten(self.source, sep=SEPARATOR)
        self.input_aggregates = Helper.state_aggregations(self.source)
        self.input_parallel_states = Helper.parallel_states(self.input_aggregates)
        self.input_mapping = Helper.map_input_state(self.source)
        self.process_name = process.processName
        self.process_implementation_name = self.source.processName
        self.floating_labels = {}
        self.states = {}
        self.errorstates = self.source.errorstates
        self.successstates = self.source.successstates
        self.ignorestates = self.source.ignorestates
        self.inputs = {}
        self.outputs = {}
        self.continuous_signals = {}
        self.transitions = {}
        self.observer_attachments = []
        self.types = getattr(self.source.DV, "types", {})
        self.variables = {}
        self.procedures = {}
        self.implicit_variables = {}
        self.named_transition_ids = {}
        self.aggregates = {}
        self.timers = []
        self.monitors = {}

        self.__gather_states()
        self.__gather_constants()
        self.__gather_variables()
        self.__gather_timers()
        self.__gather_inputs()
        self.__gather_continuous_signals()
        self.__gather_transitions()
        self.__gather_floating_labels()
        self.__gather_procedures()
        self.__gather_named_transition_ids()
        self.__gather_aggregates()
        self.__gather_monitors()
        self.__gather_outputs()

    def __gather_states(self):
        # Source state names from mapping, as they should be already flattened
        # and decomposed
        for stateName in self.source.mapping:
            state = State()
            state.name = stateName
            self.states[stateName] = state

    def __gather_timers(self):
        for timer in self.source.timers:
            self.timers.append(timer.lower())

    def __gather_continuous_signals(self):
        for state in self.states:
            self.continuous_signals[state] = []
        continuous_signals_exist = False
        for state, signals in self.source.cs_mapping.items():
            for signal in signals:
                if signal.observer_input is not None:
                    # This is an artificial CS created by OpenGEODE
                    # for an observer.
                    continue
                cs = ContinuousSignal()
                cs.trigger = convert(signal.trigger.question)
                cs.transition = signal.transition_id
                self.continuous_signals[state].append(cs)
                continuous_signals_exist = True
        if continuous_signals_exist:
            info = ObserverAttachmentInfo()
            info.kind = ObservedSignalKind.CONTINUOUS_SIGNAL
            self.observer_attachments.append(info)

    def __get_inputs_of_name(self, name: str) -> List[ogAST.Input]:
        result = set()
        for inputs in self.source.mapping.values():
            if isinstance(inputs, List):
                for input in inputs:
                    # The input.inputList may contain multiple input signals
                    # To get the valid parameter list of one signal,
                    # The inputList with one element shall be considered.
                    # Also, the '*' does not contains proper parameter list.
                    if (
                        isinstance(input, ogAST.Input)
                        and (name in input.inputlist)
                        and len(input.inputlist) == 1
                        and input.inputString != "*"
                    ):
                        result.add(input)
        return list(result)

    def __extract_attachment_info(self, info: ObserverAttachmentInfo, astItem: Any):
        if astItem is None:
            return
        if astItem.type == lexer.INPUT_EXPRESSION:
            info.kind = ObservedSignalKind.INPUT
        elif astItem.type == lexer.OUTPUT_EXPRESSION:
            info.kind = ObservedSignalKind.OUTPUT
        elif astItem.type == lexer.ID:
            info.originalSignalName = astItem.text
        elif astItem.type == lexer.TO:
            # TO is assumed to be a simple function name
            info.recipientName = astItem.children[0].text
            return
        elif astItem.type == lexer.FROM:
            # FROM is assumed to be a simple function name
            info.senderName = astItem.children[0].text
            return
        elif astItem.type == lexer.UNHANDLED:
            info.kind = ObservedSignalKind.UNHANDLED_INPUT
            return
        if astItem.children is None:
            return
        for child in astItem.children:
            self.__extract_attachment_info(info, child)

    def __assign_input_parameter_type(self, input: Input, signal: Dict):
        if "type" not in signal.keys():
            return
        declared_type = signal["type"]
        if declared_type is None:
            return
        if len(input.parameters) != 1:
            raise Exception(f"Signal {input.name} has type, but no parameter")
        input.parameters[0].declared_type = declared_type

    def __handle_implicit_variable_declarations(self, input_block: ogAST.Input):
        if len(input_block.parameters) == 0:
            return
        # It has already been checked that at most one parameter is allowed
        parameter_name = input_block.parameters[0]
        if parameter_name not in self.source.aliases.keys():
            # OpenGEODE creates aliases for implicit parameters
            return
        declared_type = self.variables[parameter_name]
        if parameter_name in self.implicit_variables:
            if declared_type != self.implicit_variables[parameter_name]:
                raise Exception(
                    f"{parameter_name} parameter type is inconsistent with an implicit variable declared earlier"
                )
        else:
            self.implicit_variables[parameter_name] = declared_type

    def __gather_inputs(self):
        # Gather all inputs and their parameters
        for inputSignal in self.source.input_signals:
            input_name = inputSignal["name"]
            ignore_input = False
            for proc in self.source.procedures:
                # Ignore inputs that are procedures
                if proc.inputString.lower() == input_name.lower():
                    ignore_input = True
            if ignore_input:
                continue
            input = Input()
            input.name = input_name
            # If signal has property "type" it has a parameter
            # parameter name for signals is irrevelant for generation of promela
            if "type" in inputSignal:
                param = Parameter("input_param")
                param.declared_type = inputSignal["type"]
                input.parameters = [param]
                self.__assign_input_parameter_type(input, inputSignal)
            input.transitions = {}
            if (
                input.name not in self.inputs.keys()
                and inputSignal["renames"] is not None
            ):
                info = ObserverAttachmentInfo()
                self.__extract_attachment_info(info, inputSignal["renames"])
                info.observerSignalName = input.name
                self.observer_attachments.append(info)
            self.inputs[input.name] = input
        for timer in self.timers:
            input = Input()
            input.name = timer
            input.transitions = {}
            self.inputs[timer] = input
        # Build transition list
        for state_name, input_list in self.source.mapping.items():
            target = self.states[state_name]
            if not isinstance(input_list, List):  # Special START symbol
                continue
            for input_block in input_list:
                id = input_block.transition_id
                self.__handle_implicit_variable_declarations(input_block)
                # One Input block may refer to multiple signals,
                # Using '*' or ','
                # Iterate over all possible input signals
                # and add transitions
                for single_input in input_block.inputlist:
                    trigger = self.inputs[single_input]
                    block = InputBlock(id)
                    block.target_variables = [
                        VariableReference(param) for param in input_block.parameters
                    ]
                    trigger.transitions[target] = block

    def __convert_transition(self, source: ogAST.Transition) -> Transition:
        transition = Transition()
        transition.actions = []
        transition.parent = self
        transition.possible_states = source.possible_states
        appendAllActions(transition, source)
        return transition

    def __gather_transitions(self):
        for i in range(0, len(self.source.transitions)):
            self.transitions[i] = self.__convert_transition(self.source.transitions[i])
            self.transitions[i].id = i

    def __gather_outputs(self):
        for ou in self.source.output_signals:
            if "type" in ou:
                self.outputs[ou["name"].lower()] = ou["type"]
            else:
                self.outputs[ou["name"].lower()] = None

    def __gather_floating_labels(self):
        for src_label in self.source.content.floating_labels:
            dst_label = FloatingLabel()
            dst_label.name = src_label.inputString
            src_transition = src_label.transition
            if src_transition is not None:
                appendAllActions(dst_label, src_transition)
            self.floating_labels[dst_label.name] = dst_label

    def __gather_procedures(self):
        for src_procedure in self.source.procedures:
            if src_procedure.referenced:
                # If procedure is referenced
                continue
            procedure = Procedure()
            procedure.name = src_procedure.inputString
            if src_procedure.external:
                procedure.type = ProcedureType.EXTERNAL
            if src_procedure.exported:
                procedure.type = ProcedureType.EXPORTED
            for variable_name, info in src_procedure.variables.items():
                if info[1] is None:
                    procedure.variables[variable_name] = VariableInfo(info[0], None)
                else:
                    procedure.variables[variable_name] = VariableInfo(
                        info[0], convert(info[1])
                    )
            procedure.returnType = src_procedure.return_type
            for src_parameter in src_procedure.fpar:
                parameter = ProcedureParameter()
                parameter.name = src_parameter["name"]
                parameter.direction = (
                    ProcedureParameterDirection.OUT
                    if src_parameter["direction"] == "out"
                    else ProcedureParameterDirection.IN
                )
                parameter.typeObject = src_parameter["type"]
                procedure.parameters.append(parameter)
            if not src_procedure.external:
                # External procedures cannot have body
                # This block is executed only for non external procedures
                if src_procedure.transitions[0] is not None:
                    procedure.transition = self.__convert_transition(
                        src_procedure.transitions[0]
                    )
                    procedure.transition.parent = procedure
            if procedure.name.lower() in self.procedures:
                raise Exception(f"Duplicated procedure {procedure.name}")
            self.procedures[procedure.name.lower()] = procedure

    def __gather_named_transition_ids(self):
        for name, val in self.source.mapping.items():
            if name.endswith("START") and name != "START" and val:
                self.named_transition_ids[name] = int(val)

    def __gather_aggregates(self):
        aggregates = self.input_aggregates
        for name, substates in aggregates.items():
            aggregate_name = f"{name}{SEPARATOR}START"
            transitions = []
            for substate in substates:
                transition_name = f"{substate.statename}{SEPARATOR}START"
                if transition_name in self.named_transition_ids:
                    transitions.append(self.named_transition_ids[transition_name])
            self.aggregates[aggregate_name] = transitions

    def __gather_variables(self):
        for name, info in self.source.variables.items():
            # In opengeode the info is a tuple with two elements.
            # The first element is variable type
            # The second element is initial value or None
            if info[1] is None:
                self.variables[name] = VariableInfo(
                    info[0],
                    None,
                )
            else:
                self.variables[name] = VariableInfo(
                    info[0],
                    convert(info[1]),
                )

    def __gather_constants(self):
        # 'variables' is a dict with values defined in ASN.1 model
        self.constants = [
            name.replace("-", "_") for name in self.source.DV.variables.keys()
        ]

    def __gather_monitors(self):
        for name, info in self.source.monitors.items():
            if info[1] is None:
                self.monitors[name] = VariableInfo(info[0], None)
            else:
                self.monitors[name] = VariableInfo(info[0], convert(info[1]))
