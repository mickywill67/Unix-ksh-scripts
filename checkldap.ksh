#!/bin/ksh


ldapsearch -b "OU=UnixGroups,OU=Security_Groups,OU=Groups_SC,DC=comfort,DC=com" -h scldap -D "CN=SvcAnsibleLDAP,OU=ServiceAccounts,OU=Users,OU=Corporate,DC=comfort,DC=com" -w  objectClass=group

for ((i=1; i < 11; i=i+1 )); do 
  nc -zv scldap 389
  sleep 2
done

