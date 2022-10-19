#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

set -o allexport; source environment.sh; set +o allexport

CPAN_MODULES=$(grep -E '^[A-Z].+' cpan_modules.txt | tr '\n' ' ' | sed -re 's/\s+$//g')

docker build -t ryanlauterbach/perl-catalyst:latest -t ryanlauterbach/perl-catalyst:${PERL_DOCKER_TAG} --build-arg PERL_DOCKER_TAG=${PERL_DOCKER_TAG} --build-arg CPAN_MODULES="${CPAN_MODULES}" .

docker push --all-tags ryanlauterbach/perl-catalyst
