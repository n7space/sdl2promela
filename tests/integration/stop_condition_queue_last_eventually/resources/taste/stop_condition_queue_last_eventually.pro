TEMPLATE = lib
CONFIG -= qt
CONFIG += generateC

DISTFILES +=  $(HOME)/tool-inst/share/taste-types/taste-types.asn
DISTFILES += stop_condition_queue_last_eventually.msc
DISTFILES += interfaceview.xml
DISTFILES += work/binaries/*.msc
DISTFILES += work/binaries/coverage/index.html
DISTFILES += work/binaries/filters
DISTFILES += work/system.asn

DISTFILES += stop_condition_queue_last_eventually.asn
DISTFILES += stop_condition_queue_last_eventually.acn
include(work/taste.pro)
message($$DISTFILES)

