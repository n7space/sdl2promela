from typing import List, Set
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
from .system_capability import SystemCapability

__log = logging.getLogger("sdl2promela")


class ProgramOptions:
    """Sdl2Promela Commandline Options"""

    output_filname: str
    """Output file."""
    observer_info_filename: str
    """Name of the file containing the extracted observer information."""
    system_capabilities_output_filename: str
    """Name of the file where required system capabilities will be saved."""
    verbose: bool
    """Show verbose output."""
    sdl_files: List[List[str]]
    """Groups of sdl files, every group shall contain one process."""
    scl_files: List[str]
    """List of Stop Condition Language Files."""
    include_observers: bool
    """Generate checks for special states in observers."""
    search_for_observer_success: bool
    """Generate checks to search for special states in observers."""

    def __init__(self):
        self.output_filename = None
        self.observer_info_filename = None
        self.system_capabilities_output_filename = None
        self.verbose = False
        self.include_observers = False
        self.sdl_files = []
        self.scl_files = []
        self.search_for_observer_success = False

    def verify(self) -> bool:
        """Verify ProgramOptions content and print messages in case of errors."""
        if self.output_filename is None:
            print(
                "Missing OUTPUT_FILENAME parameter. Use -o to specify output filename."
            )
            return False
        elif len(self.scl_files) == 0 and len(self.sdl_files) == 0:
            print(
                "Missing input files. Use --scl to specify input stop condition file,"
            )
            print("or --sdl to specify input SDL files.")
            return False
        else:
            return True


class ProgramOptionsParseException(Exception):
    """Exception to notify about errors during parsing commandline parameters."""

    pass


def __show_help():
    usage = """usage: sdl2promela [-h] [--sdl FILES [FILES ...]] [-o OUTPUT_FILENAME] [-v]
                   [--version] [--scl SCL_FILE] [--os]

SDL to Promela converter

optional arguments:
  -h, --help            show this help message and exit
  --sdl FILES [FILES ...]
                        SDL system description; can contain only a single
                        process,
  -o OUTPUT_FILENAME, --output OUTPUT_FILENAME
                        output file name
  -oi INFO_FILENAME,  --observer-info INFO_FILENAME
                        observer info output file name
  -c SYS_CAP_FILENAME, --system-capabilities SYS_CAP_FILENAME
                        output for required system capabilities, like math functions and other auxiliary objects.
  -v, --verbose         verbose output
  --version             show program's version number and exit
  --scl SCL_FILE
                        Read input files as Stop Conditions
  --os
                        Generate checks for observer special states
                        together with Stop Conditions.
  --success-search
                        Generate never claim to search for success states in observers.
"""
    print(usage)


def __show_version():
    print(__version__)


def __parse_sdl_arguments(index: int, options: ProgramOptions) -> int:
    group: List[str] = []
    argv = sys.argv

    while index < len(argv) and not argv[index].startswith("-"):
        group.append(argv[index])
        index = index + 1

    options.sdl_files.append(group)

    return index - 1


