#!/usr/bin/env bash

home=$(pwd)
declare -A results
for regenerate in `find -name regenerate.sh`
do
	dir=$(dirname "$regenerate")
	cd "$dir"
	if bash regenerate.sh
	then
		results["$dir"]="OK"
	else
		results["$dir"]="FAIL"
	fi
	cd "$home"
done

for dir in "${!results[@]}"
do
	echo "${dir} ${results[$dir]}"
done
