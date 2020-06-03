#!/bin/ksh
OS=`uname -s`

#if [[ $OS = "SunOS" ]]; then
#	cp /etc/vfstab /etc/vfstab.bak
#	sed 's/nas03\:\/dbadmin/nasprod\:\/dbadmin/' /etc/vfstab.bak > /etc/vfstab
#	umount /dbadmin
#	mount /dbadmin
#elif [[ $OS = "Linux" ]]; then
#	cp /etc/fstab /etc/fstab.bak
#	sed 's/nas03\:\/dbadmin/nasprod\:\/dbadmin/' /etc/fstab.bak > /etc/fstab
#	umount /dbadmin
#	mount /dbadmin
#fi
MOUNTSTATUS=`df -h | grep -c nasprod:/dbadmin`
if [[ $MOUNTSTATUS -gt 0 ]]; then
	echo "`hostname` /dbadmin fix was successfull" >> /common/unixadmins/julian/dbadminupdate_log
else
	echo "`hostname` /dbadmin fix FAILED" >> /common/unixadmins/julian/dbadminupdate_log
fi
