#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
HOSTNAME=rhspocapp12
IP=10.7.49.123

if [[ $HOST == rhsprdapp11 ]]; then

  hammer -d host create  \
--hostgroup-id 1 \
--name ${HOSTNAME} \
--compute-resource-id 2 --location-id 4 --organization-id 3 \
--interface "ip=${IP},network=CH3 Servers (748),type=interface,compute_type=VirtualVMxnet3,managed=true,primary=true,provision=true" \
--compute-attributes="cpus=2,corespersocket=1,memory_mb=2048,cluster=Servers,path=vm/POC_Linux_Servers,start=1" \
--partition-table-id 59 \
--volume="size_gb=50,datastore=CH3_NonProd_Server_Cluster,name=Hard disk,thin=false"
else
  print "buildLinuxVM script only works from rhsprdapp11"
fi

exit 1
##--build true --enabled true --managed true \
##--lifecycle-environment-id 3 --content-view-id 9 \
##--operatingsystem-id 6 --environment-id 21 --domain-id 1 \
##--puppet-proxy-id 1 --partition-table-id 59 --medium-id 21 \
##--compute-profile "2-Medium" \
##--architecture-id 1 --name ${HOSTNAME} \
