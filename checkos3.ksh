#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`

if [[ "$OS" = "SunOS" ]]; then
   REL=`pkg list entire | grep "entire" | awk '{ print $2 }'`
   print "$HOST $OS  $VER  $REL"
fi
if [[ "$OS" = "Linux" ]]; then
   LINUXVER=`cat /etc/redhat-release | awk '{print $7}'`
   print "$HOST  $OS   $LINUXVER"
fi

