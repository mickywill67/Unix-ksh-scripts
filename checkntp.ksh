#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ "$OS" = "SunOS" ]]; then
   NTPSERVER=`grep -c "ntp.comfort.com" /etc/inet/ntp.conf`
   if [[ $NTPSERVER -eq 1 ]]; then
      print "$HOST - ntp.conf using ntp.comfort.com "
   fi
   NTPSTATE=`svcs -H svc:/network/ntp:default | awk '{ print $1 }'`
   if [[ "$NTPSTATE" != "online" ]]; then
       print "$HOST - need to check and restart ntp service"
##       ntpdate -q ntp1
   fi
##   ntpq -p
elif [[ "$OS" = "Linux" ]]; then
   NTPSERVER=`grep -c "ntp.comfort.com" /etc/ntp.conf`
   if [[ $NTPSERVER -eq 1 ]]; then
      print "$HOST ntp.conf using ntp.comfort.com "
   fi
   if /sbin/service ntpd status >/dev/null 2>&1 ; then
       TEST="good"
   else
      print "$HOST - linux NTP not running"
##      ntpdate -q ntp1
   fi
fi
##NTPSERVER=`ntpq -p ntp2 | grep -c "ntpprdinf11"`
##if [[ $NTPSERVER -eq 1 ]]; then
##    print "$HOST ntp peer is using ntpprdinf11.comfort.com "
##fi
