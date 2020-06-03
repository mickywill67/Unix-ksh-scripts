#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

CRED=`grep -c ansprdapp11 /root/.ssh/authorized_keys`
if [[ $CRED -eq 0 ]]; then
   cat /common/unixadmins/micky/scripts/ansible.cred >> /root/.ssh/authorized_keys
   print "$HOST authorized_keys updated"
fi
