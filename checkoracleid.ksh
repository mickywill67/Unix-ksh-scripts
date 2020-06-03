#!/bin/ksh

HOST=`uname -n`
ORA_USER=`grep -c "^oracle" /etc/passwd`
APPL_USER=`grep -c "^applmgr" /etc/passwd`
LMS_USER=`grep -c "^lmsuser" /etc/passwd`

if [[ $ORA_USER -eq 1 || $APPL_USER -eq 1 || $LMS_USER -eq 1 ]]; then
   printf "$HOST \t" 
   if [[ $ORA_USER -eq 1 ]]; then
      printf "oracle \t"
   fi
   if [[ $APPL_USER -eq 1 ]]; then
      printf "applmgr \t"
   fi
   if [[ $LMS_USER -eq 1 ]]; then
      printf "lmsuser "
   fi
   printf "\n"
fi
