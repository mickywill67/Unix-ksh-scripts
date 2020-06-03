#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then
   COUNT=`df -h | grep -c -i regalpay`
elif [[ $OS = "Linux" ]]; then
   COUNT=`df -h | grep -c -i regalpay`
fi
if [[ $COUNT -gt 0 ]]; then
   print $HOST
fi
