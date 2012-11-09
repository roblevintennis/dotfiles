#!/bin/bash
echo 'Running ci_runner.sh to check CI ready'
pushd /Users/rlevin/programming/sugar/Mango
sidecar/tests/ci_runner.sh -o FOO -m ~/programming/sugar/Mango -p ~/bin/phantomjs-1.5.0/bin/phantomjs

popd
echo 'done'
exit 0
