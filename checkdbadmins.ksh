#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
    DBADMINS=`grep -v "^#" /etc/vfstab | grep -c dbadmin` 
    if [[ $DBADMINS -gt 0 ]]; then 
       print $HOST >> /common/unixadmins/micky/lists/host.list.dbadmins
    fi
elif [[ $OS = "Linux" ]]; then
    DBADMINS=`grep -v "^#" /etc/fstab | grep -c dbadmin` 
    if [[ $DBADMINS -gt 0 ]]; then 
       print $HOST >> /common/unixadmins/micky/lists/host.list.dbadmins
    fi
fi

