#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
DATE=`date '+%m%d%Y'`

if [[ "$OS" = "SunOS" ]]; then
   
   OPSCHK=`grep -c "oracle-oem-oc-mgmt-opsctrapp" /etc/inet/hosts`
   if [[ $OPSCHK -eq 1 ]]; then
      OPSIP=`grep "oracle-oem-oc-mgmt-opsctrapp" /etc/inet/hosts | awk '{ print $1 }'`
      if [[ "$OPSIP" = "10.7.49.88" ]]; then
         sed -e "s/10.7.49.88/10.6.49.88/g" /etc/inet/hosts  > /etc/inet/hosts.fixops
         cp /etc/inet/hosts /etc/inet/hosts.$DATE
         cp /etc/inet/hosts.fixops /etc/inet/hosts
         print "$HOST "
         grep "oracle-oem-oc-mgmt-opsctrapp" /etc/inet/hosts  
      fi
   fi
fi
