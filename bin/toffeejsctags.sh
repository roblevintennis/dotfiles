#!/bin/bash
echo "Building jsctags tags...this may take a while."
(
pushd ${HOME}/programming/sugar/Mango > /dev/null 2>&1
/usr/local/bin/jsctags --sort=yes \
sidecar/extensions/portal \
sidecar/src \
sidecar/lib/backbone/underscore.js \
sidecar/lib/backbone/backbone.js \
sidecar/lib/sugarapi/sugarapi.js
popd > /dev/null 2>&1
)
echo "Finished building jsctags in ./.git/tags"
echo "You should now have tags for sidecar source, sugarapi, backbone, underscore, and portal extensinos."
echo
cat <<-ENDOFMESSAGE
=================
Tags cheat sheet
=================
:tjump <function_name>
or
g <c-]>  .. but I have this mapped in.vimrc to <leader>j
<c-o> or <c-t> to jump back ... but I have mapped to <leader>b

:tn[ext]
:tp[revious]
:tfirst :tlast
:tag start-of-tag-name_TAB  
:tag /search-string  
ENDOFMESSAGE

