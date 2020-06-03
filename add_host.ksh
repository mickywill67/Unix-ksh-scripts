#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [ $# -lt 1 ];then
   printf "Usage: $0 {host_name} \n  Need a host name to add to inventory \n"
   exit 1
fi
if [[ "$OS" = "Linux" ]]; then
   cp /common/unixadmins/repos/SN-Unix/inventories/prod/hosts /tmp/hosts.orig
   cat /tmp/hosts.orig | sed -e "/\[new_build\]/a ${1}" > /common/unixadmins/repos/SN-Unix/inventories/prod/hosts
   ssh -q ansprdapp11 /common/unixadmins/micky/scripts/git_commit.ksh 
fi
