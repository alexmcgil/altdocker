#!/bin/bash
set -e
set -x

DOCKER_VERSION=1.12.1

if [ ! -s docker-${DOCKER_VERSION}.tgz ]; then
    curl -o docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz
fi

tar -xzvf docker-${DOCKER_VERSION}.tgz

# EOF
