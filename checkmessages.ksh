#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`

if [[ "$OS" = "SunOS" ]]; then
    grep ntp /var/adm/messages
fi
if [[ "$OS" = "Linux" ]]; then
    grep ntp /var/log/messages | grep "frequency error"
fi

