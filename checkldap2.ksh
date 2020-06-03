#!/bin/ksh


##ldapsearch -b "OU=UnixGroups,OU=Security_Groups,OU=Groups_SC,DC=comfort,DC=com" -h scldap -D "CN=JenkinsLDAP,OU=Service_Users,OU=Users_SC,DC=comfort,DC=com" -w Th1s!sN0t objectClass=group
##ldapsearch  -b "OU=Corporate,DC=comfort,DC=com" -h scldap -D "CN=JenkinsLDAP,OU=Service_Users,OU=Users_SC,DC=comfort,DC=com" -w "Th1s!sN0t" "(& (userPrincipalName=willmj@comfort.com)(objectCategory=user))"
##ldapsearch -b "OU=Corporate,DC=comfort,DC=com" -h scldap.comfort.com -D "CN=JenkinsLDAP,OU=Service_Users,OU=Users_SC,DC=comfort,DC=com" -w "Th1s!sN0t" "(& (sAMAccountName=willmj)(objectCategory=user))"
ldapsearch -h scldap.comfort.com -b "OU=Groups_SC,DC=comfort,DC=com" -D "CN=JenkinsLDAP,OU=Service_Users,OU=Users_SC,DC=comfort,DC=com" -w "Th1s!sN0t" "(& (sAMAccountName=Jenkins Admins)(objectCategory=group))"

for ((i=1; i < 3; i=i+1 )); do 
  nc -zv scldap 389
  sleep 1
done

