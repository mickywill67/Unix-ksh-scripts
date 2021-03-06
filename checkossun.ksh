#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let count=0
> /common/unixadmins/micky/lists/host.list.solaris

for HOST in `cat /common/unixadmins/micky/lists/host.list`; do

   OS=`ssh -q $HOST uname -s`
   if [[ "$OS" = "SunOS" ]]; then
      let count=count+1
      print "$HOST"  >> /common/unixadmins/micky/lists/host.list.solaris
   fi
done
print " "
print "total Solaris servers" $count
