#!/bin/bash
set -e

SCRIPT_PATH="$(dirname $(readlink -f $BASH_SOURCE))";
SCRIPT_NAME="$(basename $BASH_SOURCE)"

ALTDOCKER_NAME="${SCRIPT_NAME%%.sh}"
source $SCRIPT_PATH/config.sh

exec docker -H unix://$ALTDOCKER_SOCKET "$@"

# EOF
