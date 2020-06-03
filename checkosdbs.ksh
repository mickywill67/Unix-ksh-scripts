#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let sun_count=0
let lin_count=0

for HOST in `cat /common/unixadmins/micky/lists/host.list.dbs`; do

   OS=`ssh -q $HOST uname -s`
   if [[ "$OS" = "Linux" ]]; then
      let lin_count=lin_count+1
      print "$HOST"  >> /common/unixadmins/micky/lists/host.list.linux.dbs
   elif [[ "$OS" = "SunOS" ]]; then
      let sun_count=sun_count+1
      print "$HOST"  >> /common/unixadmins/micky/lists/host.list.sun.dbs
   fi
done
print " "
print "total linux servers " $lin_count
print "total solaris servers " $sun_count
