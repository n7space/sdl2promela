from multipledispatch import dispatch
from typing import List, Set, Text, Tuple, Type, TextIO

from . import model
from sdl2promela import promela

INDENT = "  "
"""A unit of indent."""


class Context:
    """Promela file generator context."""

    stream: TextIO
    """Output stream."""
    indents: List[str]
    """Stack of indents."""
    pending_indent: bool
    """Whether there is a pending indent."""
    parents: List[model.Statement]
    """Stack of parents."""

    def __init__(self, stream: TextIO):
        self.parents = []
        self.stream = stream
        self.indents = []
        self.pending_indent = False

    def __print(self, data: str):
        print(data, file=self.stream, end="")

    def __indent(self):
        self.__print(self.__get_indent())
        self.pending_indent = False

    def __get_indent(self) -> str:
        return "".join((self.indents))

    def push_parent(self, parent: model.Statement):
        """
        Push parent onto the parent stack.
        :param parent: Parent to be pushed.
        """
        self.parents.append(parent)

    def pop_parent(self):
        """
        Remove the current parent from the stack.
        """
        self.parents.pop()

    def get_parent(self) -> model.Statement:
        """
        Return the current parent statement.
        :returns: Current parent statement.
        """
        return self.parents[-1]

    def push_indent(self, indent: str):
        """
        Increase indent by the given unit.
        :param indent: Unit of indent by which to increase the total indent.
        """
        self.indents.append(indent)

    def pop_indent(self):
        """
        Decrease indent.
        """
        self.indents.pop()

    def output(self, data: str):
        """
        Write the data to the output stream, applying the indent.
        :param data: Data to be written (may consist of several lines).
        """
        if self.pending_indent:
            self.__indent()
        lines = data.splitlines(keepends=True)
        if len(lines) == 0:
            return
        for line in lines[:-1]:
            self.__print(line)
            if line.endswith("\n"):
                self.__indent()
        self.__print(lines[-1])
        self.pending_indent = lines[-1].endswith("\n")


@dispatch
def generate(context, element):
    """
    Generate output for the given element, using the given context.
    :param context: Generator context.
    :param element: Element to generate output for.
    """
    raise NotImplementedError("generate() not implemented for " + element)


@dispatch(Context, model.BinaryExpression)
def generate(context: Context, expression: model.BinaryExpression):
    if not expression.skip_parentheses:
        context.output("(")
    generate(context, expression.left)
    if expression.operator == model.BinaryOperator.ADD:
        context.output(" + ")
    elif expression.operator == model.BinaryOperator.SUBTRACT:
        context.output(" - ")
    elif expression.operator == model.BinaryOperator.MULTIPLY:
        context.output(" * ")
    elif expression.operator == model.BinaryOperator.DIVIDE:
        context.output(" / ")
    elif expression.operator == model.BinaryOperator.EQUAL:
        context.output(" == ")
    elif expression.operator == model.BinaryOperator.LESS:
        context.output(" < ")
    elif expression.operator == model.BinaryOperator.GREATER:
        context.output(" > ")
    elif expression.operator == model.BinaryOperator.LEQUAL:
        context.output(" <= ")
    elif expression.operator == model.BinaryOperator.GEQUAL:
        context.output(" >= ")
    elif expression.operator == model.BinaryOperator.MODULO:
        context.output(" % ")
    elif expression.operator == model.BinaryOperator.NEQUAL:
        context.output(" != ")
    elif expression.operator == model.BinaryOperator.AND:
        context.output(" && ")
    elif expression.operator == model.BinaryOperator.OR:
        context.output(" || ")
    elif expression.operator == model.BinaryOperator.XOR:
        context.output(" ^ ")
    generate(context, expression.right)
    if not expression.skip_parentheses:
        context.output(")")


@dispatch(Context, model.Label)
def generate(context: Context, label: model.Label):
    context.output(f"{label.name}: \n")


