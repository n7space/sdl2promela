#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$TMC" ]
then
	echo "CRITICAL: Cannot regenerate project: TMC not set"
	exit 1
fi

source ../../regenerate_template.sh

INTERFACEVIEW_PATH="${DIR}/taste/interfaceview.xml"
OUTPUTDIR_PATH="${DIR}/tmc"
SCL_PATH="${DIR}/scl_uh_signal_observer.txt"
UH_SIGNAL_OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/uh_signal_observer/uh_signal_observer.pr"
UH_FUNCTION_OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/uh_function_observer/uh_function_observer.pr"
UH_GLOBAL_OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/uh_global_observer/uh_global_observer.pr"

echo "Generating promela code"
if ! "$TMC" -iv "$INTERFACEVIEW_PATH" -scl "$SCL_PATH" -os "$UH_SIGNAL_OBSERVER_PATH" -os "$UH_FUNCTION_OBSERVER_PATH" -os "$UH_GLOBAL_OBSERVER_PATH" -o "$OUTPUTDIR_PATH"
then
	echo "CRITICAL: Cannot generate Promela code"
	exit 1
fi

echo "SUCCESS: regeneration finished"
