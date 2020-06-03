#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS == "SunOS" ]]; then
   if pkg list git 2>/dev/null; then
      print "git installed"
   fi
fi

