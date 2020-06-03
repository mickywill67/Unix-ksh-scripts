#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

SPLUNKCOUNT=`ps -eaf | grep -c splunkd`

if [[ ${SPLUNKCOUNT} -gt 1 || -f /opt/splunkfordwarder/bin/splunkd ]]; then
   print "splunk installed on $HOST"
fi
