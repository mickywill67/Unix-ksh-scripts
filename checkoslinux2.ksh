#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`

if [[ "$OS" = "Linux" ]]; then
   LINUXVER=`cat /etc/redhat-release | awk '{print $7}'`
   print "$HOST  $LINUXVER"
fi

