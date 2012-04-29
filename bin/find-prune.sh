#!/bin/bash

# Usage
# find-prune.sh lib "eval\b"

if [ ! $# == 2 ]; then
  echo "Usage: $0 name_of_directory_to_prune egrep_expression_in_quotes"
  exit
fi

find . \( -name $1 -type d -prune \) -o -iname \*.js -print0 | xargs -0 egrep -n "$2"

