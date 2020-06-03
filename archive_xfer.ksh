#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
CURDATE=`date '+%Y'`

if [[ "$OS" = "SunOS" ]]; then

   if [[ -d /xfer/inbound/scm ]]; then
      if [ -n "$(find /xfer/inbound/scm/archive -mtime +364 -type f 2>/dev/null)" ]; then
         print "inbound files archived"
         if [[ ! -d /xfer/inbound/scm/archive.${CURDATE} ]]; then
            mkdir /xfer/inbound/scm/archive.${CURDATE}
            chown applmgr:oinstall /xfer/inbound/scm/archive.${CURDATE}
            chmod 775 /xfer/inbound/scm/archive.${CURDATE}
         fi 
         find /xfer/inbound/scm/archive -mtime +364 -type f -exec mv {} /xfer/inbound/scm/archive.${CURDATE} \;
      else
         print "no inbound files found"
      fi

      if [ -n "$(find /xfer/outbound/scm/archive -mtime +364 -type f 2>/dev/null)" ]; then
         print "outbound files archived"
         if [[ ! -d /xfer/outbound/scm/archive.${CURDATE} ]]; then
            mkdir /xfer/outbound/scm/archive.${CURDATE}
            chown applmgr:oinstall /xfer/outbound/scm/archive.${CURDATE}
            chmod 775 /xfer/outbound/scm/archive.${CURDATE}
         fi 
         find /xfer/outbound/scm/archive -mtime +364 -type f -exec mv {} /xfer/outbound/scm/archive.${CURDATE} \;
      else 
         print "no outbound files found "
      
      fi
   fi
fi

