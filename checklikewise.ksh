#!/bin/ksh

HOST=`uname -n`
##OS=`uname -s`


if [[ -f /opt/likewise/bin/lw-get-status ]]; then
   printf "\nLegacy Likewise install on $HOST\n"
fi

