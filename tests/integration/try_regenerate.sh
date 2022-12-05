#!/usr/bin/env bash

h=$(pwd); for rg in `find -name regenerate.sh`; do dr=$(dirname "$rg"); echo "$dr"; cd "$dr"; bash regenerate.sh; cd "$h"; done