def __parse_arguments_impl() -> ProgramOptions:
    options = ProgramOptions()
    argv = sys.argv
    index = 1
    while index < len(argv):
        if argv[index] == "-o" or argv[index] == "--output":
            if index + 1 >= len(argv):
                raise ProgramOptionsParseException(
                    "{} requires filename".format(argv[index])
                )
            index = index + 1
            if options.output_filename is not None:
                raise ProgramOptionsParseException("Output file already specified.")
            options.output_filename = argv[index]
        elif argv[index] == "-oi" or argv[index] == "--observer-info":
            if index + 1 >= len(argv):
                raise ProgramOptionsParseException(
                    "{} requires filename".format(argv[index])
                )
            index = index + 1
            if options.observer_info_filename is not None:
                raise ProgramOptionsParseException(
                    "Observer info output file already specified."
                )
            options.observer_info_filename = argv[index]
        elif argv[index] == "-c" or argv[index] == "--system-capabilities":
            if index + 1 >= len(argv):
                raise ProgramOptionsParseException(
                    "{} requires filename".format(argv[index])
                )
            index = index + 1
            if options.system_capabilities_output_filename is not None:
                raise ProgramOptionsParseException(
                    "Required system capabilities output filename is already specified."
                )
            options.system_capabilities_output_filename = argv[index]
        elif argv[index] == "-v" or argv[index] == "--verbose":
            options.verbose = True
        elif argv[index] == "-h" or argv[index] == "--help":
            __show_help()
            sys.exit(0)
        elif argv[index] == "--version":
            __show_version()
            sys.exit(0)
        elif argv[index] == "--scl":
            if index + 1 >= len(argv):
                raise ProgramOptionsParseException(
                    "{} requires filename".format(argv[index])
                )
            index = index + 1
            options.scl_files.append(argv[index])
        elif argv[index] == "--sdl":
            if index + 1 >= len(argv):
                raise ProgramOptionsParseException(
                    "{} requires filename".format(argv[index])
                )
            index = index + 1
            index = __parse_sdl_arguments(index, options)
        elif argv[index] == "--os":
            options.include_observers = True
        elif argv[index] == "--success-search":
            options.search_for_observer_success = True
        else:
            raise ProgramOptionsParseException(
                "Unknown argument '{}'".format(argv[index])
            )
        index = index + 1

    if options.verify():
        return options
    else:
        sys.exit(1)


def __parse_arguments() -> ProgramOptions:
    try:
        return __parse_arguments_impl()
    except ProgramOptionsParseException as exception:
        print("Cannot parse commandline arguments:")
        print("    {}".format(exception))
        sys.exit(1)


def __export_observer_attachment_infos(
    process_name: str,
    file_name: str,
    attachments: List[sdlmodel.ObserverAttachmentInfo],
):
    try:
        __log.info(f"Opening {file_name} for writing attachment infos")
        with open(file_name, "w") as file:
            for attachment in attachments:
                print(
                    process_name
                    + ":"
                    + str(attachment.kind)
                    + ":"
                    + attachment.observerSignalName
                    + ":"
                    + attachment.originalSignalName,
                    file=file,
                    end="",
                )
                if attachment.senderName is not None:
                    print(":<" + attachment.senderName, file=file, end="")
                if attachment.recipientName is not None:
                    print(":>" + attachment.recipientName, file=file, end="")
                print("\n", file=file, end="")
        __log.info("Writing done")
    except Exception:
        __log.error("Attachment info export failed")
        traceback.print_exc()


def __export_required_system_capabilities(
    file_name: str, capabilities: Set[SystemCapability]
):
    __log.info("Opening %s for writing attachment infos", file_name)
    with open(file_name, "w", encoding="utf-8") as cap_file:
        for cap in capabilities:
            cap_file.write(f"{cap.name}\n")
    __log.info("Writing done")


def read_process(sdl_files: List[str]) -> ogAST.Process:
    """
    Read a single SDL process from a list of files.
    :param sdl_files: List of names of files containing the SDL model.
    :returns: SDL process.
    """
    try:
        ast, warnings, errors = opengeode.parse(sdl_files)
    except IOError as err:
        __log.error("IOError: " + str(err))
        traceback.print_exc()
        sys.exit(1)
    except Exception:
        __log.error("Unknown parsing error")
        traceback.print_exc()
        sys.exit(1)

    if len(warnings) > 0:
        __log.warning(f"Warning: found {len(warnings)} warnings:")
        for warning in warnings:
            __log.warning(warning)
    if len(errors) > 0:
        __log.error(f"Error: found {len(errors)} errors:")
        for error_item in errors:
            __log.error(error_item)
        sys.exit(1)
    if len(ast.processes) != 1:
        __log.error(
            f"The input SDL files shall contain exactly 1 process, but {len(ast.processes)} were found"
        )
        sys.exit(1)

    __log.info(
        "Processes: {}, Process types: {}".format(
            len(ast.processes), len(ast.process_types)
        )
    )

    return ast.processes[0]


