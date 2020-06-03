#!/bin/ksh

HOST=`uname -n`
DT_USER=`grep -c "^informat" /etc/passwd`

if [[ $DT_USER -eq 1 ]]; then
   print "$HOST - informat exists " 
   grep informat /etc/passwd
fi
