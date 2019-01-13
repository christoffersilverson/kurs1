$people = @{"Christoffer" = "1995-10-11"; "FakePerson" = "1994-01-01" }
$input = Read-Host -Prompt "Input a name: "
write-host $people.$input