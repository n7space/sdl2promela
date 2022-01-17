from sdl2promela.promela.model import Model
from sdl2promela.promela.model import Skip, IntegerValue, FloatValue, BooleanValue
from sdl2promela.promela.generator import generate_model
from sdl2promela.promela.modelbuilder import *
import os
import io
from tests.utils.utils import assert_lines_match

TEST_DIR: str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR: str = os.path.join(TEST_DIR, "resources")


def read_reference(path: str):
    return io.open(os.path.join(RESOURCE_DIR, path)).readlines()


def generate_and_verify(model: Model, path_to_reference: str):
    stream = io.StringIO()
    generate_model(model, stream)
    result = stream.readlines()
    reference = read_reference(path_to_reference)
    assert_lines_match(result, reference)


def test_inline():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withParameter("a")
            .withParameter("b")
            .withDefinition(BlockBuilder(BlockType.BLOCK).build())
            .build()
        )
        .build()
    )

    generate_and_verify(model, "inline.pml")


def test_declaration():
    declaration = VariableDeclarationBuilder("id", "int").build()
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK).withStatements([declaration]).build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "declaration.pml")


def test_do():
    do = (
        DoBuilder()
        .withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder("state").build())
                .withRight(VariableReferenceBuilder("idle").build())
                .build()
            )
            .withStatements([Skip()])
            .build()
        )
        .withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(BinaryOperator.EQUAL)
                .withLeft(VariableReferenceBuilder("state").build())
                .withRight(VariableReferenceBuilder("running").build())
                .build()
            )
            .withStatements([Skip()])
            .build()
        )
        .build()
    )
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(BlockBuilder(BlockType.BLOCK).withStatements([do]).build())
            .build()
        )
        .build()
    )

    generate_and_verify(model, "do.pml")


def test_switch():
    switch = (
        SwitchBuilder()
        .withAlternative(
            AlternativeBuilder()
            .withCondition(
                BinaryExpressionBuilder(BinaryOperator.GREATER)
                .withLeft(VariableReferenceBuilder("a").build())
                .withRight(VariableReferenceBuilder("threshold").build())
                .build()
            )
            .withStatements([Skip()])
            .build()
        )
        .withAlternative(AlternativeBuilder().withStatements([Skip()]).build())
        .build()
    )
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK).withStatements([switch]).build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "switch.pml")


def test_binary_operators():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.ADD)
                            .withLeft(VariableReferenceBuilder("5").build())
                            .withRight(VariableReferenceBuilder("6").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("b").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.MULTIPLY)
                            .withLeft(VariableReferenceBuilder("a").build())
                            .withRight(VariableReferenceBuilder("3").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("c").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.SUBTRACT)
                            .withLeft(VariableReferenceBuilder("a").build())
                            .withRight(VariableReferenceBuilder("b").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("d").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.DIVIDE)
                            .withLeft(VariableReferenceBuilder("c").build())
                            .withRight(VariableReferenceBuilder("2").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("d").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.MODULO)
                            .withLeft(VariableReferenceBuilder("c").build())
                            .withRight(VariableReferenceBuilder("2").build())
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "binary_operators.pml")


def test_comparision_operators():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.EQUAL)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.NEQUAL)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.LESS)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.LEQUAL)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.GREATER)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            BinaryExpressionBuilder(BinaryOperator.GEQUAL)
                            .withLeft(VariableReferenceBuilder("b").build())
                            .withRight(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "comparision_operators.pml")


def test_unary_operators():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            UnaryExpressionBuilder(UnaryOperator.NOT)
                            .withExpression(VariableReferenceBuilder("b").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("c").build())
                        .withSource(
                            UnaryExpressionBuilder(UnaryOperator.NEGATIVE)
                            .withExpression(VariableReferenceBuilder("d").build())
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "unary_operators.pml")


def test_values():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(IntegerValue(0))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(IntegerValue(-65536))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(IntegerValue(65536))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("x").build())
                        .withSource(FloatValue(0.0))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("x").build())
                        .withSource(FloatValue(-5.5))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("x").build())
                        .withSource(FloatValue(5.5))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("b").build())
                        .withSource(BooleanValue(True))
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("b").build())
                        .withSource(BooleanValue(False))
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "values.pml")


def test_simple_array_access():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            ArrayAccessBuilder()
                            .withArray(VariableReferenceBuilder("b").build())
                            .withIndex(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            ArrayAccessBuilder()
                            .withArray(VariableReferenceBuilder("b").build())
                            .withIndex(
                                BinaryExpressionBuilder(BinaryOperator.ADD)
                                .withLeft(IntegerValue(1))
                                .withRight(IntegerValue(1))
                                .build()
                            )
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "simple_array_access.pml")


def test_simple_mtype_access():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            MtypeAccessBuilder()
                            .withMtype(VariableReferenceBuilder("b").build())
                            .withField(VariableReferenceBuilder("c").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            MtypeAccessBuilder()
                            .withMtype(
                                MtypeAccessBuilder()
                                .withMtype(VariableReferenceBuilder("b").build())
                                .withField(VariableReferenceBuilder("c").build())
                                .build()
                            )
                            .withField(VariableReferenceBuilder("d").build())
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "simple_mtype_access.pml")


def test_complex_array_and_mtype_access():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            MtypeAccessBuilder()
                            .withMtype(
                                ArrayAccessBuilder()
                                .withArray(VariableReferenceBuilder("b").build())
                                .withIndex(IntegerValue(0))
                                .build()
                            )
                            .withField(VariableReferenceBuilder("d").build())
                            .build()
                        )
                        .build(),
                        AssignmentBuilder()
                        .withTarget(VariableReferenceBuilder("a").build())
                        .withSource(
                            ArrayAccessBuilder()
                            .withArray(
                                MtypeAccessBuilder()
                                .withMtype(
                                    MtypeAccessBuilder()
                                    .withMtype(
                                        ArrayAccessBuilder()
                                        .withArray(
                                            VariableReferenceBuilder("b").build()
                                        )
                                        .withIndex(IntegerValue(0))
                                        .build()
                                    )
                                    .withField(VariableReferenceBuilder("d").build())
                                    .build()
                                )
                                .withField(VariableReferenceBuilder("e").build())
                                .build()
                            )
                            .withIndex(IntegerValue(1))
                            .build()
                        )
                        .build(),
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "complex_array_and_mtype_access.pml")


def test_call():
    model = (
        ModelBuilder()
        .withInline(
            InlineBuilder()
            .withName("test")
            .withDefinition(
                BlockBuilder(BlockType.BLOCK)
                .withStatements(
                    [
                        CallBuilder()
                        .withTarget("remote_procedure")
                        .withParameter(VariableReferenceBuilder("a").build())
                        .withParameter(
                            BinaryExpressionBuilder(BinaryOperator.ADD)
                            .withLeft(VariableReferenceBuilder("2").build())
                            .withRight(
                                BinaryExpressionBuilder(BinaryOperator.MULTIPLY)
                                .withLeft(VariableReferenceBuilder("7").build())
                                .withRight(VariableReferenceBuilder("3").build())
                                .build()
                            )
                            .build()
                        )
                        .build()
                    ]
                )
                .build()
            )
            .build()
        )
        .build()
    )

    generate_and_verify(model, "call.pml")
