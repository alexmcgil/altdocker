#!/bin/bash
set -e

SCRIPT_PATH="$(dirname $(readlink -f $BASH_SOURCE))";
SCRIPT_NAME="$(basename $BASH_SOURCE)"

ALTDOCKER_NAME="${SCRIPT_NAME%%.sh}"
source $SCRIPT_PATH/config.sh

# Set up bridge network
if ! brctl showmacs $ALTDOCKER_BRIDGE > /dev/null 2>&1
then
   brctl addbr $ALTDOCKER_BRIDGE
   ip link set dev $ALTDOCKER_BRIDGE up
fi

# Prepare runtime dirs
mkdir -p $ALTDOCKER_ROOT \
	$ALTDOCKER_EXEC_ROOT \
	$ALTDOCKER_GRAPH \
;

# Run docker daemon
exec dockerd \
  -s overlay2 \
  --bridge=$ALTDOCKER_BRIDGE \
  --exec-root=$ALTDOCKER_EXEC_ROOT \
  --graph=$ALTDOCKER_GRAPH \
  --host=unix://$ALTDOCKER_SOCKET \
  --pidfile=$ALTDOCKER_PIDFILE \
  "$@" \
;

# EOF
