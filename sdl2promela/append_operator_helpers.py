from typing import List, Union

from multipledispatch import dispatch

from sdl2promela import constants
from sdl2promela.sdl import model as sdlmodel
from sdl2promela.promela import model as promelamodel
from sdl2promela.promela import modelbuilder as promelabuilder


def flatten_sequenceof_parts(
    expression: sdlmodel.BinaryExpression,
) -> List[sdlmodel.Expression]:
    if (
        isinstance(expression, sdlmodel.BinaryExpression)
        and expression.operator == sdlmodel.BinaryOperator.APPEND
    ):
        return flatten_sequenceof_parts(expression.left) + flatten_sequenceof_parts(
            expression.right
        )
    return [expression]


def check_iterator_is_required(sources: List[type]) -> bool:
    return not all(part.kind == constants.SEQUENCEOF_TYPE_NAME for part in sources)


def check_seq_assignment_type_compatibility(
    destination: type, sources: List[type]
) -> bool:
    if destination.kind == constants.SEQUENCEOF_TYPE_NAME:
        return all(
            part.kind == constants.SEQUENCEOF_TYPE_NAME
            and part.type == destination.type
            for part in sources
        )
    if destination.kind in [
        constants.IA5_STRING_TYPE_NAME,
        constants.OCTET_STRING_TYPE_NAME,
        constants.BIT_STRING_TYPE_NAME,
    ]:
        return all(destination.kind == part.kind for part in sources)
    return False


def check_seq_append_requires_iterator(sources: List[sdlmodel.Expression]) -> bool:
    return not all(isinstance(part, sdlmodel.SequenceOf) for part in sources)


@dispatch(object, object)
def refers_to_same_entity(
    left: sdlmodel.Expression, right: sdlmodel.Expression
) -> bool:
    return False


@dispatch(sdlmodel.VariableReference, sdlmodel.VariableReference)
def refers_to_same_entity(
    left: sdlmodel.VariableReference, right: sdlmodel.VariableReference
) -> bool:
    return left.variableName == right.variableName


@dispatch(sdlmodel.ArrayAccess, sdlmodel.ArrayAccess)
def refers_to_same_entity(
    left: sdlmodel.ArrayAccess, right: sdlmodel.ArrayAccess
) -> bool:
    return refers_to_same_entity(left.array, right.array)


@dispatch(sdlmodel.MemberAccess, sdlmodel.MemberAccess)
def refers_to_same_entity(
    left: sdlmodel.MemberAccess, right: sdlmodel.MemberAccess
) -> bool:
    return refers_to_same_entity(left.sequence, right.sequence) and (
        left.member.variableName == right.member.variableName
    )


def create_increment_step(
    variable: promelamodel.VariableReference,
) -> promelamodel.Assignment:
    return (
        promelabuilder.AssignmentBuilder()
        .withTarget(variable)
        .withSource(
            promelabuilder.BinaryExpressionBuilder(promelamodel.BinaryOperator.ADD)
            .withLeft(variable)
            .withRight(promelamodel.IntegerValue(1))
            .build()
        )
        .build()
    )


def create_promela_length_member() -> promelamodel.VariableReference:
    return promelabuilder.VariableReferenceBuilder(
        constants.SEQUENCEOF_LENGTH_MEMBER_NAME
    ).build()


def create_sdl_length_member() -> sdlmodel.VariableReference:
    return sdlmodel.VariableReference(constants.SEQUENCEOF_LENGTH_MEMBER_NAME)


def create_promela_length_access(
    sequenceof: Union[
        promelamodel.VariableReference,
        promelamodel.MemberAccess,
        promelamodel.ArrayAccess,
    ]
) -> promelamodel.MemberAccess:
    return (
        promelabuilder.MemberAccessBuilder()
        .withUtypeReference(sequenceof)
        .withMember(create_promela_length_member())
        .build()
    )
