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

echo "Generating promela code"
if ! "$TMC" -iv "$INTERFACEVIEW_PATH" -scl "$SCL_PATH" -o "$OUTPUTDIR_PATH" -ivl aux_pulse:0
then
	echo "CRITICAL: Cannot generate Promela code"
	exit 1
fi

echo "SUCCESS: regeneration finished"
