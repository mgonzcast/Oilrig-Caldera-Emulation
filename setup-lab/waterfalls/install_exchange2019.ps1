# Assuming your Exchange ISO is mounted under D:
# https://www.microsoft.com/en-us/download/details.aspx?id=103477

cd D:\

.\Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareSchema
.\Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName:"Boombox"

# Migration and Post Above Install
.\Setup.exe /m:install /roles:m /IAcceptExchangeServerLicenseTerms_DiagnosticDataOFF /InstallWindowsComponents 

set-owavirtualdirectory -Identity "owa (Default Web Site)" -ExternalURL https://waterfalls.boombox.com/owa -InternalURL https://waterfalls.boombox.com/owa

set-ecpvirtualdirectory -Identity "ecp (Default Web Site)" -ExternalURL https://waterfalls.boombox.com/ecp -InternalURL https://waterfalls.boombox.com/ecp

Set-MapiVirtualDirectory -Identity "WATERFALLS\mapi (Default Web Site)" -IISAuthenticationMethods NTLM,Negotiate


# Launch the Exchange Management Shell
LaunchEMS
