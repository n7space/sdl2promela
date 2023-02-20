#!/bin/bash

pushd taste

echo "INFO: project clean"
if ! make clean
then
	echo "CRITICAL: Cannot clean the project."
	exit 1
fi

echo "INFO: project build"
if ! make
then
	echo "CRITICAL: Cannot build project."
	exit 1
fi

echo "INFO: datamodel"
# After build the *_datamodel.asn are saved into code subdirectory
# This loop copies them into src subdirectory
for datamodel in $(find -name '*_datamodel.asn')
do
	if [[ $(basename $(dirname "$datamodel")) == "code" ]]
	then
		cp -v "$datamodel" "$(dirname $(dirname $datamodel))/src"
	fi
done

echo "INFO: project clean"
if ! make clean
then
	echo "CRITICAL: Cannot clean the project."
	exit 1
fi

echo "INFO: observer.asn"
if ! make observer_dataview
then
	echo "CRITICAL: Cannot generate observer.asn."
	exit 1
fi

# after generation of observer.asn
# this loop copies it into all observers subdirectories
local src=`find work/simulation -name 'observer.asn' -type f`
for dst in `find work/modelchecking -name observer.asn`
do
	cp -v "$src" "$dst"
done

popd
