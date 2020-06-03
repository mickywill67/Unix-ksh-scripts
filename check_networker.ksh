#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ "$OS" = "SunOS" ]]; then
    NETWVER=`pkginfo -x LGTOclnt | awk '{ print $NF }' | tail -1`
    if [[ "$NETWVER" != "9.1.1.3.Build.189" ]]; then
         print "$HOST  version -- $NETWVER" 
    fi

fi
if [[ "$OS" = "Linux" ]]; then
    NETWVER=`rpm -q lgtoclnt | awk -F\- '{print $2}'`
    if [[ "$NETWVER" != "9.1.1.3" ]]; then
         print "$HOST  version -- $NETWVER" 
    fi

fi
