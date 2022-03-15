from typing import List, Dict, Union, Tuple
from multipledispatch import dispatch
from opengeode import ogAST
from opengeode import Helper
from opengeode.AdaGenerator import SEPARATOR
from enum import Enum


class State:
    """SDL state."""

    name: str
    """State name."""

    def __init__(self):
        self.name = None

    def __str__(self):
        return f"State(name={self.name})"


class Expression:
    """Base class for expressions."""

    pass


class Constant(Expression):
    """Constant value."""

    value: str
    """Constant value ."""

    def __init__(self, value):
        self.value = value

    def __str__(self):
        return f"Constant(value={self.value})"


class VariableReference(Expression):
    """Variable reference."""

    variableName: str
    """Variable name."""

    def __init__(self, name):
        self.variableName = name

    def __str__(self):
        return f"VariableReference(name={self.variableName})"


class ArrayAccess(Expression):
    "Access to element of SEQUENCE OF"

    array: Union[VariableReference, "MemberAccess"]
    element: Expression

    def __init__(
        self, array: Union[VariableReference, "MemberAccess"], element: Expression
    ):
        self.array = array
        self.element = element

    def __str__(self):
        return f"ArrayAccess(array={self.array}, element={self.element})"


class MemberAccess(Expression):
    "Access to Member of SEQUENCE"

    sequence: Union[VariableReference, "MemberAccess", ArrayAccess]
    member: VariableReference

    def __init__(
        self,
        sequence: Union[VariableReference, "MemberAccess", ArrayAccess],
        member: VariableReference,
    ):
        self.sequence = sequence
        self.member = member

    def __str__(self):
        return f"MemberAccess(sequence={self.sequence}, member={self.member})"


class Parameter:
    """Parameter for a signal or procedure."""

    target_variable: VariableReference
    """Target variable reference."""

    def __init__(self, name: str):
        self.target_variable = VariableReference(name)

    def __str__(self):
        return f"Parameter(target_variable={self.target_variable})"


class Input:
    """Input signal for an SDL state machine."""

    name: str
    """Signal name."""
    parameters: List[Parameter]
    """List of signal parameters."""
    transitions: Dict[int, State]
    """Map associating transition IDs with states."""

    def __init__(self):
        self.name = None
        self.parameters = []
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


class Action:
    """Base class for a transition action."""

    pass


class Task(Action):
    """Task action."""

    pass


class AssignmentTask(Task):
    """Assignment action."""

    assignment: BinaryExpression
    """Assignment expression."""

    type: object
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
    parameters: List[Parameter]
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

    def __init__(self):
        self.state_name = None


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

    conditions: List[Expression]
    """Guard condition."""

    actions: List[Action]
    """Sequence of actions to be performed if the answer is applicable"""

    def __init__(self):
        self.actions = []
        self.conditions = []


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

    def __init__(self):
        self.id = 0
        self.actions = []


class FloatingLabel:
    """SDL Floating (not attached directly to action sequence) Label"""

    name: str
    """Label name"""
    actions: List[Action]
    """List of label transition actions."""

    def __init__(self):
        self.name = ""
        self.actions = []


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
    if for_loop["range"]:
        range = NumericForLoopRange()
        range.start = convert(for_loop["range"]["start"])
        range.stop = convert(for_loop["range"]["stop"])
        range.step = convert(for_loop["range"]["step"])
        task.range = range
    appendAllActions(task, for_loop["transition"])

    return task


@dispatch(ogAST.TaskAssign)
def convert(source: ogAST.TaskAssign):
    if len(source.elems) != 1:
        raise ValueError(
            "Assignment with an unsupported number of elements: " + len(source.elems)
        )
    task = AssignmentTask()
    task.assignment = convert(source.elems[0])
    task.type = source.elems[0].left.exprType
    return task


@dispatch(ogAST.PrimVariable)
def convert(source: ogAST.PrimVariable):
    variableReference = VariableReference(source.value[0])

    return variableReference


@dispatch(int)
def convert(source: int):
    return Constant(str(source))


@dispatch(ogAST.PrimInteger)
def convert(source: ogAST.PrimInteger):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        return Constant(source.value[0])
    else:
        return Constant(source.value)


@dispatch(ogAST.PrimBoolean)
def convert(source: ogAST.PrimBoolean):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        return Constant(source.value[0])
    else:
        return Constant(source.value)


@dispatch(ogAST.PrimEnumeratedValue)
def convert(source: ogAST.PrimEnumeratedValue):
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        return Constant(source.value[0])
    else:
        return Constant(source.value)


def __make_binary_expression(source: ogAST.Expression):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
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

    print("Utype: ", result)

    for elem in source.value[1:]:
        result = MemberAccess(result, VariableReference(elem))

    print("Result: ", result)
    return result


