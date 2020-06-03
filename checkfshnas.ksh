#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ "$OS" = "SunOS" ]]; then
 
   if df -h hnasprod1:/opsctr >/dev/null 2>&1 ; then
     print "\n$HOST  hnasprod mounted"
   fi   
fi
