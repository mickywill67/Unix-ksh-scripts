#!/bin/ksh

HOST=`uname -n`
let I=1 
let J=1000

while (( I < 10 )); do


   LOAD=`w -u | head -1 | awk '{ print $NF }'`
   let ADJLOAD=$(($LOAD*100))
  ## print $I, $ADJLOAD
   if [[ $ADJLOAD -gt 1000 ]]; then 
      print "$HOST : $LOAD - avg load (15 min) is greater than 10"
   fi
   sleep 2
   let I=I+1

done
