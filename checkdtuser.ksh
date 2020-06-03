#!/bin/ksh

HOST=`uname -n`
DT_USER=`grep -c "^dtuser" /etc/passwd`

if [[ $DT_USER -eq 1 ]]; then
   print "$HOST - dtuser exists " 
   grep dtuser /etc/passwd
fi
