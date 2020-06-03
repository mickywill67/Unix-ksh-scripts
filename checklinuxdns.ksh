#!/bin/ksh

> /tmp/dflist2.out

HOST=`uname -n`
OS=`uname -s`


   DNS=`grep nameserver /etc/resolv.conf | grep -c 10.8.32.100` 
   DNSPROP=`grep nameserver /etc/resolv.conf`

   if [ ${DNS} -gt 0 ] ; then 
      print $HOST, $DNSPROP
   fi 


