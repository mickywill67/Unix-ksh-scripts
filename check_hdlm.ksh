#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

HDLM=`df -h | grep -c "dev/mapper"`
if [[ ${HDLM} -gt 0 ]]; then
    print "$HOST  $HDLM" 
fi
