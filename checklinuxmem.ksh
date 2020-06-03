#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "Linux" ]]; then

   MEMORY=`free -h | grep "Mem:" | awk '{ print $2 }'`

   print "$HOST - $MEMORY "
fi
