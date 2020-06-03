#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
HOSTNAME=rhspocapp12
IP=10.7.49.123

if [[ $HOST == rhsprdapp11 ]]; then

   hammer -d host create --architecture-id 1 --name ${HOSTNAME} --organization-id 3 \
--location-id 4 --compute-profile "2-Medium" --hostgroup-id 1 \
--compute-resource-id 2 --provision-method build \
--lifecycle-environment-id 3 --content-view-id 9 \
--build true --enabled true --managed true \
--puppet-proxy-id 1 --partition-table-id 59 --medium-id 21 \
--operatingsystem-id 6 --environment-id 21 --domain-id 1 \
--interface "name=${HOSTNAME},ip=${IP},type=interface,managed=true,primary=true,provision=true,compute_type=VirtualVmxnet3,compute_network=CH3 Servers (748)" \
--compute-attributes="cpus=2,corespersocket=1,memory_mb=2048,cluster=Servers,path=vm/POC_Linux_Servers,guest_id=rhel7_64Guest,scsi_controller_type=ParaVirtualSCSIController,start=1" \
--volume="size_gb=50,datastore=CH3_NonProd_Server_Cluster,name=Hard disk,thin=false"
else
  print "buildLinuxVM script only works from rhsprdapp11"
fi

exit 1
## Parameters: {"utf8"=>"✓", "authenticity_token"=>"7w2IDLvfT1lSAn6SnPmEHsq4hRjv4AEG3/9+U/Ac5/0=",
## "content_facet_attributes"=>{ "id"=>""},
## "content_source_id"=>"1",
## "openscap_proxy_id"=>"",
## "progress_report_id"=>"[FILTERED]",
## "type"=>"Host::Managed",
## "interfaces_attributes"=>{"0"=>{"_destroy"=>"0", "type"=>"Nic::Managed", "mac"=>"", "identifier"=>"", "name"=>"rhspocapp12", "domain_id"=>"1", "subnet_id"=>"5", "ip"=>"10.7.49.123", "managed"=>"1", "primary"=>"1", "provision"=>"1", "execution"=>"1", "virtual"=>"0", "tag"=>"", "attached_to"=>"", "compute_attributes"=>{"type"=>"VirtualVmxnet3", "network"=>"dvportgroup-864"}}},
## "compute_attributes"=>{"cpus"=>"2", "corespersocket"=>"1", "memory_mb"=>"4096", "cluster"=>"Servers",
##      "resource_pool"=>"Resources",
##      "path"=>"/Datacenters/CenturyLink CH3/vm/POC_Linux_Servers",
##      "guest_id"=>"rhel7_64Guest", "scsi_controller_type"=>"ParaVirtualSCSIController",
##      "hardware_version"=>"Default", "memoryHotAddEnabled"=>"0", "cpuHotAddEnabled"=>"0",
##      "start"=>"1", 
##      "volumes_attributes"=>{"0"=>{"_delete"=>"", "storage_pod"=>"CH3_NonProd_Server_Cluster", 
##            "name"=>"Hard disk", "size_gb"=>"40", "thin"=>"false", "eager_zero"=>"false"}},
##      "image_id"=>"Templates/RHEL_7_X_64BIT_VLAN_748"}, 
##   "provision_method"=>"image",
##   "build"=>"0", "disk"=>"",
##   "root_pass"=>"[FILTERED]",
##   "is_owned_by"=>"9-Users",
##   "enabled"=>"1",
##   "comment"=>"", "overwrite"=>"false"}, 
## "capabilities"=>"build image", "provider"=>"Vmware", "bare_metal_capabilities"=>"build"}
