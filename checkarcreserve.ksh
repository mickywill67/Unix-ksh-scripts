#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then

   if  [[ -a /dev/ksyms ]]; then
      LINE=`echo user_reserve_hint_pct/D | mdb -k | tail -1 | nawk '{print $2}'`
      set -A NUMBER $LINE
      if [[ ${NUMBER} -eq 90 ]]; then
         print "$HOST  $NUMBER"
      fi
###      VALUE=`grep -c "user_reserve_hint_pct=90" /etc/system`
###      set -A NUMB $VALUE
###      if [[ ${NUMB} -eq 1 ]]; then
###         print "$HOST  user_reserve_hint_pct in /etc/system at 90" 
###      fi
   fi
fi
