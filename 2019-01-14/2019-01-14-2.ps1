$filepath = "C:\temp\gronsaker.txt"
$fc = Get-Content -Path $filepath
$sorted = $fc | Sort-Object -Unique
write-host $sorted
$count = $sorted | Measure-Object -Word
Write-Host $count.Words