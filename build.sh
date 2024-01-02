#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

docker pull cgr.dev/chainguard/wolfi-base:latest

docker build -t ryanlauterbach/perl-catalyst:latest --no-cache --progress=plain . 2>&1 | tee docker_build.log

docker push --all-tags ryanlauterbach/perl-catalyst
