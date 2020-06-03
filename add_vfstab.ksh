#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then
   if [[ ! -d /scbackup ]]; then
      mkdir /scbackup
      cp /etc/vfstab /etc/vfstab.$DATE
      echo "znasprdch3:/export/backups -  /scbackup nfs - yes rw,bg,hard,nointr,rsize=1048576,wsize=1048576,forcedirectio" >> /etc/vfstab
      mount /scbackup
    fi
elif [[ $OS = "Linux" ]]; then
   if [[ ! -d /scbackup ]]; then
      mkdir /scbackup
      cp /etc/fstab /etc/fstab.$DATE
      echo "znasprdch3:/export/backups      /scbackup       nfs     _netdev,rw,bg,hard,nointr,rsize=1048576,wsize=1048576" >> /etc/fstab
      mount /scbackup
   fi
fi 
