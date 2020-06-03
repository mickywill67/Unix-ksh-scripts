#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -r`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then

      TEST=sun 

elif [[ $OS = "Linux" ]]; then
  
     IPADDR=`dig +short +domain=comfort.com $HOST`
     ETHER=`ip addr show to $IPADDR | grep UP | awk '{ print $2 }' | awk -F: '{ print $1}'`
     ls /etc/sysconfig/network-scripts/ifcfg-${ETHER}
     MATCH=`grep -c DNS /etc/sysconfig/network-scripts/ifcfg-${ETHER}`
     if [[ ${MATCH} -gt 0 ]]; then 
        cp /etc/sysconfig/network-scripts/ifcfg-${ETHER} /tmp/ifcfg-${ETHER}.orig
        sed -e "s/DNS1.*/DNS1=10.8.32.195/" /etc/sysconfig/network-scripts/ifcfg-${ETHER} | sed -e "s/DNS2.*/DNS2=10.7.32.195/" | sed -e "/DNS3.*/d" > /tmp/ifcfg-${ETHER}
        ## cp /tmp/ifcfg-${ETHER} /etc/sysconfig/network-scripts/ifcfg-${ETHER}
     else
        cp /etc/sysconfig/network-scripts/ifcfg-${ETHER} /tmp/ifcfg-${ETHER}.orig
        sed  "/BOOTPROTO/a DNS1=10.8.32.195\nDNS2=10.7.32.195" /etc/sysconfig/network-scripts/ifcfg-${ETHER} > /tmp/ifcfg-${ETHER}
        ## cp /tmp/ifcfg-${ETHER} /etc/sysconfig/network-scripts/ifcfg-${ETHER}
     fi 
    
fi
