#!/bin/bash

set -e

export PERL_DOCKER_TAG=5.36.0-slim-bullseye

export CPAN_MODULES=$(grep -E '^[A-Z].+' cpan_modules.txt | tr '\n' ' ')

docker build -t ryanlauterbach/perl-catalyst:latest -t ryanlauterbach/perl-catalyst:${PERL_DOCKER_TAG} --build-arg PERL_DOCKER_TAG=${PERL_DOCKER_TAG} --build-arg CPAN_MODULES="${CPAN_MODULES}" .

docker push --all-tags ryanlauterbach/perl-catalyst
