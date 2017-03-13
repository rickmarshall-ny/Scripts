## Script will get e-mail addresses for all user ids in the file.csv

$users = ForEach ($user in $(Get-Content C:\Working\file.csv)) {

    Get-QAdUser $user 
        
}
    
 $users |
 Select-Object SamAccountName,Mail |
 Export-CSV -Path C:\Working\Outfile.csv -NoTypeInformation