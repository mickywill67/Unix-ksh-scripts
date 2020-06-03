#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`

if [[ "$OS" = "Linux" ]]; then
   LGTOINSTALL=`rpm -q lgtoclnt`
   if [ `rpm -q lgtoclnt` ]; then 
     print "installed"
     exit 0
   else
     print "not installed" 
     exit 1
   fi
fi
exit 1 
