from multipledispatch import dispatch
from typing import List, Set, Text, Tuple, Type, TextIO

from . import model

INDENT = "  "

class Context:
    stream : TextIO
    indents : List[str]
    pending_indent : bool

    def __init__(self, stream : TextIO):
        self.stream = stream
        self.indents = []
        self.pending_indent = False

    def _print(self, data : str):
        print(data, file=self.stream, end='')

    def _indent(self):
        self._print(self._get_indent())
        self.pending_indent = False

    def _get_indent(self):
        return "".join((self.indents))

    def push_indent(self, indent : str):
        self.indents.append(indent)

    def pop_indent(self):
        self.indents.pop()

    def output(self, data : str):
        if self.pending_indent:
            self._indent()
        lines = data.splitlines(keepends=True)
        if len(lines) == 0:
            return
        for line in lines[:-1]:
            self._print(line)
            if line.endswith("\n"):
                self._indent()
        self._print(lines[-1])
        self.pending_indent = lines[-1].endswith("\n")

class StatementsWrapper:
    statements : List[model.Statement]

    def __init__(self, statements : List[model.Statement]):
        self.statements = statements

@dispatch
def generate(context, element):
    raise NotImplementedError("generate() not implemented for " + element)

@dispatch(Context, model.BinaryExpression)
def generate(context : Context, expression : model.BinaryExpression):
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
    generate(context, expression.right)
    context.output(")")

@dispatch(Context, model.Call)
def generate(context : Context, call : model.Call):
    context.output(call.target)
    context.output("(")
    last_index = len(call.parameters) -1
    for i in range(0, len(call.parameters)):
        generate(context, call.parameters[i])
        if i != last_index:
            context.output(", ")
    context.output(")")

@dispatch(Context, model.VariableDeclaration)
def generate(context : Context, declaration : model.VariableDeclaration):
    context.output(declaration.type)
    context.output(" ")
    context.output(declaration.name)

@dispatch(Context, model.VariableReference)
def generate(context : Context, reference : model.VariableReference):
    context.output(reference.name)

@dispatch(Context, model.Assignment)
def generate(context : Context, assignment : model.Assignment):
    generate(context, assignment.target)
    context.output(" = ")
    generate(context, assignment.source)

@dispatch(Context, model.Block)
def generate(context : Context, block : model.Block):
    if block.type == model.BlockType.ATOMIC:
        context.output("atomic {\n")
    else:
        context.output("{\n")
    context.push_indent(INDENT)
    generate(context, StatementsWrapper(block.statements))
    context.pop_indent()
    context.output("}\n")

@dispatch(Context, StatementsWrapper)
def generate(context : Context, wrapper : StatementsWrapper):
    for i in range(0, len(wrapper.statements)):
        generate(context, wrapper.statements[i])
        context.output(";\n")

@dispatch(Context, model.Do)
def generate(context : Context, do : model.Do):
    context.output("do\n")
    for alternative in do.alternatives:
        generate(context, alternative)
    context.output("od")

@dispatch(Context, model.Switch)
def generate(context : Context, switch : model.Switch):
    context.output("if\n")
    for alternative in switch.alternatives:
        generate(context, alternative)
    context.output("fi")

@dispatch(Context, model.Alternative)
def generate(context : Context, alternative : model.Alternative):
    context.output("::")
    if alternative.condition is None:
        context.output("else")
    else:
        generate(context, alternative.condition)
    context.output("->\n")
    context.push_indent(INDENT)
    generate(context, StatementsWrapper(alternative.definition))
    context.pop_indent()

@dispatch(Context, model.Skip)
def generate(context : Context, skip : model.Skip):
    context.output("skip")

@dispatch(Context, model.Break)
def generate(context : Context, brk : model.Break):
    context.output("break")

@dispatch(Context, model.InlineParameter)
def generate(context : Context, parameter : model.InlineParameter):
    context.output(parameter.name)

@dispatch(Context, model.Inline)
def generate(context : Context, inline : model.Inline):
    context.output("inline ")
    context.output(inline.name)
    context.output("(")
    last_index = len(inline.parameters) -1
    for i in range(0, len(inline.parameters)):
        generate(context, inline.parameters[i])
        if i != last_index:
            context.output(", ")
    context.output(")\n")
    generate(context, inline.definition)

@dispatch(Context, model.Model)
def generate(context : Context, model : model.Model):
    context.output(model.prologue)
    for inline in model.inlines:
        generate(context, inline)
    context.output(model.epilogue)

def generate_model(model : model.Model, output : TextIO):
    context = Context(output)
    generate(context, model)
    output.seek(0)
