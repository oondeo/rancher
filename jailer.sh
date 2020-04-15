#!/bin/bash
set -e

NAME=$1

if [[ -z "$1" ]]
  then
    echo "No name supplied"
    exit 1
fi
mkdir -p /opt/jail/$NAME/usr/bin
mkdir -p /opt/jail/$NAME/bin
mkdir -p /opt/jail/$NAME/tmp
chmod 1777 /opt/jail/$NAME/tmp

cp -l /bin/date /opt/jail/$NAME/bin
cp -l /bin/bash /opt/jail/$NAME/bin
cp -l /usr/bin/rancher-machine.bin /opt/jail/$NAME/usr/bin

exec /usr/bin/jailer.sh.bin $*