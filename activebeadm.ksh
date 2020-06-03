#!/bin/ksh

> /tmp/beadmlist.out

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then

   if [[ -f /usr/sbin/beadm ]]; then

      BACKUPCOUNT=`beadm list | grep "2019" | wc -l`
      print "$HOST"

      if [[ ${BACKUPCOUNT} -ge 1 ]]; then
         for BEANAME in `beadm list | tail -2 | grep "2018" | grep -v "NR" | awk '{ print $1 }'`; do
           beadm activate $BEANAME
   ##      print "beadm activate $BEANAME"
   ##      beadm list | egrep "2018|2019"
         done 
      else 
          print "$HOST is not patched"  
      fi
   fi
fi

