#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$TMC" ]
then
	echo "CRITICAL: Cannot regenerate project: TMC not set"
	exit 1
fi

pushd "$DIR"
pushd controller
mkdir -p tmp
pushd tmp
opengeode --toAda ../controller.pr ../system_structure.pr
cp controller_datamodel.asn ..
popd
$TMC -dataview ../dataview.pml -asn controller_datamodel.asn -asn dataview-uniq.asn
rm -rf tmp
popd
popd
