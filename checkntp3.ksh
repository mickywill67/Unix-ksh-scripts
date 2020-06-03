#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
OSVER=`uname -r`

if [[ "$OS" = "SunOS" ]]; then
   if [[ $OSVER = "5.10" ]]; then
      exit 0 
   fi 
   if [[ -x /usr/sbin/ntpq ]]; then
      NTPSTATE=`svcs -H svc:/network/ntp:default | awk '{ print $1 }'`
      if [[ "$NTPSTATE" != "online" ]]; then
          print "$HOST - need to check and restart ntp service"
      else 
         for VAL in `ntpq -p | egrep -v "==|remote" | awk '{ print $9 }' | awk -F\. '{ print $1 }'` ; do
            let NTPVAL=$(( abs($VAL) ))
            if [[ $NTPVAL -gt 200 ]]; then 
               print "$HOST NTP offset =  $VAL"
            fi
         done
      fi
   fi
elif [[ "$OS" = "Linux" ]]; then
   if /sbin/service ntpd status >/dev/null 2>&1 ; then
      for VAL in `ntpq -p | egrep -v "==|remote" | awk '{ print $9 }' | awk -F\. '{ print $1 }'` ; do
         let NTPVAL=$(( abs($VAL) ))
         if [[ $NTPVAL -gt 200 ]]; then 
            print "$HOST NTP offset  =  $VAL "
         fi
      done
   elif /sbin/service chronyd status > /dev/null 2>&1 ; then
      for VAL in `chronyc ntpdata | grep Offset | awk '{ print $3 }'` ; do
        let NTPVAL=$(( abs($VAL) ))
        if [[ $NTPVAL -gt 200 ]]; then
            print "$HOST NTP offset =  $VAL "
        fi
      done
   else 
      print "$HOST - linux NTP and chronyd not running"
   fi
fi
