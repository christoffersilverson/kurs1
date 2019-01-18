$confpath = 'C:\Users\chris\Desktop\repo\kurs1\skapa_labmiljo\conf\conf.psd1'
Invoke-LabResourceDownload -ConfigurationData $confpath -DSCResources

powershell $confpath