#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DELPHIX_USER=`grep -c "^delphix" /etc/passwd`

if [[ $OS = "SunOS" ]]; then
    if [[ $DELPHIX_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -s delphix | awk '{ print $2 }'`
       print "$HOST - delphix id $IDSTATUS"
    fi
fi
if [[ $OS = "Linux" ]]; then
    if [[ $DELPHIX_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -S delphix | awk '{ print $2 }'`
       print "$HOST - delphix id $IDSTATUS"
    fi
fi

