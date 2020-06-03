#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

OR_CHK=`grep -c "^oracle" /etc/passwd`
if [ $OR_CHK -gt 0 ]; then
   ORA_HM=`grep "^oracle" /etc/passwd | awk -F: '{ print $6 }'`
   if [ -z ${ORA_HM} ];then 
      print " Oracle home is not set "
      exit 1
   fi

   if [[ -f $ORA_HM/.ssh/authorized_keys ]]; then
      ORCRED=`grep -c ansprdapp11 $ORA_HM/.ssh/authorized_keys`
      if [[ $ORCRED -eq 0 ]]; then
         cat /common/unixadmins/micky/scripts/ans-ora.cred >> ${ORA_HM}/.ssh/authorized_keys
         print "$HOST oracle authorized_keys updated"
      fi
   else
      mkdir -p ${ORA_HM}/.ssh
      chown oracle:oinstall ${ORA_HM}/.ssh
      
      cat /common/unixadmins/micky/scripts/ans-ora.cred >> ${ORA_HM}/.ssh/authorized_keys 
      chown oracle:oinstall ${ORA_HM}/.ssh/authorized_keys
      print "$HOST oracle ${ORA_HM}/.ssh/authorized_keys created"
   fi
else
   print "oracle user not in password file" 
fi