@dispatch(Context, model.GoTo)
def generate(context: Context, goto: model.GoTo):
    context.output(f"goto {goto.target}")


@dispatch(Context, model.UnaryExpression)
def generate(context: Context, expression: model.UnaryExpression):
    context.output("(")
    if expression.operator == model.UnaryOperator.NOT:
        context.output("! ")
    if expression.operator == model.UnaryOperator.NEGATIVE:
        context.output("- ")
    generate(context, expression.expression)
    context.output(")")


@dispatch(Context, model.ConditionalExpression)
def generate(context: Context, expression: model.ConditionalExpression):
    context.output("(")
    generate(context, expression.condition)
    context.output(" -> ")
    generate(context, expression.trueExpression)
    context.output(" : ")
    generate(context, expression.falseExpression)
    context.output(")")


@dispatch(Context, model.Call)
def generate(context: Context, call: model.Call):
    context.output(call.target)
    context.output("(")
    last_index = len(call.parameters) - 1
    for i in range(0, len(call.parameters)):
        generate(context, call.parameters[i])
        if i != last_index:
            context.output(", ")
    context.output(")")


@dispatch(Context, model.Assert)
def generate(context: Context, assertStatement: model.Assert):
    context.output("assert")
    context.output("(")
    generate(context, assertStatement.expression)
    context.output(")")


@dispatch(Context, model.IntegerValue)
def generate(context: Context, integerValue: model.IntegerValue):
    context.output(str(integerValue.value))


@dispatch(Context, model.FloatValue)
def generate(context: Context, floatValue: model.FloatValue):
    context.output(str(floatValue.value))


@dispatch(Context, model.BooleanValue)
def generate(context: Context, booleanValue: model.BooleanValue):
    if booleanValue.value:
        context.output("true")
    else:
        context.output("false")


@dispatch(Context, model.StringValue)
def generate(context: Context, stringValue: model.StringValue):
    context.output(f'"{stringValue.value}"')


@dispatch(Context, model.Parentheses)
def generate(context: Context, parentheses: model.Parentheses):
    context.output("(")
    generate(context, parentheses.expression)
    context.output(")")


@dispatch(Context, model.ArrayAccess)
def generate(context: Context, arrayAccess: model.ArrayAccess):
    generate(context, arrayAccess.variable)
    context.output("[")
    generate(context, arrayAccess.index)
    context.output("]")


@dispatch(Context, model.MemberAccess)
def generate(context: Context, memberAccess: model.MemberAccess):
    generate(context, memberAccess.utype)
    context.output(".")
    generate(context, memberAccess.member)


@dispatch(Context, model.VariableDeclaration)
def generate(context: Context, declaration: model.VariableDeclaration):
    context.output(declaration.type)
    context.output(" ")
    context.output(declaration.name)


@dispatch(Context, model.VariableReference)
def generate(context: Context, reference: model.VariableReference):
    context.output(reference.name)


@dispatch(Context, model.Assignment)
def generate(context: Context, assignment: model.Assignment):
    generate(context, assignment.target)
    context.output(" = ")
    generate(context, assignment.source)


@dispatch(Context, model.Printf)
def generate(context: Context, printf: model.Printf):
    context.output("printf(")
    last_index = len(printf.parameters) - 1
    for i in range(0, len(printf.parameters)):
        generate(context, printf.parameters[i])
        if i != last_index:
            context.output(", ")
    context.output(")")


@dispatch(Context, model.Block)
def generate(context: Context, block: model.Block):
    if block.type == model.BlockType.ATOMIC:
        context.output("atomic {\n")
    else:
        context.output("{\n")
    context.push_indent(INDENT)
    context.push_parent(block)
    generate(context, model.StatementsWrapper(block.statements))
    context.pop_parent()
    context.pop_indent()
    context.output("}\n")


def __requires_statement_separator(statement):
    if isinstance(statement, model.StatementsWrapper):
        return False
    if isinstance(statement, model.Label):
        return False
    if isinstance(statement, model.Block):
        return False
    return True


