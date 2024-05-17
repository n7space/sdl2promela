from typing import Dict

from sdl2promela.utils import Asn1Type


class TypeInfo:

    all_types: Dict[str, str]

    def __init__(self):
        self.all_types = {}

    def fix_type_name(self, name: str) -> str:
        if name in self.all_types:
            return self.all_types[name]
        return name


# def create_type(name: str, has_parent: bool, t: Any)


def build_type_info(all_types: Dict[str, Asn1Type]) -> TypeInfo:
    type_info = TypeInfo()

    for name, t in all_types.items():
        if t.AddedType == "False":
            type_info.all_types[name] = name.replace("-", "_")

    for name, t in all_types.items():
        escaped_name = name.replace("-", "_")
        if t.AddedType == "True":
            for b in iter(type_info.all_types):
                if escaped_name.startswith(b):
                    part_name = escaped_name.removeprefix(
                        b
                    )  # part_name shall start with '_'
                    type_info.all_types[escaped_name] = f"{b}_{part_name}"
                    break

    return type_info
