$FILEPATH = "E:\address.txt"

#echo "My Address is 127.0.0.1" >> $FILEPATH

$content = get-content $FILEPATH

$workaddress = @'
_................_
påhittadevägen 3
_................_
'@

$myname = "Christoffer Silverson"
#echo $myname | gm 

echo $myname.ToUpper()
echo $content

echo $workaddress