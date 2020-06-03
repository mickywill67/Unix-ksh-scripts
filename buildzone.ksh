#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $# -lt 4 ]]; then
  print "Need 4 arguments passed to script "
  exit 1
fi

if [[ $HOST == zoneprdhst?? ]]; then
   hostname=$1
   zoneip=$2
   vcpu=$3
   let memory=$4
   let swap=memory+memory

print " $HOST  $hostname $zoneip $vcpu $memory $swap "
   ##
   ##  zpool create $hostname
   ## 
   ##  zfs create $hostname/ROOT
   ##  
   ##  zonecfg -z $hostname
   ##     create
   ##     set zonepath=/$hostname/ROOT
   ##     set autoboot=true
   ##     add net
   ##     set address=$zoneip
   ##     set physical=net0
   ##     end
   ##     add capped-cpu
   ##     set ncpus=vcpu
   ##     end
   ##     add capped-memory
   ##     set physical=${memory}G
   ##     set swap=${swap}G 
   ##     verify
   ##     commit
   ##     exit
   ##
   ##  
fi
