#!/bin/bash

# for manual building on local machine.
# use git tags to initiate github actions build, see .github/workflows/

set -e

set -o allexport; source environment.sh; set +o allexport

# Create and use a buildx builder instance that supports multi-platform builds
docker buildx create --name multiarch --use 2>/dev/null || docker buildx use multiarch

# Build for both amd64 and arm64 architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg PERL_DOCKER_TAG="${PERL_DOCKER_TAG}" \
  --progress=plain \
  -t ryanlauterbach/perl-catalyst:latest \
  --push \
  .
