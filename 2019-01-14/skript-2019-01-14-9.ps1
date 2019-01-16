$SuccessfulLogin = Get-EventLog -LogName Security | Where-Object {$_.InstanceId -eq 4624 }
$SuccessfulLoginCount = $SuccessfulLogin.Count
$SuccessfulLoginInteractiveCount = ($SuccessfulLogin | Where-Object {$_.Message -like "*Inloggningstyp:		2*"}).Count #inloggningstyp 2 är interaktiv login, 3 är nätverk
$SuccessfulLoginNetworkCount = ($SuccessfulLogin | Where-Object {$_.Message -like "*Inloggningstyp:		3*"}).Count
$FailedLoginCoint = (Get-EventLog -LogName Security | Where-Object {$_.InstanceId -eq 4625}).Count
$UnlockLoginCoint = (Get-EventLog -LogName Security | Where-Object {$_.InstanceId -eq 4801}).Count
#echo $SuccessfulLogin | Select-Object -First 5 | Format-List
#echo $SuccessfulLoginInteractive | Format-List
write-host "Successful logins:  $SuccessfulLoginCount"
write-host "Successful interactive logins: $SuccessfulLoginInteractiveCount"
write-host "Successful network logins: $SucessfulLoginNetworkCount"
write-host -ForegroundColor red "Failed logins: $FailedLoginCoint"
write-host "Workstation unlocks: $UnlockLoginCoint"

echo "Successful logins:  $SuccessfulLoginCount" >> "C:\Temp\Logins.txt"
echo "Successful interactive logins: $SuccessfulLoginInteractiveCount" >> "C:\Temp\Logins.txt"
echo "Successful network logins: $SuccessfulLoginNetworkCount" >> "C:\Temp\Logins.txt"
echo "Failed logins: $FailedLoginCoint" >> "C:\Temp\Logins.txt"
echo "Workstation unlocks: $UnlockLoginCoint" >> "C:\Temp\Logins.txt"