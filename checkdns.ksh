#!/bin/ksh

> /tmp/dflist.out
> /tmp/dflist2.out

TEST=1

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   DNSPROP=`svccfg -s network/dns/client listprop config/nameserver`
   DNS=`svccfg -s network/dns/client listprop config/nameserver | grep -c 10.8.32.100`

   if [ ${DNS} -gt 0 ] ; then
      print $HOST, $DNSPROP  
       
   fi 

elif [[ $OS = "Linux" ]]; then

     DNS=`grep nameserver /etc/resolv.conf | grep -c 10.8.32.100`
     if [ ${DNS} -gt 0 ] ; then
        ##for IFCFGNAME in `ls /etc/sysconfig/network-scripts/ifcfg* ` ; do
        ##   DNSCFG=`grep DNS[1-3] ${IFCFGNAME} | grep -c 10.8.32.100`
        ##   DNSSAVE=`grep -h DNS[1-3] ${IFCFGNAME}`
        ##   if [ ${DNSCFG} -gt 0 ] ; then 
        ##      print $HOST, $DNSSAVE
        ##   fi
        ##done
        print "$HOST -- check resolv.conf"
     fi
fi

