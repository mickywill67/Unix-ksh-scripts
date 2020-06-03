#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
   PIDS=`ps -eaf | grep cohes | grep -v grep | awk '{ print $2 }'`
   if [[ ! -z "${PIDS}" ]]; then 
      COHESPIDS=$(echo $PIDS | sed "s# #,#g")
      MEMPER=`prstat -a -p ${COHESPIDS} 2 1 | grep root | tail -1 | awk '{ print $5 }'`
      MEMUSED=`echo $MEMPER | awk -F\. '{ print $1 }'`
##      if [[ $MEMUSED -gt 29 ]]; then
        print "$HOST   $MEMPER"
##      fi
   fi 
fi
