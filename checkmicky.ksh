#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
   if [[ -f /export/home/willmj/.sh_history ]]; then
      print $HOST
      ls -l /export/home/willmj/.sh_history | egrep -v "2014|2015|2016" 
      ls /export/home/willmj | grep -v local
   fi
elif [[ $OS = "Linux" ]]; then
   if [[ -f /home/willmj/.sh_history ]]; then
      print $HOST
      ls -l /home/willmj/.sh_history | egrep -v "2014|2015|2016"
      ls /home/willmj | grep -v local
   fi
fi

