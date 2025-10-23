# Assumes SQL Server 2019 ISO downloaded from https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU.iso
# is mounted on D drive


netsh.exe advfirewall set allprofiles state off

D:\setup.exe /QS /ACTION=Install /FEATURES=SQLENGINE /TCPEnabled=1 `
/INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="NT AUTHORITY\SYSTEM" `
/SQLSYSADMINACCOUNTS="BOOMBOX\Administrator" `
/SECURITYMODE=SQL /SAPWD="Password_123456" `
/IACCEPTSQLSERVERLICENSETERMS

New-NetFirewallRule -DisplayName "SQL Server" -Direction Inbound `
-Protocol TCP -LocalPort 1433 -Action Allow

msiexec /i "MsSqlCmdLnUtils.msi" /passive IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES


schtasks /create /tn "SQL Connection" /tr "c:\Users\Administrator.BOOMBOX\sql_connection.bat" /sc onstart /RU BOOMBOX\tous


sqlcmd -i "c:\Users\Administrator.BOOMBOX\configuration_sqladmins.sql"


# Uninstall SQL Server: D:\setup.exe /QS /ACTION=Uninstall /INSTANCENAME=MSSQLSERVER /IACCEPTSQLSERVERLICENSETERMS
