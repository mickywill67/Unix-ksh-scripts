#!/bin/ksh

HOST=`uname -n`
##OS=`uname -s`

printf "\r $HOST              "

if [[ -f /opt/pbis/bin/get-status ]]; then
   STATUS=`/opt/pbis/bin/get-status | grep Status | grep -v LSA | awk '{ print $2 }'| head -1`
   if [[ $STATUS != "Online"  ]]; then  
      printf "\nPowerBroker down on $HOST\n" 
   fi
elif [[ -f /opt/likewise/bin/lw-get-status ]]; then
   STATUS=`/opt/likewise/bin/lw-get-status | grep Status | grep -v LSA | awk '{ print $2 }' | head -1`
   if [[ $STATUS != "Online" ]]; then 
      printf "\nLikewise down on $HOST\n"
   fi
else
   printf "\nPower Broker not installed on $HOST\n"
fi