@dispatch(ogAST.PrimIndex)
def convert(source: ogAST.PrimIndex):
    variable = convert(source.value[0])

    print("Array: ", variable)

    index = convert(source.value[1]["index"][0])

    result = ArrayAccess(variable, index)

    print("Result: ", result)

    return result


@dispatch(ogAST.Terminator)
def convert(source: ogAST.Terminator) -> Action:
    if source.kind == "next_state":
        if source.inputString == "-":
            return None  # No state switch
        next_state = NextState()
        next_state.state_name = source.inputString
        return next_state
    elif source.kind == "join":
        join = Join()
        join.label_name = source.inputString
        return join
    else:
        raise ValueError("Unsupported terminator type: " + source)
    return None


@dispatch(ogAST.Answer)
def convert(source: ogAST.Answer) -> Action:
    answer = Answer()
    for item in source.answers:
        if item["kind"] == "open_range":
            expression = BinaryExpression()
            expression.operator = getBinaryOperatorEnum(item["content"][0])
            expression.right = convert(item["content"][1])
            answer.conditions.append(expression)
        elif item["kind"] == "constant":
            expression = BinaryExpression()
            expression.operator = BinaryOperator.EQUAL
            expression.right = convert(item["content"][1])
            answer.conditions.append(expression)
        else:
            raise ValueError("Unsupported answer kind: " + item["kind"])

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
    else:
        raise ValueError("Unsupported decision type: " + source.kind)
    return None


class Model:
    """SDL model in a simplified, normalized form (with no nested or parallel states)."""

    process_name: str
    """SDL process name."""
    floating_labels: Dict[str, FloatingLabel]
    """Map associating floating label names with the labels themselves"""
    states: Dict[str, State]
    """Map associating state names with the states themselves."""
    inputs: Dict[str, Input]
    """Map associating input signal names with the signals themselves."""
    transitions: Dict[int, Transition]
    """Map associating transition IDs with the transitions themselves."""
    source: ogAST.Process
    """The source (complex, as retrieved from the parser) SDL model."""
    types: Dict[str, object]
    """All ASN.1 types available in process."""
    variables: Dict[str, Tuple[object, object]]

    def __init__(self, process: ogAST.Process):
        self.source = process
        Helper.flatten(process, sep=SEPARATOR)
        self.process_name = process.processName
        self.floating_labels = {}
        self.states = {}
        self.inputs = {}
        self.transitions = {}
        self.types = getattr(process.DV, "types", {})
        self.variables = process.variables

        self.__gather_states()
        self.__gather_inputs()
        self.__gather_transitions()
        self.__gather_floating_labels()

    def __gather_states(self):
        # Source state names from mapping, as they should be already flattened
        # and decomposed
        for stateName in self.source.mapping:
            state = State()
            state.name = stateName
            self.states[stateName] = state

    def __get_inputs_of_name(self, name: str) -> List[ogAST.Input]:
        result = set()
        for inputs in self.source.mapping.values():
            if isinstance(inputs, List):
                for input in inputs:
                    if isinstance(input, ogAST.Input) and (name in input.inputlist):
                        result.add(input)
        return list(result)

    def __get_input_parameters(self, input_name: str) -> List[Parameter]:
        inputs = self.__get_inputs_of_name(input_name)
        if len(inputs) == 0:
            return []
        result = []
        # All inputs of the same name should have the same parameters,
        # so the first one should be good enough
        input = inputs[0]
        for parameterName in input.parameters:
            parameter = Parameter(parameterName)
            result.append(parameter)
        return result

    def __gather_inputs(self):
        # Gather all inputs and their parameters
        for inputSignal in self.source.input_signals:
            input = Input()
            input.name = inputSignal["name"]
            input.parameters = self.__get_input_parameters(input.name)
            input.transitions = {}
            self.inputs[input.name] = input
        # Build transition list
        for state_name, input_list in self.source.mapping.items():
            target = self.states[state_name]
            if not isinstance(input_list, List):
                continue
            for input_block in input_list:
                id = input_block.transition_id
                # One Input block may refer to multiple signals,
                # Using '*' or ','
                # Iterate over all possible input signals
                # and add transitions
                for single_input in input_block.inputlist:
                    trigger = self.inputs[single_input]
                    trigger.transitions[id] = target

    def __convert_transition(self, source: ogAST.Transition) -> Transition:
        transition = Transition()
        transition.actions = []
        appendAllActions(transition, source)
        return transition

    def __gather_transitions(self):
        for i in range(0, len(self.source.transitions)):
            self.transitions[i] = self.__convert_transition(self.source.transitions[i])
            self.transitions[i].id = i

    def __gather_floating_labels(self):
        for src_label in self.source.content.floating_labels:
            dst_label = FloatingLabel()
            dst_label.name = src_label.inputString
            src_transition = src_label.transition
            if src_transition is not None:
                appendAllActions(dst_label, src_transition)
            self.floating_labels[dst_label.name] = dst_label
