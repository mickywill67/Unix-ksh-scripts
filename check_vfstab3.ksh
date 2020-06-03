#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then
   print "$HOST"
   df -h | grep -i chstych3pci
   df -h | grep -i chstymp2pci
elif [[ $OS = "Linux" ]]; then
   print "$HOST"
   df -h | grep -i chstych3pci
   df -h | grep -i chstymp2pci
fi
