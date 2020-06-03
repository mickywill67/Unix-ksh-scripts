#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ "$OS" = "Linux" ]]; then
   print $HOST
   grep DNS /etc/sysconfig/network-scripts/ifcfg*ch3
fi
