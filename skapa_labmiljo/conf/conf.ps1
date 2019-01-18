Configuration conf {
<#
    Requires the following custom DSC resources:

        xComputerManagement: https://github.com/PowerShell/xComputerManagement
        xNetworking:         https://github.com/PowerShell/xNetworking
        xActiveDirectory:    https://github.com/PowerShell/xActiveDirectory
        xSmbShare:           https://github.com/PowerShell/xSmbShare
        xDhcpServer:         https://github.com/PowerShell/xDhcpServer
        xDnsServer:          https://github.com/PowerShell/xDnsServer
#>
    param (
        [Parameter()] [ValidateNotNull()] [PSCredential] $Credential = (Get-Credential -Credential 'Administrator')
    )
    Import-DscResource -Module xComputerManagement, xNetworking, xActiveDirectory;
    Import-DscResource -Module xSmbShare, PSDesiredStateConfiguration;
    Import-DscResource -Module xDnsServer;
	#$password = ConvertTo-SecureString "Linux4Ever" -AsPlainText -Force
	#$Credential = (New-Object System.Management.Automation.PSCredential ("Administrator",$password))
    node $AllNodes.Where({$true}).NodeName {

        LocalConfigurationManager {

            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode    = 'ApplyOnly';
            CertificateID        = $node.Thumbprint;
        }

        if (-not [System.String]::IsNullOrEmpty($node.IPAddress)) {

            xIPAddress 'PrimaryIPAddress' {

                IPAddress      = $node.IPAddress;
                InterfaceAlias = $node.InterfaceAlias;
                #PrefixLength   = $node.PrefixLength;
                AddressFamily  = $node.AddressFamily;
            }

            if (-not [System.String]::IsNullOrEmpty($node.DefaultGateway)) {

                xDefaultGatewayAddress 'PrimaryDefaultGateway' {

                    InterfaceAlias = $node.InterfaceAlias;
                    Address        = $node.DefaultGateway;
                    AddressFamily  = $node.AddressFamily;
                }
            }

            if (-not [System.String]::IsNullOrEmpty($node.DnsServerAddress)) {

                xDnsServerAddress 'PrimaryDNSClient' {

                    Address        = $node.DnsServerAddress;
                    InterfaceAlias = $node.InterfaceAlias;
                    AddressFamily  = $node.AddressFamily;
                }
            }

            if (-not [System.String]::IsNullOrEmpty($node.DnsConnectionSuffix)) {

                xDnsConnectionSuffix 'PrimaryConnectionSuffix' {

                    InterfaceAlias           = $node.InterfaceAlias;
                    ConnectionSpecificSuffix = $node.DnsConnectionSuffix;
                }
            }

        } #end if IPAddress

    } #end nodes ALL

    node $AllNodes.Where({$_.Role -in 'DC'}).NodeName {

        ## Flip credential into username@domain.com
        $domainCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ("$($Credential.UserName)@$($node.DomainName)", $Credential.Password);

        xComputer 'Hostname' {

            Name = $node.NodeName;
        }

        ## Hack to fix DependsOn with hypens "bug" :(
        foreach ($feature in @(
                'AD-Domain-Services',
                'GPMC',
                'RSAT-AD-Tools'
            )) {
            WindowsFeature $feature.Replace('-','') {

                Ensure               = 'Present';
                Name                 = $feature;
                IncludeAllSubFeature = $true;
            }
        }

        xADDomain 'ADDomain' {

            DomainName                    = $node.DomainName;
            SafemodeAdministratorPassword = $Credential;
            DomainAdministratorCredential = $Credential;
            DependsOn                     = '[WindowsFeature]ADDomainServices';
        }

        xADUser User1 {

            DomainName  = $node.DomainName;
            UserName    = 'User1';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }

        xADGroup DomainAdmins {

            GroupName        = 'Domain Admins';
            MembersToInclude = 'User1';
            DependsOn        = '[xADUser]User1';
        }

        xADGroup EnterpriseAdmins {

            GroupName        = 'Enterprise Admins';
            GroupScope       = 'Universal';
            MembersToInclude = 'User1';
            DependsOn        = '[xADUser]User1';
        }
		xADUser CheErd {

            DomainName  = $node.DomainName;
            UserName    = 'CheErd';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser MadLue {

            DomainName  = $node.DomainName;
            UserName    = 'MadLue';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser AmeGua {

            DomainName  = $node.DomainName;
            UserName    = 'AmeGua';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser BriGlo {

            DomainName  = $node.DomainName;
            UserName    = 'BriGlo';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser AllGoo {

            DomainName  = $node.DomainName;
            UserName    = 'AllGoo';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser SavSpo {

            DomainName  = $node.DomainName;
            UserName    = 'SavSpo';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser JerVeu {

            DomainName  = $node.DomainName;
            UserName    = 'JerVeu';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser DeoSch {

            DomainName  = $node.DomainName;
            UserName    = 'DeoSch';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser BetLub {

            DomainName  = $node.DomainName;
            UserName    = 'BetLub';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser VivGay {

            DomainName  = $node.DomainName;
            UserName    = 'VivGay';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser LavSip {

            DomainName  = $node.DomainName;
            UserName    = 'LavSip';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser JanVan {

            DomainName  = $node.DomainName;
            UserName    = 'JanVan';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser TonCri {

            DomainName  = $node.DomainName;
            UserName    = 'TonCri';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser GonPac {

            DomainName  = $node.DomainName;
            UserName    = 'GonPac';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser BriJac {

            DomainName  = $node.DomainName;
            UserName    = 'BriJac';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser CalMed {

            DomainName  = $node.DomainName;
            UserName    = 'CalMed';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser DocBay {

            DomainName  = $node.DomainName;
            UserName    = 'DocBay';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser MauRei {

            DomainName  = $node.DomainName;
            UserName    = 'MauRei';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser GinMue {

            DomainName  = $node.DomainName;
            UserName    = 'GinMue';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }
            xADUser EldKli {

            DomainName  = $node.DomainName;
            UserName    = 'EldKli';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }


    } #end nodes DC

    ## INET1 is on the 'Internet' subnet and not domain-joined
    node $AllNodes.Where({$_.Role -in 'CLIENT','APP','EDGE'}).NodeName {

        ## Flip credential into username@domain.com
        $upn = '{0}@{1}' -f $Credential.UserName, $node.DomainName;
        $domainCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($upn, $Credential.Password);

        xComputer 'DomainMembership' {

            Name       = $node.NodeName;
            DomainName = $node.DomainName;
            Credential = $domainCredential;
        }
    } #end nodes DomainJoined

    node $AllNodes.Where({$_.Role -in 'APP'}).NodeName {

        ## Flip credential into username@domain.com
        $upn = '{0}@{1}' -f $Credential.UserName, $node.DomainName;
        $domainCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($upn, $Credential.Password);

        foreach ($feature in @(
                'Web-Default-Doc',
                'Web-Dir-Browsing',
                'Web-Http-Errors',
                'Web-Static-Content',
                'Web-Http-Logging',
                'Web-Stat-Compression',
                'Web-Filtering',
                'Web-Mgmt-Tools',
                'Web-Mgmt-Console')) {
            WindowsFeature $feature.Replace('-','') {

                Ensure               = 'Present';
                Name                 = $feature;
                IncludeAllSubFeature = $true;
                DependsOn            = '[xComputer]DomainMembership';
            }
        }

        


    } #end nodes APP
	node $AllNodes.Where({$_.Role -in 'APP','DC'}).NodeName {
		    
		File 'Resurser' {

			DestinationPath = 'C:\Resurser';
			Type            = 'Directory';
		}
        xSmbShare 'Resurser' {

            Name         = 'Resurser';
            Path         = 'C:\Resurser';
            ChangeAccess = 'chrille\Everyone';
            DependsOn    = '[File]Resurser';
            Ensure       = 'Present';
        }
		File 'Gemensam' {

			DestinationPath = 'C:\Gemensam';
			Type            = 'Directory';
		}
        xSmbShare 'FilesShare' {

            Name         = 'Gemensam';
            Path         = 'C:\Gemensam';
            ChangeAccess = 'chrille\Everyone';
            DependsOn    = '[File]Gemensam';
            Ensure       = 'Present';
        }
			
			
		File 'CheErd' {
			DestinationPath = 'C:\CheErd';
			Type            = 'Directory';
		}
        xSmbShare 'CheErd$' {

            Name         = 'CheErd$';
            Path         = 'C:\CheErd';
            ChangeAccess = 'chrille\CheErd';
            DependsOn    = '[File]CheErd';
            Ensure       = 'Present';
        }
        File 'MadLue' {

			DestinationPath = 'C:\MadLue';
			Type            = 'Directory';
		}
        xSmbShare 'MadLue$' {

            Name         = 'MadLue$';
            Path         = 'C:\MadLue';
            ChangeAccess = 'chrille\MadLue';
            DependsOn    = '[File]MadLue';
            Ensure       = 'Present';
        }
        File 'AmeGua' {

			DestinationPath = 'C:\AmeGua';
			Type            = 'Directory';
		}
        xSmbShare 'AmeGua$' {

            Name         = 'AmeGua$';
            Path         = 'C:\AmeGua';
            ChangeAccess = 'chrille\AmeGua';
            DependsOn    = '[File]AmeGua';
            Ensure       = 'Present';
        }
        File 'BriGlo' {

			DestinationPath = 'C:\BriGlo';
			Type            = 'Directory';
		}
        xSmbShare 'BriGlo$' {

            Name         = 'BriGlo$';
            Path         = 'C:\BriGlo';
            ChangeAccess = 'chrille\BriGlo';
            DependsOn    = '[File]BriGlo';
            Ensure       = 'Present';
        }
        File 'AllGoo' {

			DestinationPath = 'C:\AllGoo';
			Type            = 'Directory';
		}
        xSmbShare 'AllGoo$' {

            Name         = 'AllGoo$';
            Path         = 'C:\AllGoo';
            ChangeAccess = 'chrille\AllGoo';
            DependsOn    = '[File]AllGoo';
            Ensure       = 'Present';
        }
        File 'SavSpo' {

			DestinationPath = 'C:\SavSpo';
			Type            = 'Directory';
		}
        xSmbShare 'SavSpo$' {

            Name         = 'SavSpo$';
            Path         = 'C:\SavSpo';
            ChangeAccess = 'chrille\SavSpo';
            DependsOn    = '[File]SavSpo';
            Ensure       = 'Present';
        }
        File 'JerVeu' {

			DestinationPath = 'C:\JerVeu';
			Type            = 'Directory';
		}
        xSmbShare 'JerVeu$' {

            Name         = 'JerVeu$';
            Path         = 'C:\JerVeu';
            ChangeAccess = 'chrille\JerVeu';
            DependsOn    = '[File]JerVeu';
            Ensure       = 'Present';
        }
        File 'DeoSch' {

			DestinationPath = 'C:\DeoSch';
			Type            = 'Directory';
		}
        xSmbShare 'DeoSch$' {

            Name         = 'DeoSch$';
            Path         = 'C:\DeoSch';
            ChangeAccess = 'chrille\DeoSch';
            DependsOn    = '[File]DeoSch';
            Ensure       = 'Present';
        }
        File 'BetLub' {

			DestinationPath = 'C:\BetLub';
			Type            = 'Directory';
		}
        xSmbShare 'BetLub$' {

            Name         = 'BetLub$';
            Path         = 'C:\BetLub';
            ChangeAccess = 'chrille\BetLub';
            DependsOn    = '[File]BetLub';
            Ensure       = 'Present';
        }
        File 'VivGay' {

			DestinationPath = 'C:\VivGay';
			Type            = 'Directory';
		}
        xSmbShare 'VivGay$' {

            Name         = 'VivGay$';
            Path         = 'C:\VivGay';
            ChangeAccess = 'chrille\VivGay';
            DependsOn    = '[File]VivGay';
            Ensure       = 'Present';
        }
        File 'LavSip' {

			DestinationPath = 'C:\LavSip';
			Type            = 'Directory';
		}
        xSmbShare 'LavSip$' {

            Name         = 'LavSip$';
            Path         = 'C:\LavSip';
            ChangeAccess = 'chrille\LavSip';
            DependsOn    = '[File]LavSip';
            Ensure       = 'Present';
        }
        File 'JanVan' {

			DestinationPath = 'C:\JanVan';
			Type            = 'Directory';
		}
        xSmbShare 'JanVan$' {

            Name         = 'JanVan$';
            Path         = 'C:\JanVan';
            ChangeAccess = 'chrille\JanVan';
            DependsOn    = '[File]JanVan';
            Ensure       = 'Present';
        }
        File 'TonCri' {

			DestinationPath = 'C:\TonCri';
			Type            = 'Directory';
		}
        xSmbShare 'TonCri$' {

            Name         = 'TonCri$';
            Path         = 'C:\TonCri';
            ChangeAccess = 'chrille\TonCri';
            DependsOn    = '[File]TonCri';
            Ensure       = 'Present';
        }
        File 'GonPac' {

			DestinationPath = 'C:\GonPac';
			Type            = 'Directory';
		}
        xSmbShare 'GonPac$' {

            Name         = 'GonPac$';
            Path         = 'C:\GonPac';
            ChangeAccess = 'chrille\GonPac';
            DependsOn    = '[File]GonPac';
            Ensure       = 'Present';
        }
        File 'BriJac' {

			DestinationPath = 'C:\BriJac';
			Type            = 'Directory';
		}
        xSmbShare 'BriJac$' {

            Name         = 'BriJac$';
            Path         = 'C:\BriJac';
            ChangeAccess = 'chrille\BriJac';
            DependsOn    = '[File]BriJac';
            Ensure       = 'Present';
        }
        File 'CalMed' {

			DestinationPath = 'C:\CalMed';
			Type            = 'Directory';
		}
        xSmbShare 'CalMed$' {

            Name         = 'CalMed$';
            Path         = 'C:\CalMed';
            ChangeAccess = 'chrille\CalMed';
            DependsOn    = '[File]CalMed';
            Ensure       = 'Present';
        }
        File 'DocBay' {

			DestinationPath = 'C:\DocBay';
			Type            = 'Directory';
		}
        xSmbShare 'DocBay$' {

            Name         = 'DocBay$';
            Path         = 'C:\DocBay';
            ChangeAccess = 'chrille\DocBay';
            DependsOn    = '[File]DocBay';
            Ensure       = 'Present';
        }
        File 'MauRei' {

			DestinationPath = 'C:\MauRei';
			Type            = 'Directory';
		}
        xSmbShare 'MauRei$' {

            Name         = 'MauRei$';
            Path         = 'C:\MauRei';
            ChangeAccess = 'chrille\MauRei';
            DependsOn    = '[File]MauRei';
            Ensure       = 'Present';
        }
        File 'GinMue' {

			DestinationPath = 'C:\GinMue';
			Type            = 'Directory';
		}
        xSmbShare 'GinMue$' {

            Name         = 'GinMue$';
            Path         = 'C:\GinMue';
            ChangeAccess = 'chrille\GinMue';
            DependsOn    = '[File]GinMue';
            Ensure       = 'Present';
        }
        File 'EldKli' {

			DestinationPath = 'C:\EldKli';
			Type            = 'Directory';
		}
        xSmbShare 'EldKli$' {

            Name         = 'EldKli$';
            Path         = 'C:\EldKli';
            ChangeAccess = 'chrille\EldKli';
            DependsOn    = '[File]EldKli';
            Ensure       = 'Present';
        }

		#create file shares
	}
} #end