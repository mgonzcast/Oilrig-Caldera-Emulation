# Assuming your Exchange ISO is mounted under D:
# https://www.microsoft.com/en-us/download/details.aspx?id=103477

cd D:\

.\Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareSchema
.\Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName:"Boombox"

# Migration and Post Above Install
.\Setup.exe /m:install /roles:m /IAcceptExchangeServerLicenseTerms_DiagnosticDataOFF /InstallWindowsComponents 

# Launch the Exchange Management Shell
LaunchEMS
