from sdl2promela.promela.model import Model
from sdl2promela.promela.generator import generateModel
from sdl2promela.promela.modelbuilder import *
import os
import io

TEST_DIR : str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR : str = os.path.join(TEST_DIR, "resources")

def readReference(path : str):
    return io.open(os.path.join(RESOURCE_DIR, path)).readlines()

def assertLinesMatch(actual : List[str], expected : List[str]):
    for i in range(0, max(len(actual), len(expected))):
        actualLine = actual[i].strip() if i < len(actual) else ""
        expectedLine = expected[i].strip() if i < len(expected) else ""
        assert(actualLine == expectedLine)

def generateAndVerify(model : Model, pathToReference : str):
    stream = io.StringIO()
    generateModel(model, stream)
    result = stream.readlines()
    reference = readReference(pathToReference)
    assertLinesMatch(result, reference)

def test_inline():
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withParameter("a") \
            .withParameter("b") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).build()).build()).build()

    generateAndVerify(model, "inline.pml")

def test_do():
    do = DoBuilder().withAlternative( \
            AlternativeBuilder().withCondition(BinaryExpressionBuilder(BinaryOperator.EQUAL) \
                .withLeft(VariableReferenceBuilder("state").build()) \
                .withRight(VariableReferenceBuilder("idle").build()) \
            .build()).withStatements( \
                [Skip()]
                ).build()
        ).withAlternative( \
            AlternativeBuilder().withCondition(BinaryExpressionBuilder(BinaryOperator.EQUAL) \
                .withLeft(VariableReferenceBuilder("state").build()) \
                .withRight(VariableReferenceBuilder("running").build()) \
            .build()).withStatements( \
                [Skip()]
                ).build()
        ).build()
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).withStatements([do]).build()).build()).build()

    generateAndVerify(model, "do.pml")

def test_switch():
    switch = SwitchBuilder().withAlternative( \
            AlternativeBuilder().withCondition(BinaryExpressionBuilder(BinaryOperator.GREATER) \
                .withLeft(VariableReferenceBuilder("a").build()) \
                .withRight(VariableReferenceBuilder("threshold").build()) \
            .build()).withStatements( \
                [Skip()]
                ).build()
        ).withAlternative( \
            AlternativeBuilder().withStatements( \
                [Skip()]
                ).build()
        ).build()
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).withStatements([switch]).build()).build()).build()

    generateAndVerify(model, "switch.pml")

def test_binary_operators():
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).withStatements([
                    AssignmentBuilder().withTarget(VariableReferenceBuilder("a").build()) \
                        .withSource(BinaryExpressionBuilder(BinaryOperator.ADD) \
                            .withLeft(VariableReferenceBuilder("5").build()) \
                            .withRight(VariableReferenceBuilder("6").build()) \
                            .build()).build(),
                    AssignmentBuilder().withTarget(VariableReferenceBuilder("b").build()) \
                        .withSource(BinaryExpressionBuilder(BinaryOperator.MULTIPLY) \
                            .withLeft(VariableReferenceBuilder("a").build()) \
                            .withRight(VariableReferenceBuilder("3").build()) \
                            .build()).build(),
                    AssignmentBuilder().withTarget(VariableReferenceBuilder("c").build()) \
                        .withSource(BinaryExpressionBuilder(BinaryOperator.SUBTRACT) \
                            .withLeft(VariableReferenceBuilder("a").build()) \
                            .withRight(VariableReferenceBuilder("b").build()) \
                            .build()).build(),
                    AssignmentBuilder().withTarget(VariableReferenceBuilder("d").build()) \
                        .withSource(BinaryExpressionBuilder(BinaryOperator.DIVIDE) \
                            .withLeft(VariableReferenceBuilder("c").build()) \
                            .withRight(VariableReferenceBuilder("2").build()) \
                            .build()).build(),
                ]).build()).build()).build()

    generateAndVerify(model, "binary_operators.pml")

def test_call():
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).withStatements([
                    CallBuilder().withTarget("remote_procedure") \
                        .withParameter(VariableReferenceBuilder("a").build()) \
                        .withParameter(BinaryExpressionBuilder(BinaryOperator.ADD) \
                            .withLeft(VariableReferenceBuilder("2").build()) \
                            .withRight( \
                                BinaryExpressionBuilder(BinaryOperator.MULTIPLY) \
                                    .withLeft(VariableReferenceBuilder("7").build()) \
                                    .withRight(VariableReferenceBuilder("3").build()) \
                                .build() \
                            ) \
                        .build()) \
                    .build()
                ]).build()).build()).build()

    generateAndVerify(model, "call.pml")
