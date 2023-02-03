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
OBSERVER_PATH="${DIR}/taste/work/modelchecking/properties/observer/observer.pr"

echo "Generating promela code"
if ! "$TMC" -iv "$INTERFACEVIEW_PATH" -os "$OBSERVER_PATH" -o "$OUTPUTDIR_PATH"
then
	echo "CRITICAL: Cannot generate Promela code"
	exit 1
fi

echo "SUCCESS: regeneration finished"
