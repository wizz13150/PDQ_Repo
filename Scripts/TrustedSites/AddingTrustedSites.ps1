#--------------------------------------------------------------------------------- 
#The sample scripts are not supported under any Microsoft standard support 
#program or service. The sample scripts are provided AS IS without warranty  
#of any kind. Microsoft further disclaims all implied warranties including,  
#without limitation, any implied warranties of merchantability or of fitness for 
#a particular purpose. The entire risk arising out of the use or performance of  
#the sample scripts and documentation remains with you. In no event shall 
#Microsoft, its authors, or anyone else involved in the creation, production, or 
#delivery of the scripts be liable for any damages whatsoever (including, 
#without limitation, damages for loss of business profits, business interruption, 
#loss of business information, or other pecuniary loss) arising out of the use 
#of or inability to use the sample scripts or documentation, even if Microsoft 
#has been advised of the possibility of such damages 
#--------------------------------------------------------------------------------- 

#requires -version 2.0

<#
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
#>
Param
(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true,ParameterSetName="SingleDomain")]
    [Alias('Sites')][ValidateNotNullOrEmpty()]
    [String[]]$TrustedSites,

    [Parameter(Mandatory=$false)]
    [Switch]$HTTP,

    [Parameter(Mandatory=$true,ParameterSetName="CombineDomain")]
    [Alias('pdomain')][ValidateNotNullOrEmpty()]
    [String]$PrimaryDomain,

    [Parameter(Mandatory=$true,ParameterSetName="CombineDomain")]
    [Alias('sdomain')][ValidateNotNullOrEmpty()]
    [String]$SubDomain
)

#Initialize key variables
$UserRegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains"

$DWord = 2

#Main function
Function CreateKeyReg
{
    Param
    (
        [String]$KeyPath,
        [String]$Name
    )

    If(Test-Path -Path $KeyPath)
    {
        Write-Verbose "Creating a new key '$Name' under $KeyPath."
        New-Item -Path "$KeyPath" -ItemType File -Name "$Name" `
        -ErrorAction SilentlyContinue | Out-Null
    }
    Else
    {
        Write-Warning "The path '$KeyPath' not found."
    }
}

Function SetRegValue
{
    Param
    (
        [Boolean]$blnHTTP=$false,
        [String]$RegPath
    )

    Try
    {
        If($blnHTTP)
        {
            Write-Verbose "Creating a Dword value named 'HTTP' and set the value to 2."
            Set-ItemProperty -Path $RegPath -Name "http" -Value $DWord `
            -ErrorAction SilentlyContinue | Out-Null
        }
        Else
        {
            Write-Verbose "Creating a Dword value named 'HTTPS' and set the value to 2."
            Set-ItemProperty -Path $RegPath -Name "https" -Value $DWord `
            -ErrorAction SilentlyContinue | Out-Null
        }
    }
    Catch
    {
        Write-Host "Failed to add trusted sites in Internet Explorer." -BackgroundColor Red
    }

}

If($TrustedSites)
{
    #Adding trusted sites in the registry
    Foreach($TruestedSite in $TrustedSites)
    {
        #If user does not specify the user type. By default,the script will add the trusted sites for the current user.

        If($HTTP)
        {
            CreateKeyReg -KeyPath $UserRegPath -Name $TruestedSite 
            SetRegValue -RegPath "$UserRegPath\$TruestedSite" -blnHTTP $true -DWord $DWord
            Write-Host "Successfully added '$TruestedSite' domain to trusted Sites in Internet Explorer."
        }
        Else
        {
            CreateKeyReg -KeyPath $UserRegPath -Name $TruestedSite 
            SetRegValue -RegPath "$UserRegPath\$TruestedSite" -blnHTTP $false -DWord $DWord
            Write-Host "Successfully added '$TruestedSite' domain to to trusted Sites in Internet Explorer."
        }
    }
}
Else
{
    #Setting the primary domain and sub-domain
    If($HTTP)
    {
        CreateKeyReg -KeyPath $UserRegPath -Name $PrimaryDomain
        CreateKeyReg -KeyPath "$UserRegPath\$PrimaryDomain" -Name $SubDomain 
        SetRegValue -RegPath "$UserRegPath\$PrimaryDomain\$SubDomain" -blnHTTP $true -DWord $DWord
        Write-Host "Successfully added $SubDomain.$PrimaryDomain' domain to trusted Sites in Internet Explorer."
    }
    Else
    {
        CreateKeyReg -KeyPath $UserRegPath -Name $PrimaryDomain
        CreateKeyReg -KeyPath "$UserRegPath\$PrimaryDomain" -Name $SubDomain
        SetRegValue -RegPath "$UserRegPath\$PrimaryDomain\$SubDomain" -blnHTTP $false -DWord $DWord
        Write-Host "Successfully added '$SubDomain.$PrimaryDomain' domain to trusted Sites in Internet Explorer."
    }
}