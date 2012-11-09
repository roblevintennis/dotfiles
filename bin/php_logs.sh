#!/bin/bash
pushd /Applicactions/MAMP/logs
tail -f -n50 php_error.log
