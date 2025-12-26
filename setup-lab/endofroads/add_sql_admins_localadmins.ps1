Add-LocalGroupMember -Group administrators -member "BOOMBOX\SQL Admins"

Write-Host "";Write-Host "Adding SQL Admins to Local Administrators"

# Check SQL admins were added

Get-LocalGroupMember administrators

