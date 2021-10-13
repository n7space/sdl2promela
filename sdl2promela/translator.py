import typing

from .sdl import model as sdlmodel
from .promela import model as promelamodel

def translate(sdl_model : sdlmodel.Model) -> promelamodel.Model:
    model = promelamodel.Model()
    model.epilogue = ""
    model.prologue = ""
    model.inlines = []
    return model
