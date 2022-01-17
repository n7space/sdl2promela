from typing import List, Dict
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


class Parameter:
    """Parameter for a signal or procedure."""

    name: str
    """Parameter name."""

    def __init__(self):
        self.name = None


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


class Expression:
    """Base class for expressions."""

    pass


class Constant(Expression):
    """Constant value."""

    value: str
    """Constant value ."""


class VariableReference(Expression):
    """Variable reference."""

    variableName: str
    """Variable name."""


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
    PLUS = 6
    """+"""
    MINUS = 7
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


class Action:
    """Base class for a transition action."""

    pass


class Task(Action):
    """Task action."""

    pass


class AssignmentTask(Task):
    """Assignment action."""

    assignment: BinaryExpression
    """Assignment expression"""


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
    if source.terminators is not None:
        for terminator in source.terminators:
            action = convert(terminator)
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


@dispatch(str)
def getBinaryOperatorEnum(op: str) -> BinaryOperator:
    if op == "+":
        return BinaryOperator.PLUS
    elif op == "*":
        return BinaryOperator.MUL
    elif op == "-":
        return BinaryOperator.MINUS
    elif op == "=":
        return BinaryOperator.EQUAL
    elif op == "/=":
        return BinaryOperator.NEQUAL
    elif op == ">":
        return BinaryOperator.GREATER
    elif op == ">=":
        return BinaryOperator.GEQUAL
    elif op == "<":
        return BinaryOperator.LESS
    elif op == "<=":
        return BinaryOperator.LEQUAL
    elif op == "/":
        return BinaryOperator.DIV
    elif op.lower() == "mod":
        return BinaryOperator.MOD
    elif op.lower() == "rem":
        return BinaryOperator.REM
    elif op == ":=":
        return BinaryOperator.ASSIGN
    else:
        raise ValueError("Unsupported operator: " + op)


@dispatch(type)
def getBinaryOperatorEnum(op: type) -> BinaryOperator:
    if op == ogAST.ExprPlus:
        return BinaryOperator.PLUS
    elif op == ogAST.ExprMul:
        return BinaryOperator.MUL
    elif op == ogAST.ExprMinus:
        return BinaryOperator.MINUS
    elif op == ogAST.ExprEq:
        return BinaryOperator.EQUAL
    elif op == ogAST.ExprNeq:
        return BinaryOperator.NEQUAL
    elif op == ogAST.ExprGt:
        return BinaryOperator.GREATER
    elif op == ogAST.ExprGe:
        return BinaryOperator.GEQUAL
    elif op == ogAST.ExprLt:
        return BinaryOperator.LESS
    elif op == ogAST.ExprLe:
        return BinaryOperator.LEQUAL
    elif op == ogAST.ExprDiv:
        return BinaryOperator.DIV
    elif op == ogAST.ExprMod:
        return BinaryOperator.MOD
    elif op == ogAST.ExprRem:
        return BinaryOperator.REM
    elif op == ogAST.ExprAssign:
        return BinaryOperator.ASSIGN
    else:
        raise ValueError("Unsupported operator: " + op.__name__)


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


@dispatch(ogAST.TaskAssign)
def convert(source: ogAST.TaskAssign):
    if len(source.elems) != 1:
        raise ValueError(
            "Assignment with an unsupported number of elements: " + len(source.elems)
        )
    task = AssignmentTask()
    task.assignment = convert(source.elems[0])
    return task


@dispatch(ogAST.PrimVariable)
def convert(source: ogAST.PrimVariable):
    variableReference = VariableReference()
    variableReference.variableName = source.inputString
    return variableReference


@dispatch(ogAST.PrimInteger)
def convert(source: ogAST.PrimInteger):
    constant = Constant()
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        constant.value = source.value[0]
    else:
        constant.value = source.value
    return constant


@dispatch(ogAST.PrimBoolean)
def convert(source: ogAST.PrimBoolean):
    constant = Constant()
    if isinstance(source.value, list):
        if len(source.value) != 1:
            raise ValueError(
                "Source value is an array with an unsupported number of elements: "
                + len(source.value)
            )
        constant.value = source.value[0]
    else:
        constant.value = source.value
    return constant


@dispatch(ogAST.ExprPlus)
def convert(source: ogAST.ExprPlus):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprMul)
def convert(source: ogAST.ExprMul):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprMinus)
def convert(source: ogAST.ExprMinus):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprEq)
def convert(source: ogAST.ExprEq):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprNeq)
def convert(source: ogAST.ExprNeq):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprGt)
def convert(source: ogAST.ExprGt):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprGe)
def convert(source: ogAST.ExprGe):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprLt)
def convert(source: ogAST.ExprLt):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprLe)
def convert(source: ogAST.ExprLe):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprDiv)
def convert(source: ogAST.ExprDiv):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprMod)
def convert(source: ogAST.ExprMod):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprRem)
def convert(source: ogAST.ExprRem):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
    return expression


@dispatch(ogAST.ExprAssign)
def convert(source: ogAST.ExprAssign):
    expression = BinaryExpression()
    expression.left = convert(source.left)
    expression.operator = getBinaryOperatorEnum(source.operand)
    expression.right = convert(source.right)
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
        if source.question != None:
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

    def __init__(self, process: ogAST.Process):
        self.source = process
        Helper.flatten(process, sep=SEPARATOR)
        self.process_name = process.processName
        self.floating_labels = {}
        self.states = {}
        self.inputs = {}
        self.transitions = {}
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
            parameter = Parameter()
            parameter.name = parameterName
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
            # TODO - adjust for multiple inputs in inputString
            for input in input_list:
                id = input.transition_id
                for singleInput in input.inputlist:
                    trigger = self.inputs[singleInput]
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
