#!/bin/bash
set -e

WORKDIR=/data
TARGET=''

[ $# -gt 0 ] && TARGET="$@"

cd $WORKDIR

for file in $TARGET; do
  REL_DIR=`dirname $file` MAIN=`basename $file` make
done
