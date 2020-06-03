#!/bin/ksh

> /tmp/dflist.out


HOST=`uname -n`
OS=`uname -s`

if [[ -f /opt/pbis/bin/get-dc-name ]]; then
   DCNAME=`/opt/pbis/bin/get-dc-name comfort.com | grep pszDomainControllerName`
   DCMATCH=`echo $DCNAME | grep -vc HQDC0`
   if [[ $DCMATCH -gt 0 ]]; then  
      print $HOST, $DCNAME
   fi
elif [[ -f /opt/likewise/bin/lw-get-dc-name ]]; then
   DCNAME=`/opt/likewise/bin/lw-get-dc-name comfort.com | grep pszDomainControllerName`
   DCMATCH=`echo $DCNAME | grep -vc HQDC0`
   if [[ $DCMATCH -gt 0 ]]; then 
      print $HOST, $DCNAME
   fi
else
   print $HOST, "Power Broker not installed"
fi

