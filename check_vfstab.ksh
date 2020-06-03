#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then
   grep nas03 /etc/vfstab | grep common
   df -h /common | grep  nas03
elif [[ $OS = "Linux" ]]; then
   grep nas03 /etc/fstab | grep common
   df -h /common | grep  nas03
fi

