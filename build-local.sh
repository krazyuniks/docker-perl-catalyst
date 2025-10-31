#!/bin/bash

# Build multi-arch image locally without pushing to Docker Hub
# The image will be loaded into your local Docker daemon

set -e

set -o allexport; source environment.sh; set +o allexport

echo "Building for linux/amd64 and linux/arm64..."
echo "Base image: perl:${PERL_DOCKER_TAG}"

# Create and use a buildx builder instance that supports multi-platform builds
docker buildx create --name multiarch --use 2>/dev/null || docker buildx use multiarch

# Build for both architectures and load to local Docker
# Note: --load only works with single platform, so we'll build and load amd64 for local use
docker buildx build \
  --platform linux/amd64 \
  --build-arg PERL_DOCKER_TAG="${PERL_DOCKER_TAG}" \
  --progress=plain \
  -t ryanlauterbach/perl-catalyst:latest \
  --load \
  .

echo ""
echo "✓ Image built and loaded locally for amd64"
echo "  To build for both platforms and push to registry, use ./build.sh"
