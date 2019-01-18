$elements = Import-Csv -Path ".\elements.csv"
$elements | Measure-Object -Property "protons" -Average 
$elements | ForEach { 
    if($_.protons -eq $_.neutrons){
        write-host $_.Symbol
    }
}