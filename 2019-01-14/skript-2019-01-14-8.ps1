$ServiceTag = (Get-WmiObject win32_SystemEnclosure).SerialNumber
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36"
$res = Invoke-WebRequest -UserAgent "$ua" -UseBasicParsing -Uri "https://www.dell.com/support/home/se/sv/sebsdt1/product-support/servicetag/$ServiceTag/warranty"
echo $res
#echo $ServiceTag