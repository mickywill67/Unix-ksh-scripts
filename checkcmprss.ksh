#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   for POOL in `zpool list -H -o name | grep -v swap | grep -v "^rpool"`; do
      COMPRS=`zfs get -H compression $POOL | awk '{ print $3 }'`
      if [[ $COMPRS = "off" ]]; then
         echo "$HOST - $POOL compression is off"
##    else
##       echo "$POOL compression is on"
      fi
   done
   
fi
