#!/bin/ksh

HOST=`uname -n`

if [[ -f /opt/pbis/bin/get-status ]]; then
   STATUS=`/opt/pbis/bin/get-status | grep Status | grep -v LSA | awk '{ print $2 }'| head -1`
   if [[ $STATUS != "Online"  ]]; then  
      printf "PowerBroker down on $HOST\n" 
   fi
elif [[ -f /opt/likewise/bin/lw-get-status ]]; then
   STATUS=`/opt/likewise/bin/lw-get-status | grep Status | grep -v LSA | awk '{ print $2 }' | head -1`
   if [[ $STATUS != "Online" ]]; then 
      printf "Likewise down on $HOST\n"
   fi
else
   printf "Power Broker not installed on $HOST\n"
fi

