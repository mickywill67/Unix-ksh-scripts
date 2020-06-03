#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
    print "$HOST - "
   /usr/sbin/ldm list
    print  " " 
fi

