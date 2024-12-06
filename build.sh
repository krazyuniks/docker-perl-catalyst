#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

source environment.sh

docker build --progress=plain -t ryanlauterbach/perl-catalyst:latest --build-arg PERL_DOCKER_TAG="${PERL_DOCKER_TAG}" .

docker push --all-tags ryanlauterbach/perl-catalyst
