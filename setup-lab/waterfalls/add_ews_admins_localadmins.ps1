Add-LocalGroupMember -Group administrators -member "BOOMBOX\EWS Admins"

Write-Host "";Write-Host "Adding EWS Admins to Local Administrators"

# Check EWS admins were added

Get-LocalGroupMember administrators


