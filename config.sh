#!/bin/bash
set -e
SCRIPT_PATH="$(dirname $(readlink -f $BASH_SOURCE))";

if [ -z "$ALTDOCKER_NAME" ]; then
    echo "ALTDOCKER_NAME variable is required. Aborting."
    exit 1
fi

PATH="$SCRIPT_PATH/docker:$PATH"

ALTDOCKER_ROOT="$SCRIPT_PATH/altdocker/$DOCKER_NAME"
ALTDOCKER_EXEC_ROOT="$ALTDOCKER_ROOT/exec"
ALTDOCKER_GRAPH="$ALTDOCKER_ROOT/graph"
ALTDOCKER_SOCKET="$ALTDOCKER_ROOT/docker.sock"
ALTDOCKER_PIDFILE="$ALTDOCKER_ROOT/docker.pid"
ALTDOCKER_BRIDGE="altdocker-$DOCKER_NAME"

# EOF
