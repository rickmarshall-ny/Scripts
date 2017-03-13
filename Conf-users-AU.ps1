## AD Security Group User Listing Report
## This script will list the group membership of a specified security group and 
## Inlcude manager and memberof attributes - formated for easier reading.

Get-QADGroupMember -Identity "sg-cnf-aus-88888888" -SizeLimit 0 -IncludedProperties division,employeeType,StateOrProvince,departmentNumber,physicalDeliveryOfficeName,co,employeeType,manager | 
Select samAccountName,Name,PrimarySMTPAddress,PhoneNumber,Title,division,department,departmentNumber,streetAddress,City,StateOrProvince,co,postalCode,company,physicalDeliveryOfficeName,employeeType,@{name=’manager’;Expression={((($_.manager).substring(3)) -replace '(.+?),.+','$1' )}}, @{name=’memberOf’;Expression={[string]::join(“;”, ((($_.memberOf).substring(3)) -replace '(.+?),.+','$1' ))}}  | 
Export-CSV -Path c:\working\sg-cnf-employees-au.csv -NoTypeInformation