def translate(sdl_files: List[str], arguments: ProgramOptions) -> bool:
    """
    Translate a list of SDL files describing a single process into a Promela model.
    :param sdl_files: List of files describing a single SDL process.
    :param arguments: Program Options.
    :returns: Whether the translation was succesful.
    """
    # group, arguments.output_filename, arguments.observer_info_filename
    required_system_capabilities = None
    __log.info(f"Reading process from {sdl_files}")
    process = read_process(sdl_files)
    __log.info("Reading done")

    try:
        __log.info("Simplifying SDL model")
        sdl_model = sdlmodel.Model(process)
    except Exception:
        __log.error("SDL model simplification failed")
        traceback.print_exc()
        return False
    __log.info("Simplification done")

    try:
        __log.info("Translating SDL into Promela")
        is_observer = arguments.observer_info_filename is not None
        promela_model, required_system_capabilities = translator.translate(
            sdl_model, is_observer
        )
    except Exception:
        __log.error("SDL to Promela model translation failed")
        traceback.print_exc()
        return False
    __log.info("Translating SDL into Promela done")

    try:
        __log.info(
            f"Opening {arguments.output_filename} for writing and generating output"
        )
        with open(arguments.output_filename, "w") as file:
            promelagenerator.generate_model(promela_model, file)
        __log.info("Generation done")
    except Exception:
        __log.error("Promela model generation failed")
        traceback.print_exc()
        return False

    if arguments.observer_info_filename is not None:
        __export_observer_attachment_infos(
            sdl_model.process_name,
            arguments.observer_info_filename,
            sdl_model.observer_attachments,
        )
    if arguments.system_capabilities_output_filename:
        __export_required_system_capabilities(
            arguments.system_capabilities_output_filename, required_system_capabilities
        )
    return True


def translate_scl(
    scl_files: List[str],
    sdl_files: List[List[str]],
    output_file_name: str,
    search_for_observer_success: bool,
) -> bool:
    """
    Translate a list of Stop Condition files into a Promela model and save it to file.
    :param scl_files: List of files with stop conditions
    :param sdl_files:
    :param output_file_name: Name of file to save Promela model.
    :param search_for_observer_success:
    """
    input_model = scl_model.StopConditionModel()
    context = {}
    for group in sdl_files:
        __log.info(f"Reading process from {group}")
        process = read_process(group)
        __log.info("Reading done")
        try:
            __log.info("Simplifying SDL model")
            sdl_model = sdlmodel.Model(process)
        except Exception:
            __log.error("SDL model simplification failed")
            traceback.print_exc()
            return False
        __log.info("Simplification done")

        context[process.processName.lower()] = sdl_model
    for input_file in scl_files:
        __log.info("Parsing file {}".format(input_file))
        model = scl_parser.parse_stop_condition_file(input_file)
        if model is None:
            return False
        input_model.join(model)

    __log.info("Translating Stop Condition Model into Promela Model")
    output_model = scl_translator.translate_model(
        input_model, context, search_for_observer_success
    )

    __log.info(f"Opening {output_file_name} for writing and generating output")
    with open(output_file_name, "w") as file:
        promelagenerator.generate_model(output_model, file)
    __log.info("Generation done")
    return True


def main():
    """
    The main entry point of sdl2promela translator.
    """
    logging.basicConfig(level=logging.WARNING)
    arguments = __parse_arguments()

    if arguments.verbose:
        __log.setLevel(level=logging.INFO)

    if arguments.scl_files or arguments.include_observers:
        if not translate_scl(
            arguments.scl_files,
            arguments.sdl_files,
            arguments.output_filename,
            arguments.search_for_observer_success,
        ):
            sys.exit(1)
    else:
        for group in arguments.sdl_files:
            if not translate(group, arguments):
                sys.exit(1)


if __name__ == "__main__":
    main()
