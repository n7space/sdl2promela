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
SCL_PATH="${DIR}/scl.txt"
ZERO_OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/zero_observer/zero_observer.pr"
CHANGE_OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/change_observer/change_observer.pr"

echo "Generating promela code"
if ! "$TMC" -iv "$INTERFACEVIEW_PATH" -scl "$SCL_PATH" -os "${ZERO_OBSERVER_PATH}:2" -os "${CHANGE_OBSERVER_PATH}:1" -o "$OUTPUTDIR_PATH"
then
	echo "CRITICAL: Cannot generate Promela code"
	exit 1
fi

echo "SUCCESS: regeneration finished"
