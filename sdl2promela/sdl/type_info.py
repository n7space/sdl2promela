from typing import Dict

from sdl2promela.utils import Asn1Type


class TypeInfo:
    """Auxilary class with some informations to handle ASN.1 types"""

    all_types: Dict[str, str]
    """The map from type name from opengeode -> type name for promela"""

    def __init__(self):
        self.all_types = {}

    def fix_type_name(self, name: str) -> str:
        """
        Try to convert ASN.1 type name parsed by opengeode to name for promela.
        When the type name cannot be converted, the original value is returned.
        :param name: ASN.1 type name
        :returns: promela type name
        """
        if name in self.all_types:
            return self.all_types[name]
        return name


def build_type_info(all_types: Dict[str, Asn1Type]) -> TypeInfo:
    """
    Create TypeInfo and fill it with data.
    :param all_types: dictionary with ASN.1 types from opengeode parser
    :returns: new TypeInfo filled with data.
    """
    type_info = TypeInfo()

    # The AddedType attribute is "True"
    # when the type is not top-level, i.e. it is
    # nested type definition.

    # add top-level types
    for asn1_name, asn1_type in all_types.items():
        if asn1_type.AddedType == "False":
            type_info.all_types[asn1_name] = asn1_name.replace("-", "_")

    # try to add composite types
    # e.g. ASN.1: MyData ::= SEQUENCE { v : INTEGER (0 .. 2) }
    #      two types will be created: MyData and MyData_v
    #      the intention of this loop is to add mapping from MyData_v to MyData__v
    # To support multiple levels of composition, the operation is repeated until no change is possible
    changed = True
    while changed:
        changed = False
        for asn1_name, asn1_type in all_types.items():
            escaped_name = asn1_name.replace("-", "_")
            if asn1_type.AddedType == "True" and escaped_name not in all_types.keys():
                for existing_mapping in iter(type_info.all_types):
                    if escaped_name.startswith(existing_mapping):
                        part_name = escaped_name.removeprefix(
                            existing_mapping
                        )  # part_name shall start with '_'
                        type_info.all_types[
                            escaped_name
                        ] = f"{existing_mapping}_{part_name}"
                        changed = True
                        break

    return type_info
