#!/bin/ksh

HOST=`uname -n`

if df -h /ebsprd1_rman 2>/dev/null ; then
   print $HOST
fi   
