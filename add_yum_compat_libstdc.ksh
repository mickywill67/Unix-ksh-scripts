#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -r`
DATE=`date '+%m%d%Y'`

if [[ $OS = "Linux" ]]; then
   VERS=`cat /etc/redhat-release | awk '{ print $7 }'`
   if [[ "${VERS:0:1}" = "7" ]]; then
##       yum install --assumeyes --nogpgcheck /common/unixadmins/julian/compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
##      yum -y install open-vm-tools OpenIPMI
      yum install --assumeyes --nogpgcheck /common/unixadmins/julian/compat-libstdc++-33-3.2.3-72.el7.i686.rpm
      touch /etc/sysconfig/64bit_strstr_via_64bit_strstr_sse2_unaligned
   else
      print "not for RHEL 6"
      exit 1
   fi

fi
