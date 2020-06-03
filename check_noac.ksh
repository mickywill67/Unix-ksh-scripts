#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

MOUNTINFO=`mount | grep noac | grep common`

if [[ -n $MOUNTINFO ]]; then 
   umount /common
   sleep 1
   mount /common
   print "$HOST  --  $MOUNTINFO"

   
fi

if [[ $OS = "SunOS" ]]; then
   FSTABINFO=`grep noac /etc/vfstab`
   if [[ -n $FSTABINFO ]]; then
      print "$HOST -- $FSTABINFO"
   fi
elif [[ $OS = "Linux" ]]; then
   FSTABINFO=`grep noac /etc/fstab`
   if [[ -n $FSTABINFO ]]; then
      print "$HOST -- $FSTABINFO"
   fi
fi
