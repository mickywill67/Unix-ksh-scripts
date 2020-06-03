#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`

if [[ "$OS" = "SunOS" ]]; then
   if [[ "$VER" != "11.3" ]]; then
      print "$HOST  $VER"
   fi
fi
if [[ "$OS" = "Linux" ]]; then
   LINUXVER=`cat /etc/redhat-release | awk '{print $7}'`
   if [[ "$LINUXVER" != "6.8" ]]; then
      print "$HOST  $LINUXVER"
   fi
fi

