$departmentTXT = '88888888'
$users = Get-QADGroupMember -Identity "sg-cnf-aus-holding" -SizeLimit 0 -IncludedProperties departmentNumber | 
ForEach ($u in $users) {
 $u | Set-QADUser -departmentNumber $departmentTXT
 }