@dispatch(Context, model.StatementsWrapper)
def generate(context: Context, wrapper: model.StatementsWrapper):
    for statement in wrapper.statements:
        if statement is not None:
            generate(context, statement)
            # Avoid multiple ";" for nested statement wrappers
            if __requires_statement_separator(statement):
                context.output(";\n")


@dispatch(Context, model.Do)
def generate(context: Context, do: model.Do):
    context.output("do\n")
    context.push_parent(do)
    for alternative in do.alternatives:
        generate(context, alternative)
    context.pop_parent()
    context.output("od")


@dispatch(Context, model.ForLoop)
def generate(context: Context, loop: model.ForLoop):
    context.output("for(")
    generate(context, loop.iterator)
    context.output(" : ")
    if isinstance(loop.first, int):
        context.output(str(loop.first))
    else:
        generate(context, loop.first)
    context.output(" .. ")
    if isinstance(loop.last, int):
        context.output(str(loop.last))
    else:
        generate(context, loop.last)
    context.output(")\n")

    context.output("{\n")
    context.push_indent(INDENT)
    context.push_parent(loop)
    generate(context, model.StatementsWrapper(loop.body))
    context.pop_parent()
    context.pop_indent()
    context.output("}")


@dispatch(Context, model.Switch)
def generate(context: Context, switch: model.Switch):
    context.output("if\n")
    context.push_parent(switch)
    for alternative in switch.alternatives:
        generate(context, alternative)
    context.pop_parent()
    context.output("fi")


@dispatch(Context, model.Alternative)
def generate(context: Context, alternative: model.Alternative):
    context.output("::")
    if alternative.type == model.BlockType.ATOMIC:
        context.output(" atomic {\n")
        context.push_indent(INDENT)
    parent = context.get_parent()
    pure_do = (
        isinstance(parent, model.Do)
        and len(parent.alternatives) == 1
        and parent.alternatives[0].condition is None
    )
    if not pure_do:
        if alternative.condition is None:
            context.output("else")
        else:
            generate(context, alternative.condition)
        context.output("->\n")
    context.push_indent(INDENT)
    generate(context, model.StatementsWrapper(alternative.definition))
    if alternative.type == model.BlockType.ATOMIC:
        context.pop_indent()
        context.output("}\n")

    context.pop_indent()


@dispatch(Context, model.Skip)
def generate(context: Context, skip: model.Skip):
    context.output("skip")


@dispatch(Context, model.Break)
def generate(context: Context, brk: model.Break):
    context.output("break")


@dispatch(Context, model.InlineParameter)
def generate(context: Context, parameter: model.InlineParameter):
    context.output(parameter.name)


@dispatch(Context, model.Inline)
def generate(context: Context, inline: model.Inline):
    context.output("inline ")
    context.output(inline.name)
    context.output("(")
    last_index = len(inline.parameters) - 1
    for i in range(0, len(inline.parameters)):
        generate(context, inline.parameters[i])
        if i != last_index:
            context.output(", ")
    context.output(")\n")
    generate(context, inline.definition)


@dispatch(Context, model.NeverClaim)
def generate(context: Context, never: model.NeverClaim):
    context.output("never")
    generate(context, never.definition)


@dispatch(Context, model.Model)
def generate(context: Context, model: model.Model):
    context.output(model.prologue)
    for variable_declaration in model.variable_declarations:
        generate(context, variable_declaration)
        # Declaration can be also used as left for an assignment, so it is not terminated
        context.output(";\n")
    for inline in model.inlines:
        generate(context, inline)
    if model.never:
        generate(context, model.never)
    context.output(model.epilogue)


def generate_model(model: model.Model, output: TextIO):
    """
    Serialize the given Promela model to the output stream.
    :param model: Model to be serialized.
    :param output: Output stream to serialize the model to.
    """
    context = Context(output)
    generate(context, model)
    output.seek(0)
