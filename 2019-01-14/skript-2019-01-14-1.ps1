#new-item "C:\temp\" -ItemType Directory
#new-item "C:\temp\test.txt" -ItemType File
$var = [DateTime]::Now
echo "$var" >> "C:\temp\test.txt"
echo "Välkommen till Nackademin" >> "C:\temp\test.txt"
#echo "" > "C:\temp\test.txt" #skapar en leading newline, ej bra lösning
Clear-Content "C:\temp\test.txt" 
echo "Välkommen till Nackademin" >> "C:\temp\test.txt"
echo "$var" >> "C:\temp\test.txt"