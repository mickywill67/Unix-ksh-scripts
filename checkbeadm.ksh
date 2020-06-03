#!/bin/ksh

> /tmp/beadmlist.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   if [[ -f /usr/sbin/beadm ]]; then

##         for BEANAME in `beadm list | tail +3 | grep -v N | grep -v R | awk '{ print $1 }'`; do
         for BEANAME in `beadm list | tail +3 | grep -v NR | awk '{ print $1 }'`; do
            printf " $HOST    "
    ##        print "extra beadm ${BEANAME}"
            /usr/sbin/beadm list | grep "${BEANAME} " 
         done   
   fi
fi

