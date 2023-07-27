param (
    [string]$userPrincipalName
)

# Retrieve the user information
$user = Get-ADUser -Filter { EmployeeId -eq $userPrincipalName } -properties *
Write-Output $user

if ($user) {
    Write-Output "valid kronos"
} else {
    Write-Output "not a real kronos"
}
