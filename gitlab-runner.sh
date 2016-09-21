#!/bin/bash
set -e

SCRIPT_PATH="$(dirname $(readlink -f $BASH_SOURCE))";
SCRIPT_NAME="$(basename $BASH_SOURCE)"

ALTDOCKER_NAME="${SCRIPT_NAME##ci-}"
source $SCRIPT_PATH/config.sh

docker -H unix://$ALTDOCKER_SOCKET run -d --name gitlab-runner --restart always \
  -v /root/.docker:/root/.docker:ro \
  -v $ALTDOCKER_SOCKET:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest

# EOF
