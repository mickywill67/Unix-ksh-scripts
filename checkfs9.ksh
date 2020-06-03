#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

   if [[ $OS = "SunOS" ]]; then
        /common/unixadmins/micky/scripts/checksunfs9.ksh

   elif [[ $OS = "Linux" ]]; then
        /common/unixadmins/micky/scripts/checklinuxfs9.ksh
   fi
