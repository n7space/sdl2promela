TEMPLATE = lib
CONFIG -= qt
CONFIG += generateC

DISTFILES +=  $(HOME)/tool-inst/share/taste-types/taste-types.asn
DISTFILES += relation_expressions.asn
DISTFILES += relation_expressions.acn
DISTFILES += interfaceview.xml
DISTFILES += work/binaries/*.msc
DISTFILES += work/binaries/coverage/index.html
DISTFILES += work/binaries/filters
#include(handleAsn1AcnBuild.pri)
include(work/taste.pro)
message($$DISTFILES)
