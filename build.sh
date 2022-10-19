#!/bin/bash

set -e

set -o allexport; source environment.sh; set +o allexport

docker build -t ryanlauterbach/perl-catalyst:latest -t ryanlauterbach/perl-catalyst:${PERL_DOCKER_TAG} --build-arg PERL_DOCKER_TAG=${PERL_DOCKER_TAG} --build-arg CPAN_MODULES="${CPAN_MODULES}" .

docker push --all-tags ryanlauterbach/perl-catalyst
