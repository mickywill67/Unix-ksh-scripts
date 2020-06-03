#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ -d /opt/DynamicLinkManager ]]; then
 print "$HOST  has HDLM "
fi
