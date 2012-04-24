#!/bin/bash

pushd /Users/rlevin/programming/sugar/Mango > /dev/null 2>&1
sleep 1

echo "*********** About to fire up jscoverage ***********"
echo "Will push coverage to: "
echo "127.0.0.1:8080/jscoverage.html?sidecar/tests/runners/global.html"
echo "Click the 'Summary tab' to see coverage by file"
jscoverage-server --verbose 
popd > /dev/null 2>&1




