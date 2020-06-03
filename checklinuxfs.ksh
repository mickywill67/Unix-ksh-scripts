#!/bin/ksh

> /tmp/dflist2.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

    print "$0 doesn't run on Solaris"     

elif [[ $OS = "Linux" ]]; then
  
   df --type=xfs --type=ext3 --type=ext4 -hlP | tail -n+2 | awk '{$5=substr($5,0,length($5)-1); print $6,$5}' >>/tmp/dflist2.out
   
   while read j ; do
      set -A NUMBER $j

      if [[ ${NUMBER[1]} -gt 90 ]] ; then
         print $HOST, $j >> /common/unixadmins/micky/lists/dflist3.out  
      fi 

    done < /tmp/dflist2.out

##    cat /common/unixadmins/micky/lists/dflist3.out 

fi
