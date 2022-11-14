TEMPLATE = lib
CONFIG -= qt
CONFIG += generateC

DISTFILES +=  $(HOME)/tool-inst/share/taste-types/taste-types.asn
DISTFILES += stop_condition_get_state_parallel_proctype.msc
DISTFILES += interfaceview.xml
DISTFILES += work/binaries/*.msc
DISTFILES += work/binaries/coverage/index.html
DISTFILES += work/binaries/filters
DISTFILES += work/system.asn

DISTFILES += stop_condition_get_state_parallel_proctype.asn
DISTFILES += stop_condition_get_state_parallel_proctype.acn
include(work/taste.pro)
message($$DISTFILES)

