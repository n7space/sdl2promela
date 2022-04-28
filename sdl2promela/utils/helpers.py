from typing import Dict


def resolve_asn1_type(allTypes: Dict[str, object], t) -> object:
    """Find ASN.1 type object."""
    while t.kind == "ReferenceType":
        if t.ReferencedTypeName not in allTypes:
            raise Exception("Cannot resolve type {}".format(t.ReferencedTypeName))
        t = allTypes[t.ReferencedTypeName].type

    return t
