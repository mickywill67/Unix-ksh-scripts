#!/bin/ksh

> /tmp/checkmessage.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
     grep scsi /var/adm/messages | grep WARNING >> /tmp/checkmessage.out

elif [[ $OS = "Linux" ]]; then
     grep scsi /var/log/messages | grep WARNING >> /tmp/checkmessage.out
fi


if [[ -s /tmp/checkmessage.out ]]; then
   cat /tmp/checkmessage.out >> /common/unixadmins/micky/lists/chkmess.out
fi
