from sdl2promela.promela.model import Model
import os

TEST_DIR : str = os.path.dirname(os.path.realpath(__file__))
RESOURCE_DIR : str = os.path.join(TEST_DIR, "resources")

def test_inline():
    model = Model()
