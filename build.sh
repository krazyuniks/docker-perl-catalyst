#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

source environment.sh

docker build --progress=plain -t ryanlauterbach/perl-catalyst:latest --build-arg CPAN_MODULES="${CPAN_MODULES}" .

docker push --all-tags ryanlauterbach/perl-catalyst
