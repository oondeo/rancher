#!/bin/bash
cd /tmp
echo $* >> machine.log
rancher-machine.bin "$@" 
if [ "$?" != "0" ]
then 
    exit $?
fi
if [ "$CUSTOM_ENGINE_INSTALL_URL" != "" ] && [ "$1" == "create" ]
then
rancher-machine.bin ssh "${@: -1}" "curl -sfL $CUSTOM_ENGINE_INSTALL_URL | sh -"  &>> machine.log
fi