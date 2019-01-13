$birthdate = Get-Date -year 1995 -day 11 -month 10
$MillionSeconds = [DateTime]::Now.AddSeconds(-1000000)
$MillionMinutes = [DateTime]::Now.AddMinutes(-1000000)
$MillionHours = [DateTime]::Now.AddHours(-1000000)
if ($birthdate -lt $MillionSeconds){
    echo "I have lived for more than a million seconds!" 
}
if ($birthdate -lt $MillionMinutes){
    echo "I have lived for more than a million minutes!" 
}
if ($birthdate -lt $MillionHours){
    echo "I have lived for more than a million hours"

}

((get-date)-$birthdate).TotalMinutes / 1000000 #antal minuter delat på en miljon
