#!/usr/bin/env bash
# Desciption: Simply opens the files that are different between two git branches in mvim
# Usage: vimall.sh toffee sidecar_unifiedsearch
if [ $# -ne 2 ]; then
    echo "Usage $(basename $0) branch1 branch2"
    echo "For example: "
    echo "$(basename $0) toffee sidecar_unifiedsearch"

    exit 1
fi

mvim --remote-silent `git diff --name-only $1 $2 -z | xargs -0`

exit 0
