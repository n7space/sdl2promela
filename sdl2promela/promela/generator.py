from multipledispatch import dispatch
from typing import List, Set, Text, Tuple, Type, TextIO

import model


class Context:
    stream : TextIO

    def __init__(self, stream : TextIO):
        self.stream = stream

    def output(self, data : str):
        print(data, file=self.stream)

@dispatch
def generate(context, element):
    raise NotImplementedError("generate() not implemented for " + element)

@dispatch(Context, model.Expression)
def generate(context : Context, expression : model.Expression):
    context.output(expression.definition)

@dispatch(Context, model.AtomicBlock)
def generate(context : Context, block : model.AtomicBlock):
    context.output("atomic {\n")
    generate(context, block.statements)    
    context.output("}\n")

@dispatch(Context, model.Block)
def generate(context : Context, block : model.Block):
    context.output("{\n")
    generate(context, block.statements)    
    context.output("}\n")

@dispatch(Context, List[model.Alternative])
def generate(context : Context, statements : List[model.Alternative]):        
    for i in range(0, len(statements)):    
        generate(context, statements[i])        
        context.output(";\n")

@dispatch(Context, model.Do)
def generate(context : Context, do : model.Do):
    context.output("do\n")
    for alternative in do.alternatives:
        generate(context, alternative)
    context.output("od\n")

@dispatch(Context, model.Switch)
def generate(context : Context, switch : model.Switch):
    context.output("if\n")
    for alternative in switch.alternatives:
        generate(context, alternative)
    context.output("fi\n")

@dispatch(Context, model.Alternative)
def generate(context : Context, alternative : model.Alternative):
    context.output("::")
    if alternative.condition is None:
        context.output("else")
    else:
        generate(context, alternative.condition)
    context.output("->\n")
    generate(context, alternative.definition)    

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
        generate(context, inline.parameter[i])
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

def generateModel(model : model.Model, output : TextIO):
    context = Context(output)
    generate(context, model)
