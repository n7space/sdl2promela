from typing import Dict, Any
from .types import Asn1Type


def resolve_asn1_type(allTypes: Dict[str, Any], t) -> Asn1Type:
    """Find ASN.1 type object."""
    while t.kind == "ReferenceType":
        if t.ReferencedTypeName not in allTypes:
            raise Exception("Cannot resolve type {}".format(t.ReferencedTypeName))
        t = allTypes[t.ReferencedTypeName].type

    return t


def default_value_variable_name_for_type(datatype: Any) -> str:
    if datatype.kind != "ReferenceType":
        raise Exception(
            f"default_value_variable_name is not available for kind {datatype.kind}"
        )
    base_name = datatype.ReferencedTypeName.replace("-", "_").lower()
    return f"{base_name}_default_value"
