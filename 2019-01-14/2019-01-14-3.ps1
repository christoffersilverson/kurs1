$now = [DateTime]::Now
Add-Content -Path "C:\temp\test2.txt" -Value "$now"
Add-Content -Path "C:\temp\test2.txt" -Value "Välkommen Hem"
Compare-Object -ReferenceObject $(Get-Content "C:\temp\test2.txt") -DifferenceObject $(Get-Content "C:\temp\test.txt")