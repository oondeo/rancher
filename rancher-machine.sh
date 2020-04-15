#!/bin/sh
cd /tmp &>> machine.log
echo $(/bin/date) - $* &>>  machine.log

if [ "$CUSTOM_ENGINE_INSTALL_URL" != "" ] && [ "$1" == "create" ]
then
rancher-machine.bin "$@" 2> machine-error.log
if [ "$?" != "0" ]
then 
    exit $?
fi
rancher-machine.bin ssh "${@: -1}" "curl -sfL $CUSTOM_ENGINE_INSTALL_URL | sh -"  &>>  machine.log
exit 0
else
exec rancher-machine.bin "$@" 2> machine-error.log
fi