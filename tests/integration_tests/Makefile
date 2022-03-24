.PHONY: \
	asn1_sequence \
	asn1_sequenceof \
	asn1_sequenceof_fixed \
	asn1_octetstring \
	asn1_octetstring_fixed \
	asn1_choice

check: \
	asn1_sequence \
	asn1_sequenceof \
	asn1_sequenceof_fixed \
	asn1_octetstring \
	asn1_octetstring_fixed \
	asn1_choice

asn1_sequence:
	${MAKE} -C $@ check

asn1_sequenceof:
	${MAKE} -C $@ check

asn1_sequenceof_fixed:
	${MAKE} -C $@ check

asn1_octetstring:
	${MAKE} -C $@ check

asn1_octetstring_fixed:
	${MAKE} -C $@ check

asn1_choice:
	${MAKE} -C $@ check
