#!/bin/ksh

> /tmp/beadmlist.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   if [[ -f /usr/sbin/beadm ]]; then

      BACKUPCOUNT=`beadm list -H | grep -c "\;\;\;"`

      if [[ ${BACKUPCOUNT} -ge 1 ]]; then
         for BEANAME in `beadm list -H | grep "\;\;\;" | awk -F\; '{ print $1 }'`; do
            printf " $HOST    "
            print "extra boot env -  ${BEANAME}"
##           /usr/sbin/beadm destroy -F ${BEANAME}
         done   
      fi
   fi
fi

