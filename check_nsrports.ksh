#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

 
if [[ -x /usr/bin/nsrports ]]; then
   PORTRANGE=`/usr/bin/nsrports | grep Service | awk -F\: '{ print $2 }'`
   HIGHPORT=`echo $PORTRANGE | awk -F\- '{ print $2 }'`
   if [[ $HIGHPORT -eq "9936" ]]; then
      echo "port range is $PORTRANGE on $HOST"
   fi
fi
