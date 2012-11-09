#!/bin/bash
# Run this from within Mango directory
# Makes tmp dir in parent dir, then copies any files staged to ../tmp
# Use this when you've accidentally worked in trunk and need to backup changes.
mkdir ../tmp; git st | grep modified | awk '{print $3}' | while read file; do `cp "$file" ../tmp`; done

