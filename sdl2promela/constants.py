import sdl2promela.sdl.model as sdlmodel
import sdl2promela.promela.model as promelamodel

TRANSITION_TYPE_NAME = "int"
TRANSITION_ARGUMENT = "id"
INVALID_ID = "-1"
STATE_VARIABLE = "state"
INIT = "init"
STATES_SEPARATOR = "_States_"
GLOBAL_STATE = "global_state"
NEXT_TRANSITION_LABEL_NAME = "next_transition"

BINARY_OPERATOR_DICTIONARY = {
    sdlmodel.BinaryOperator.EQUAL: promelamodel.BinaryOperator.EQUAL,
    sdlmodel.BinaryOperator.NEQUAL: promelamodel.BinaryOperator.NEQUAL,
    sdlmodel.BinaryOperator.GREATER: promelamodel.BinaryOperator.GREATER,
    sdlmodel.BinaryOperator.LESS: promelamodel.BinaryOperator.LESS,
    sdlmodel.BinaryOperator.LEQUAL: promelamodel.BinaryOperator.LEQUAL,
    sdlmodel.BinaryOperator.GEQUAL: promelamodel.BinaryOperator.GEQUAL,
    sdlmodel.BinaryOperator.ADD: promelamodel.BinaryOperator.ADD,
    sdlmodel.BinaryOperator.SUB: promelamodel.BinaryOperator.SUBTRACT,
    sdlmodel.BinaryOperator.MUL: promelamodel.BinaryOperator.MULTIPLY,
    sdlmodel.BinaryOperator.DIV: promelamodel.BinaryOperator.DIVIDE,
    sdlmodel.BinaryOperator.MOD: promelamodel.BinaryOperator.MODULO,
    sdlmodel.BinaryOperator.REM: promelamodel.BinaryOperator.MODULO,
    sdlmodel.BinaryOperator.OR: promelamodel.BinaryOperator.OR,
    sdlmodel.BinaryOperator.AND: promelamodel.BinaryOperator.AND,
    sdlmodel.BinaryOperator.XOR: promelamodel.BinaryOperator.XOR,
}

CHOICE_DATA_MEMBER_NAME = "data"
CHOICE_SELECTION_MEMBER_NAME = "selection"
SEQUENCE_EXIST_MEMBER_NAME = "exist"
SEQUENCEOF_DATA_MEMBER_NAME = "data"
SEQUENCEOF_LENGTH_MEMBER_NAME = "length"
STRING_DATA_MEMBER_NAME = "data"
STRING_LENGTH_MEMBER_NAME = "length"

SEQUENCE_TYPE_NAME = "SequenceType"
SEQUENCEOF_TYPE_NAME = "SequenceOfType"
IA5_STRING_TYPE_NAME = "IA5StringType"
OCTET_STRING_TYPE_NAME = "OctetStringType"
BIT_STRING_TYPE_NAME = "BitStringType"
CHOICE_TYPE_NAME = "ChoiceType"

SYSTEM_CAPABILITY_POWER_INT_INLINE = "system_capability_power_int"
