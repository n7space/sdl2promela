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

def test_inline():
    model = ModelBuilder().withInline( \
        InlineBuilder().withName("test") \
            .withParameter("a") \
            .withParameter("b") \
            .withDefinition( \
                BlockBuilder(BlockType.BLOCK).build()).build()).build()

    stream = io.StringIO()
    generateModel(model, stream)
    result = stream.readlines()
    reference = readReference("inline.pml")
    assertLinesMatch(result, reference)
