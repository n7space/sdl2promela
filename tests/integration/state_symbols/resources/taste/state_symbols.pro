TEMPLATE = lib
CONFIG -= qt
CONFIG += generateC

DISTFILES +=  $(HOME)/tool-inst/share/taste-types/taste-types.asn
DISTFILES += state_symbols.asn
DISTFILES += state_symbols.acn
DISTFILES += state_symbols.msc
DISTFILES += interfaceview.xml
DISTFILES += work/binaries/*.msc
DISTFILES += work/binaries/coverage/index.html
DISTFILES += work/binaries/filters
#include(handleAsn1AcnBuild.pri)
include(work/taste.pro)
message($$DISTFILES)

