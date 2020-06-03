#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

GPGMOUNT=`df -h | grep -ci gpg`

if [[ $GPGMOUNT -gt 0 ]]; then
   GPG=`df -h | grep gpg`
   print $HOST $GPG 
fi
