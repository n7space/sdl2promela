import argparse
from typing import List
import logging
import opengeode
import sys
import traceback

from opengeode import ogAST
from .sdl import model as sdlmodel
from .promela import generator as promelagenerator
from . import translator
from . import __version__
from .stop_condition import parser as scl_parser
from .stop_condition import translator as scl_translator
from .stop_condition import model as scl_model

__log = logging.getLogger("sdl2promela")


def __parse_arguments():
    parser = argparse.ArgumentParser(description="SDL to Promela converter")
    parser.add_argument(
        dest="files",
        type=str,
        nargs="+",
        help="SDL system description; can contain only a single process",
    )
    parser.add_argument(
        "-o", "--output", dest="output_filename", type=str, help="output file name"
    )
    parser.add_argument("-v", "--verbose", action="store_true", help="verbose output")
    parser.add_argument("--version", action="version", version=__version__)
    parser.add_argument(
        "--scl", action="store_true", help="Read input files as Stop Conditions"
    )
    return parser.parse_args()


def read_process(sdl_files: List[str]) -> ogAST.Process:
    """
    Read a single SDL process from a list of files.
    :param sdl_files: List of names of files containing the SDL model.
    :returns: SDL process.
    """
    try:
        ast, warnings, errors = opengeode.parse(sdl_files)
    except IOError as error:
        __log.error("IOError:" + error)
        traceback.print_exc()
        sys.exit(1)
    except Exception:
        __log.error("Unknown parsing error")
        traceback.print_exc()
        sys.exit(1)

    if len(warnings) > 0:
        __log.error(f"Warning: found {len(warnings)} warnings:")
        for warning in warnings:
            __log.error(warning)
    if len(errors) > 0:
        __log.error(f"Error: found {len(errors)} errors:")
        for error in errors:
            __log.error(error)
        sys.exit(1)
    if len(ast.processes) != 1:
        __log.error(
            f"The input SDL files shall contain exactly 1 process, but {len(ast.processes)} were found"
        )
        sys.exit(1)

    return ast.processes[0]


def translate(sdl_files: List[str], output_file_name: str) -> bool:
    """
    Translate a list of SDL files describing a single process into a Promela model.
    :param sdl_files: List of files describing a single SDL process.
    :param output_file_name: Name of the file to write the output Promela model to.
    :returns: Whether the translation was succesful.
    """
    __log.info(f"Reading process from {sdl_files}")
    process = read_process(sdl_files)
    __log.info(f"Reading done")

    try:
        __log.info(f"Simplifying SDL model")
        sdl_model = sdlmodel.Model(process)
    except Exception:
        __log.error("SDL model simplification failed")
        traceback.print_exc()
        return False
    __log.info(f"Simplification done")

    try:
        __log.info(f"Translating SDL into Promela")
        promela_model = translator.translate(sdl_model)
    except Exception:
        __log.error("SDL to Promela model translation failed")
        traceback.print_exc()
        return False
    __log.info(f"Translating SDL into Promela done")

    try:
        __log.info(f"Opening {output_file_name} for writing and generating output")
        with open(output_file_name, "w") as file:
            promelagenerator.generate_model(promela_model, file)
        __log.info(f"Generation done")
    except Exception:
        __log.error("Promela model generation failed")
        traceback.print_exc()
        return False
    return True


def translate_scl(scl_files: List[str], output_file_name: str) -> bool:
    """
    Translate a list of Stop Condition files into a Promela model and save it to file.
    :param scl_files: List of files with stop conditions
    :param output_file_name: Name of file to save Promela model.
    """
    input_model = scl_model.StopConditionModel()
    for input_file in scl_files:
        __log.info("Parsing file {}".format(input_file))
        input_model.join(scl_parser.parse_stop_condition_file(input_file))

    __log.info("Translating Stop Condition Model into Promela Model")
    output_model = scl_translator.translate_model(input_model)

    __log.info(f"Opening {output_file_name} for writing and generating output")
    with open(output_file_name, "w") as file:
        promelagenerator.generate_model(output_model, file)
    __log.info("Generation done")
    return True


def main():
    """
    The main entry point of sdl2promela translator.
    """
    logging.basicConfig(level=logging.ERROR)
    arguments = __parse_arguments()
    if arguments.verbose:
        __log.setLevel(level=logging.INFO)
    if arguments.scl:
        if not translate_scl(arguments.files, arguments.output_filename):
            sys.exit(1)
    else:
        if not translate(arguments.files, arguments.output_filename):
            sys.exit(1)


if __name__ == "__main__":
    main()
