#!/usr/bin/env -S bash -e
CWDIR=/tmp/run/user/$UID/wd
mkdir -p $(dirname $CWDIR)
touch $CWDIR
readlink -f /proc/self/cwd > $CWDIR

