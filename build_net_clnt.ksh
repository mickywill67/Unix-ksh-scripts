#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`

ssh -q hqbackup /usr/sbin/nsradmin -i /common/unixadmins/micky/out/networker-clnt.out

##ssh -q hqbackup /bin/cat /common/unixadmins/micky/out/networker-clnt.out
