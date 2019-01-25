För att installera och köra skriptet:

1. installera lability med get lability.ps1
2. (optional) ladda ner de moduler som krävs med DownloadResources.ps1
3. kör test-conf.ps1, glöm inte ta bort kommentarer för Start-LabHostConfiguration, samt ändra path strängarna till där du har filerna

4. . C:\Lability\Configurations\conf.ps1
conf -Outputpath C:\Lability\Configurations -ConfigurationData .\conf.psd1 används för att skapa mof och meta mof filerna, kör den om de behövs
5. kör Start-LabConfiguration -ConfigurationData C:\Lability\Configurations\conf.psd1 # med path till conf.psd1

6. (optional) skapa en CSV fil på formen Lastname,Firstname och kör GenerateLabConfig för att automatiskt generera userconfig för lability
detta är redan utfört med users.csv
