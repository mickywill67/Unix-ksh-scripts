#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
APPL_USER=`grep -c "^applmgr" /etc/passwd`

if [[ $OS = "SunOS" ]]; then
    if [[ $APPL_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -s applmgr | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - applmgr id locked"
       fi
    fi
fi
if [[ $OS = "Linux" ]]; then
    if [[ $APPL_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -S applmgr | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - applmgr id locked"
       fi
    fi
fi

