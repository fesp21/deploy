#!/bin/bash

# USAGE ./wake.sh <deploy_id>

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z $1 ]; then
    echo "Please provide deployment id as the first argument"
    exit 1
fi

DEPID=$1
# only run once at a time per app.
LOCKFILE="/tmp/wake-$DEPID.lock"
flock --nonblock $LOCKFILE /usr/bin/docker start devmon-$DEPID
