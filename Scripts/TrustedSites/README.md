A PowerShell script which can be used to add trusted sites in Internet Explorer.


````
.SYNOPSIS
        The PowerShell script which can be used to add trusted sites in Internet Explorer.
    .DESCRIPTION
        The PowerShell script which can be used to add trusted sites in Internet Explorer.
    .PARAMETER  TrustedSites
		Spcifies the trusted site in Internet Explorer.
    .PARAMETER  HTTP
		Once you use the HTTP switch parameter, the domain will be use the http:// prefix.
    .PARAMETER  PrimaryDomain
		Spcifies the primary domain in Internet Explorer.
    .PARAMETER  SubDomain
		Spcifies the sub domain in Internet Explorer.
    .EXAMPLE
        C:\PS> C:\AddingTrustedSites.ps1 -TrustedSites "contoso1.com","contoso2.com" -HTTP

		Successfully added 'contoso1.com' and 'contoso2.com' domain to trusted sites in Internet Explorer.

        This command will add 'contoso1.com' and 'contoso2.com' domain to trusted sites in Internet Explorer respectively.
    .EXAMPLE
        C:\PS> C:\AddingTrustedSites.ps1  -PrimaryDomain "contoso.com" -SubDomain "test.domain"

		Successfully added 'test.domain.contoso.com' domain to trusted sites in Internet Explorer.

        This command will add 'test.domain.contoso.com' domain to trusted sites in Internet Explorer.
        ````
        
