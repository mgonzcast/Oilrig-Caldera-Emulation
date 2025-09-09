# This assumes you have the Exchange ISO mounted on the D drive
# https://www.microsoft.com/en-us/download/details.aspx?id=103477

# You need to download these installers:

# https://download.microsoft.com/download/2/e/6/2e61cfa4-993b-4dd4-91da-3737cd5cd6e3/vcredist_x64.exe
# https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi

# You need to install .NET 4.8. From this website https://stackoverflow.com/questions/74762243/net-framework-4-8-install-fail-windows-server-2019, you need to download 
# https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/c8c829444416e811be84c5765ede6148/ndp48-devpack-enu.exe

# In your domain, you need to set the primary group the Schema Admin group for the Administrator:
# https://absoblogginlutely.net/fixed-the-active-directory-schema-isnt-up-to-date-and-this-user-account-isnt-a-member-of-the-schema-admins-and-or-enterprise-admins-groups/

Install-WindowsFeature Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-Static-Content,Web-Http-Redirect,Web-Health,Web-Http-Logging,Web-Log-Libraries,Web-Request-Monitor,Web-Http-Tracing,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Basic-Auth,Web-Client-Auth,Web-Digest-Auth,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Mgmt-Tools,Web-Mgmt-Compat,Web-Metabase,Web-WMI,Web-Mgmt-Service,NET-Framework-45-ASPNET,NET-WCF-HTTP-Activation45,NET-WCF-MSMQ-Activation45,NET-WCF-Pipe-Activation45,NET-WCF-TCP-Activation45,Server-Media-Foundation,MSMQ-Services,MSMQ-Server,RSAT-Feature-Tools,RSAT-Clustering,RSAT-Clustering-PowerShell,RSAT-Clustering-CmdInterface,RPC-over-HTTP-Proxy,WAS-Process-Model,WAS-Config-APIs,Server-Media-Foundation, RSAT-ADDS

cd D:\UCMARedist\
"Setup.exe /passive /promptrestart" | cmd

# You need to Restart
# To install the rest of software:

"rewrite_amd64_en-US.msi /quiet /norestart" | cmd
"vcredist_x64.exe /quiet /norestart" | cmd
"ndp48-devpack-enu.exe /quiet /norestart" | cmd

# For checking the .NET 4.8 

(Get-ItemProperty ‘HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full’ -Name Release).Release
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | Get-ItemProperty -name Version,Release -EA 0 | Where { $_.PSChildName -match 'Full'} | Select PSChildName, Version, Release


