#!/bin/bash
set -e
set -x

DOCKER_VERSION=20.10.9

if [ ! -s docker-${DOCKER_VERSION}.tgz ]; then
    curl -o docker-${DOCKER_VERSION}.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz
fi

tar -xzvf docker-${DOCKER_VERSION}.tgz

# EOF
