#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
   PIDS=`ps -eaf | grep telegr | grep -v grep | awk '{ print $2 }'`
   if [[ ! -z "${PIDS}" ]]; then 
      COHESPIDS=$(echo $PIDS | sed "s# #,#g")
      MEMPER=`prstat -a -p ${COHESPIDS} 2 1 | grep telegraf | tail -1`
      MEMUSED=`echo $MEMPER | awk '{ print $5 }' | awk -F\. '{ print $1 }'`
      CPUUSED=`echo $MEMPER | awk '{ print $7 }'`
        print " SERVER   CPU    MEMORY"
        print "------- ------- --------"
        print "$HOST  $CPUUSED  $MEMUSED"
   fi 
fi
