#!/bin/bash

set -e

grep -E '^[A-Z].+' cpan_modules.txt | while read mod
do
    echo "Installing perl modules: $mod"
    cpm install -w 8 --show-build-log-on-failure --global $mod
done
