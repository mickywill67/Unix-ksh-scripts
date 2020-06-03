#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
APP_USER=`grep -c "^applmgr" /etc/passwd`

if [[ $OS = "SunOS" ]]; then
    if [[ $APP_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -s applmgr | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - applmgr id locked"
       fi
    fi
fi
if [[ $OS = "Linux" ]]; then
    if [[ $APP_USER -eq 1 ]]; then
       IDSTATUS=`/usr/bin/passwd -S applmgr | awk '{ print $2 }'`
       if [[ $IDSTATUS = "LK" ]]; then
          print "$HOST - applmgr id locked"
       fi
    fi
fi

