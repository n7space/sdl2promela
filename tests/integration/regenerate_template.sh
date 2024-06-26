#!/bin/bash

pushd taste

if [[ -n $REGENERATE_BUILD_PROJECT ]]
then
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
fi

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
src=`find work/simulation -name 'observer.asn' -type f`
for dst in `find work/modelchecking -name observer.asn`
do
	cp -v "$src" "$dst"
done

popd
