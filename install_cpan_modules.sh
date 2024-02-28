#!/bin/bash

set -e

grep -E '^[A-Z].+' ${1} | while read mod
do
    echo "Installing perl modules: $mod"
    cpm install --show-build-log-on-failure --global $mod
done
