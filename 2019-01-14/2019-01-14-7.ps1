$events = Get-EventLog -LogName System | Where-Object {$_.EntryType -ne "Information"}
$events_count = $events.Count #totalt antal varningar och errors
$TodayMinus24h = [DateTime]::Now.AddDays(-1)
$events_last_24h = $events | Where-Object {[DateTime]$_.TimeGenerated -ge $TodayMinus24h} #senaste 24 timmarna
$el24h = $events_last_24h.Count
$last100 = $events | Select-Object -First 100 #hämta ut de senaste 100
$warningtext = " "
if ($el24h -gt 10){
    $warningtext= "<p style='font-size:90px; color:red; font-weight: bolder'>warning: mer än 10 errors/varningar!!!!!!</p>"
}
$precontent = @"
    <p> Totalt antal varningar och errors: $events_count </p>
    <p> Totalt antal varningar de senaste 24 timmarna: $el24h </p>
    $warningtext
"@
$head = @"
<style>
  body {
    font-family: "Arial";
    font-size: 8pt;
    color: #4C607B;
    }
  th, td { 
    border: 1px solid #e57300;
    border-collapse: collapse;
    padding: 5px;
    }
  th {
    font-size: 1.2em;
    text-align: left;
    background-color: #003366;
    color: #ffffff;
    }
  td {
    color: #000000;
    }
    td:nth-child(odd){
        background-color: #bfbfbf;
    }
</style>
"@
#orkar inte göra ett stylesheet så den här får duga
$body = $events | ConvertTo-Html -Head $head -PreContent $precontent | Out-File "C:\temp\error.html"
