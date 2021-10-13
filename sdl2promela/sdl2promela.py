import argparse
import typing
from typing import List
import logging
import opengeode
import sys
import traceback

from opengeode import ogAST
from sdl import model as sdlmodel
from promela import model as promelamodel
from promela import generator as promelagenerator
import translator

log = logging.getLogger("sdl2promela")

def read_process(sdl_files : List[str]) -> ogAST.Process:
    try:
        ast, warnings, errors = opengeode.parse(sdl_files)
    except IOError as error:
        log.error("IOError:" + error)
        traceback.print_exc()
        sys.exit(1)
    except:
        log.error("Unknown parsing error")
        traceback.print_exc()
        sys.exit(1)

    if len(warnings) > 0:
        log.error(f"Error: found {len(errors)} warnings (warnings indicate issues with the SDL model and are treated as errors):")
        for warning in warnings:
            log.error(warning)
        sys.exit(1)
    if len(errors) > 0:
        log.error(f"Error: found {len(errors)} errors:")
        for error in errors:
            log.error(error)
        sys.exit(1)
    if len(ast.processes) != 1:
        log.error(f"The input SDL files shall contain exactly 1 process, but {len(ast.processes)} were found")
        sys.exit(1)

    return ast.processes[0]

def translate(sdl_files : List[str], output_dir : str):
    log.info(f"Reading process from {sdl_files}")
    process = read_process(sdl_files)
    log.info(f"Reading done")
    
    try:
        log.info(f"Simplifying SDL model")
        sdl_model = sdlmodel.Model(process)
    except:
        log.error("SDL model simplification failed")
        traceback.print_exc()
        sys.exit(1)
    log.info(f"Simplification done")

    try:
        log.info(f"Translating SDL into Promela")
        promela_model = translator.translate(sdl_model)
    except:
        log.error("SDL to Promela model translation failed")
        traceback.print_exc()
        sys.exit(1)
    log.info(f"Translating SDL into Promela done")

    try:
        log.info(f"Opening {output_dir} for writing and generating output")
        with open(output_dir, 'w') as file:
            promelagenerator.generateModel(promela_model, file)
        log.info(f"Generation done")
    except:
        log.error("Promela model generation failed")
        traceback.print_exc()
        sys.exit(1)

def parse_arguments():
    parser = argparse.ArgumentParser(description="SDL to Promela converter")
    parser.add_argument(dest="files", type=str, nargs="+", help="SDL system description; can contain only a single process")
    parser.add_argument("-o", "--output", dest="output_filename", type=str, help="output file name")    
    parser.add_argument("-v", "--verbose", action="store_true", help="verbose output")    
    return parser.parse_args()

if __name__== "__main__":
    logging.basicConfig(level=logging.ERROR)
    arguments = parse_arguments()
    if arguments.verbose:
        log.setLevel(level=logging.INFO)
    translate(arguments.files, arguments.output_filename)
