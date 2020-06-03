#!/bin/ksh

> /tmp/beadmlist.out

HOST=`uname -n`
OS=`uname -s`
VERS=`uname -v| cut -c1-4`
DATE=`date '+%m%d%Y'`

if [[ $OS = "SunOS" ]]; then
   if [[ $VERS = "11.3" ]]; then 
      exit 0
   fi
   if [[ -f /usr/sbin/beadm ]]; then

      BACKUPCOUNT=`beadm list | grep "2019" | wc -l`

      if [[ ${BACKUPCOUNT} -ge 1 ]]; then
         for BEANAME in `beadm list | tail -2 | grep "2018" | grep -v "NR" | awk '{ print $1 }'`; do
            beadm mount $BEANAME /mnt
            if /usr/gnu/bin/diff -q /etc/vfstab /mnt/etc/vfstab; then
                print " $HOST   vfstab not changed "
                ls -l /etc/vfstab /mnt/etc/vfstab 
            else
                print " $HOST   $BEANAME    "
                ls -l /etc/vfstab /mnt/etc/vfstab 
         ##       cp /mnt/etc/vfstab /mnt/etc/vfstab.${DATE}
                ls -l /mnt/etc/vfstab.${DATE}
         ##        cp /etc/vfstab /mnt/etc/vfstab
                print "copy /etc/vfstab /mnt/etc/vfstab"
            fi
            beadm unmount $BEANAME
         done 
      else 
          print "$HOST is not patched"  
      fi
   fi
fi

