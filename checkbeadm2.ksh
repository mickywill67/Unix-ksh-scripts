#!/bin/ksh

> /tmp/beadmlist.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   if [[ -f /usr/sbin/beadm ]]; then

      BACKUPCOUNT=`beadm list | grep "2019-06" | wc -l`

      if [[ ${BACKUPCOUNT} -ge 1 ]]; then
         for BEANAME in `beadm list | grep "2019-06" | awk '{ print $1 }'`; do
            print " $HOST   $BEANAME    "
         done 
      else 
          print "$HOST is not patched"  
      fi
   fi
fi

