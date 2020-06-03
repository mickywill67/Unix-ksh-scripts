#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
ORA_USER=`grep -c "^oracle" /etc/passwd`

if [[ $OS = "SunOS" ]]; then
    if [[ $ORA_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -s oracle | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - oracle id locked"
       fi
    fi
fi
if [[ $OS = "Linux" ]]; then
    if [[ $ORA_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -S oracle | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - oracle id locked"
       fi
    fi
fi

