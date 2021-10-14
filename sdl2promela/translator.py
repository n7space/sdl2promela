import typing
from typing import List
from multipledispatch import dispatch

from opengeode import ogAST
from opengeode.AdaGenerator import SEPARATOR

from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .promela.modelbuilder import AssignmentBuilder, CallBuilder, InlineBuilder
from .promela.modelbuilder import VariableReferenceBuilder
from .promela.modelbuilder import BlockBuilder
from .promela.modelbuilder import ModelBuilder
from .promela.modelbuilder import DoBuilder
from .promela.modelbuilder import BinaryExpressionBuilder
from .promela.modelbuilder import AlternativeBuilder
from .promela.modelbuilder import SwitchBuilder


from sdl2promela import promela

TRANSITION_ID = "transition_id"
INVALID_ID = "-1"
STATE_VARIABLE = "state"
INIT = "init"

def get_transition_function_name(sdl_model : sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + "transition"

def get_input_function_name(sdl_model : sdlmodel.Model, input : sdlmodel.Input) -> str:
    return sdl_model.process_name + SEPARATOR + "PI" + SEPARATOR + input.name

def get_init_function_name(sdl_model : sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + INIT

def get_state_variable_name(sdl_model : sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + STATE_VARIABLE

def get_state_name(sdl_model : sdlmodel.Model, state : sdlmodel.State) -> str:
    return sdl_model.process_name + SEPARATOR + state.name

def generate_input_function(sdl_model : sdlmodel.Model, input : sdlmodel.Input) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(get_input_function_name(sdl_model, input))
    for parameter in input.parameters:
        builder.withParameter(parameter.name)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    switch_builder = SwitchBuilder()

    state_variable_name = get_state_variable_name(sdl_model)
    transition_function_name = get_transition_function_name(sdl_model)

    for index, state in input.transitions.items():
        switch_builder.withAlternative(AlternativeBuilder() \
            .withCondition(BinaryExpressionBuilder( \
                promelamodel.BinaryOperator.EQUAL) \
                    .withLeft(VariableReferenceBuilder(state_variable_name).build()) \
                    .withRight(VariableReferenceBuilder(get_state_name(sdl_model, state)).build()).build()) \
            .withStatements([ \
                CallBuilder() \
                    .withTarget(transition_function_name) \
                    .withParameter(VariableReferenceBuilder(str(index)).build()).build() \
            ]).build())

    switch_builder.withAlternative(AlternativeBuilder() \
        .withStatements([promelamodel.Break()]).build())

    blockBuilder.withStatements([switch_builder.build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()

@dispatch
def generate_statement(sdl_model, transition, action) -> promelamodel.Statement:
    raise NotImplementedError("generate_statement not implemented for " + action)

@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.NextState)
def generate_statement(sdl_model : sdlmodel.Model, transition : sdlmodel.Transition, next_state : sdlmodel.NextState) -> promelamodel.Statement:
    state_variable = get_state_variable_name(sdl_model)
    state = sdl_model.states[next_state.state_name]
    state_name = get_state_name(sdl_model, state)
    return AssignmentBuilder() \
            .withTarget(VariableReferenceBuilder(state_variable).build()) \
            .withSource(VariableReferenceBuilder(state_name).build()) \
            .build()

def generate_transition(sdl_model : sdlmodel.Model, transition : sdlmodel.Transition) -> List[promelamodel.Statement]:
    statements = []
    for action in transition.actions:
        statements.append(generate_statement(sdl_model, transition, action))

    # TODO - this should be conditional
    statements.append(AssignmentBuilder() \
            .withTarget(VariableReferenceBuilder(TRANSITION_ID).build()) \
            .withSource(VariableReferenceBuilder(INVALID_ID).build()) \
            .build())            

    return statements

def generate_init_function(sdl_model : sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(get_init_function_name(sdl_model))    
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    transition_function_name = get_transition_function_name(sdl_model)                
    blockBuilder.withStatements([CallBuilder() \
                    .withTarget(transition_function_name) \
                    .withParameter(VariableReferenceBuilder(str(0)).build()).build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()

def generate_transition_function(sdl_model : sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(get_transition_function_name(sdl_model))    
    builder.withParameter(TRANSITION_ID)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    do_builder = DoBuilder()

    do_builder.withAlternative(AlternativeBuilder() \
        .withCondition(BinaryExpressionBuilder( \
            promelamodel.BinaryOperator.EQUAL) \
                .withLeft(VariableReferenceBuilder(TRANSITION_ID).build()) \
                .withRight(VariableReferenceBuilder(INVALID_ID).build()).build()) \
        .withStatements([promelamodel.Break()]).build())

    for id, transition in sdl_model.transitions.items():
        do_builder.withAlternative(AlternativeBuilder() \
            .withCondition(BinaryExpressionBuilder( \
                promelamodel.BinaryOperator.EQUAL) \
                    .withLeft(VariableReferenceBuilder(TRANSITION_ID).build()) \
                    .withRight(VariableReferenceBuilder(str(id)).build()).build()) \
            .withStatements(generate_transition(sdl_model, transition)).build())

    blockBuilder.withStatements([do_builder.build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()

def translate(sdl_model : sdlmodel.Model) -> promelamodel.Model:
    builder = ModelBuilder()
    builder.withInline(generate_transition_function(sdl_model))
    builder.withInline(generate_init_function(sdl_model))
    for name, input in sdl_model.inputs.items():
        builder.withInline(generate_input_function(sdl_model, input))
    model = builder.build()
    return model
