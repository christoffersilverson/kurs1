Get-ADDomain
Get-Command -Verb Get -Module ActiveDirectory
Get-ADUser -filter 'SamAccountName -eq "administrator"'
Get-ADComputer $env:COMPUTERNAME | Get-ADPrincipalGroupMembership
"TestQAGroup","TestManagersGroup","TestDevGroup","TestAdministrators" | ForEach-Object {New-ADGroup -Name $_ -GroupScope Global}
$names = "Alan Turing","Grace Hopper"
$departments = "Test","Dev","QA"
Foreach ($name in $names) {
    Foreach ($dep in $departments){
        $username = "{0}{1}" -f $name.substring(0,1), $name.split()[1]
        $user = New-ADUser -GivenName $name.split()[0] `
                           -Surname $name.split()[1] `
                           -Name "$name$dep" `
                           -AccountPassword (ConvertTo-SecureString -String "Linux4Ever" -AsPlainText -Force) `                           -Department $dep `
                           -UserPrincipalName "$username$dep@VT17_3.local" `
                           -SamAccountName "$username$dep" `
                           -PassThru
        Get-ADGroup -filter 'name -like "Test*"' | Add-ADGroupMember -Members $user
    }
}
Get-ADUser -filter '(surname -eq "hopper") -or (surname -eq "turing")' | Set-ADUser -Enabled $true
Get-ADGroupMember -Identity TestQAGroup | Format-Table Name,SamAccountName

#Remove-ADUser "Alan TuringQA" #t.ex ...

$reportData = ForEach($group in (Get-ADGroup -filter 'name -like "test*"')) {
    ForEach($member in (Get-ADGroupMember $group)) {
        New-Object -TypeName PSobject -Property @{group=$group.Name;member=$member.name}
    }
}
$reportData | Out-GridView -Title MembershipReport