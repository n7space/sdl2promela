TEMPLATE = lib
CONFIG -= qt
CONFIG += generateC

DISTFILES +=  $(HOME)/tool-inst/share/taste-types/taste-types.asn
DISTFILES += interfaceview.xml
DISTFILES += work/binaries/*.msc
DISTFILES += work/binaries/coverage/index.html
DISTFILES += work/binaries/filters

DISTFILES += stop_condition_queue_last.asn
DISTFILES += stop_condition_queue_last.acn
include(work/taste.pro)
message($$DISTFILES)
