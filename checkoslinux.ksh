#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let count=0
> /common/unixadmins/micky/lists/host.list.linux

for HOST in `cat /common/unixadmins/micky/lists/host.list`; do

   OS=`ssh -q $HOST uname -s`
   if [[ "$OS" = "Linux" ]]; then
      let count=count+1
      print "$HOST"  >> /common/unixadmins/micky/lists/host.list.linux
   fi
done
print " "
print "total linux servers" $count
