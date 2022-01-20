import typing
from typing import List
from multipledispatch import dispatch

from opengeode import ogAST
from opengeode.AdaGenerator import SEPARATOR

from .sdl import model as sdlmodel
from .promela import model as promelamodel
from .promela.modelbuilder import (
    AssignmentBuilder,
    CallBuilder,
    InlineBuilder,
    VariableDeclarationBuilder,
)
from .promela.modelbuilder import VariableReferenceBuilder
from .promela.modelbuilder import BlockBuilder
from .promela.modelbuilder import ModelBuilder
from .promela.modelbuilder import DoBuilder
from .promela.modelbuilder import BinaryExpressionBuilder
from .promela.modelbuilder import AlternativeBuilder
from .promela.modelbuilder import SwitchBuilder


from sdl2promela import promela

__TRANSITION_TYPE_NAME = "int"
__TRANSITION_ARGUMENT = "id"
__TRANSITION_ID = "transition_id"
__INVALID_ID = "-1"
__STATE_VARIABLE = "state"
__INIT = "init"
__STATES_SEPARATOR = "_States_"
__GLOBAL_STATE = "global_state"


def __get_transition_function_name(sdl_model: sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + "transition"


def __get_input_function_name(sdl_model: sdlmodel.Model, input: sdlmodel.Input) -> str:
    return sdl_model.process_name + SEPARATOR + "PI" + SEPARATOR + input.name


def __get_init_function_name(sdl_model: sdlmodel.Model) -> str:
    return sdl_model.process_name + SEPARATOR + __INIT


def __get_state_variable_name(sdl_model: sdlmodel.Model) -> str:
    return (
        __GLOBAL_STATE + "." + sdl_model.process_name.lower() + "." + __STATE_VARIABLE
    )


def __get_variable_name(
    sdl_model: sdlmodel.Model, variable_reference: sdlmodel.VariableReference
) -> str:
    return (
        __GLOBAL_STATE
        + "."
        + sdl_model.process_name.lower()
        + "."
        + variable_reference.variableName.lower()
    )


def __get_state_name(sdl_model: sdlmodel.Model, state: sdlmodel.State) -> str:
    return sdl_model.process_name + __STATES_SEPARATOR + state.name


def __get_remote_function_name(
    sdl_model: sdlmodel.Model, output: sdlmodel.Output
) -> str:
    return sdl_model.process_name + SEPARATOR + "RI" + SEPARATOR + output.name


def __generate_input_function(
    sdl_model: sdlmodel.Model, input: sdlmodel.Input
) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_input_function_name(sdl_model, input))
    for parameter in input.parameters:
        builder.withParameter(parameter.name)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    switch_builder = SwitchBuilder()

    state_variable_name = __get_state_variable_name(sdl_model)
    transition_function_name = __get_transition_function_name(sdl_model)

    for index, state in input.transitions.items():
        switch_builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder(state_variable_name).build())
                .withRight(
                    VariableReferenceBuilder(__get_state_name(sdl_model, state)).build()
                )
                .build()
            )
            .withStatements(
                [
                    CallBuilder()
                    .withTarget(transition_function_name)
                    .withParameter(VariableReferenceBuilder(str(index)).build())
                    .build()
                ]
            )
            .build()
        )

    switch_builder.withAlternative(
        AlternativeBuilder().withStatements([promelamodel.Break()]).build()
    )

    blockBuilder.withStatements([switch_builder.build()])
    builder.withDefinition(blockBuilder.build())
    return builder.build()


@dispatch
def __generate_statement(sdl_model, transition, action) -> promelamodel.Statement:
    raise NotImplementedError("generate_statement not implemented for " + action)


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.NextState)
def __generate_statement(
    sdl_model: sdlmodel.Model,
    transition: sdlmodel.Transition,
    next_state: sdlmodel.NextState,
) -> promelamodel.Statement:
    state_variable = __get_state_variable_name(sdl_model)
    state = sdl_model.states[next_state.state_name.lower()]
    state_name = __get_state_name(sdl_model, state)
    return (
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(state_variable).build())
        .withSource(VariableReferenceBuilder(state_name).build())
        .build()
    )


@dispatch(sdlmodel.Model, sdlmodel.Transition, sdlmodel.Output)
def __generate_statement(
    sdl_model: sdlmodel.Model, transition: sdlmodel.Transition, output: sdlmodel.Output
) -> promelamodel.Statement:
    name = __get_remote_function_name(sdl_model, output)
    if len(output.parameters) == 0:
        return CallBuilder().withTarget(name).build()
    else:
        parameter_name = __get_variable_name(sdl_model, output.parameters[0])
        return (
            CallBuilder()
            .withTarget(name)
            .withParameter(VariableReferenceBuilder(parameter_name).build())
            .build()
        )


def __generate_transition(
    sdl_model: sdlmodel.Model, transition: sdlmodel.Transition
) -> List[promelamodel.Statement]:
    statements = []
    for action in transition.actions:
        statements.append(__generate_statement(sdl_model, transition, action))

    # TODO - this should be conditional
    statements.append(
        AssignmentBuilder()
        .withTarget(VariableReferenceBuilder(__TRANSITION_ID).build())
        .withSource(VariableReferenceBuilder(__INVALID_ID).build())
        .build()
    )

    return statements


def __generate_init_function(sdl_model: sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_init_function_name(sdl_model))
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)
    transition_function_name = __get_transition_function_name(sdl_model)
    blockBuilder.withStatements(
        [
            CallBuilder()
            .withTarget(transition_function_name)
            .withParameter(VariableReferenceBuilder(str(0)).build())
            .build()
        ]
    )
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def __generate_transition_function(sdl_model: sdlmodel.Model) -> promelamodel.Inline:
    builder = InlineBuilder()
    builder.withName(__get_transition_function_name(sdl_model))
    builder.withParameter(__TRANSITION_ARGUMENT)
    blockBuilder = BlockBuilder(promelamodel.BlockType.BLOCK)

    do_builder = DoBuilder()

    do_builder.withAlternative(
        AlternativeBuilder()
        .withCondition(
            BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
            .withLeft(VariableReferenceBuilder(__TRANSITION_ID).build())
            .withRight(VariableReferenceBuilder(__INVALID_ID).build())
            .build()
        )
        .withStatements([promelamodel.Break()])
        .build()
    )

    for id, transition in sdl_model.transitions.items():
        do_builder.withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(promelamodel.BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder(__TRANSITION_ID).build())
                .withRight(VariableReferenceBuilder(str(id)).build())
                .build()
            )
            .withStatements(__generate_transition(sdl_model, transition))
            .build()
        )

    blockBuilder.withStatements(
        [
            VariableDeclarationBuilder(__TRANSITION_ID, __TRANSITION_TYPE_NAME).build(),
            AssignmentBuilder()
            .withTarget(VariableReferenceBuilder(__TRANSITION_ID).build())
            .withSource(VariableReferenceBuilder(__TRANSITION_ARGUMENT).build())
            .build(),
            do_builder.build(),
        ]
    )
    builder.withDefinition(blockBuilder.build())
    return builder.build()


def translate(sdl_model: sdlmodel.Model) -> promelamodel.Model:
    """
    Translate an SDL model into a Promela model.
    :param sdl_model: SDL model to be translated.
    :returns: Promela model.
    """
    builder = ModelBuilder()
    builder.withInline(__generate_transition_function(sdl_model))
    builder.withInline(__generate_init_function(sdl_model))
    for name, input in sdl_model.inputs.items():
        builder.withInline(__generate_input_function(sdl_model, input))
    model = builder.build()
    return model
