#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS == "SunOS" ]]; then
    print " Host - $HOST "
    pkg list PBISEnterprise.sparc | tail -1 
else
   print "not solaris"
fi

