#!/bin/ksh

HOST=`uname -n`
ISHTTPD=`ps -e | grep -v grep | grep -c httpd`

if [[ $ISHTTPD -gt 1 ]]; then 
  print "$HOST has apache"
fi
