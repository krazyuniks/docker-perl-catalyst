#!/bin/bash

set -e

grep -E '^[A-Z].+' ${1:=cpan_modules.txt} | xargs -n10 | while read mod
do
    echo "Installing perl modules: $mod"
    cpm install --show-build-log-on-failure --global $mod
done
