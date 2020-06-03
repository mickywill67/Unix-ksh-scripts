#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let sun_count=0
let lin_count=0
> /common/unixadmins/micky/lists/host.list.ldom.dbs

for HOST in `cat /common/unixadmins/micky/lists/host.list.sun.dbs`; do
    LDOM=`grep $HOST /common/unixadmins/micky/lists/final.list.out| awk '{print $1}'`
    echo $LDOM >> /tmp/host.list.ldom.dbs

done

sort -u /tmp/host.list.ldom.dbs > /common/unixadmins/micky/lists/host.list.ldom.dbs
