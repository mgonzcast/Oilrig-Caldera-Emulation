New-ADGroup 'EWS Admins' -GroupScope Global
New-ADGroup 'SQL Admins' -Groupscope Global

$path="CN=Users,DC=boombox,DC=com"

### Hay que meter el principal name (logon)

New-ADUser -Name gosta -UserPrincipalName gosta@boombox.com -Path $path -Enabled $True `
-AccountPassword $(ConvertTo-SecureString 'd0ntGoCH4ingW8trfalls' -AsPlainText -Force) -passThru

Add-ADGroupMember -Identity "EWS Admins" -Members gosta

New-ADUser -Name tous -UserPrincipalName tous@boombox.com -Path $path -Enabled $True `
-AccountPassword $(ConvertTo-SecureString 'd0ntGoCH4ingW8trfalls' -AsPlainText -Force) -passThru

Add-ADGroupMember -Identity "EWS Admins" -Members tous
Add-ADGroupMember -Identity "SQL Admins" -Members tous

New-ADUser -Name mariam -UserPrincipalName mariam@boombox.com -Path $path -Enabled $True `
-AccountPassword $(ConvertTo-SecureString 'd0ntGoCH4ingW8trfalls' -AsPlainText -Force) -passThru
 
New-ADUser -Name shiroyeh -UserPrincipalName shiroyeh@boombox.com -Path $path -Enabled $True `
-AccountPassword $(ConvertTo-SecureString 'd0ntGoCH4ingW8trfalls' -AsPlainText -Force) -passThru

New-ADUser -Name shiroyeh_admin -UserPrincipalName shiroyeh_admin@boombox.com -Path $path -Enabled $True `
-AccountPassword $(ConvertTo-SecureString 'd0ntGoCH4ingW8trfalls' -AsPlainText -Force) -passThru

Add-ADGroupMember -Identity "Domain Admins" -Members shiroyeh_admin
