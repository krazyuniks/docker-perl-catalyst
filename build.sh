#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

source environment.sh

docker build -t ryanlauterbach/perl-catalyst:latest --progress=plain -t ryanlauterbach/perl-catalyst:${PERL_DOCKER_TAG} --build-arg PERL_DOCKER_TAG=${PERL_DOCKER_TAG} --build-arg CPAN_MODULES="${CPAN_MODULES}" . 2>&1 | tee docker_build.log

#docker push --all-tags ryanlauterbach/perl-catalyst
