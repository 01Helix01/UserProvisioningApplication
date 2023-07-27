param (
    [string]$userPrincipalName
)

# Retrieve the user information
$user = Get-ADUser -Filter { EmployeeId -eq $userPrincipalName } -properties *

# Create a hashtable to store the user information
$userInfo = @{}

if ($user) {
    $userInfo["Email"] = $user.mail
    $userInfo["Name"] = $user.DisplayName
    $userInfo["Department"] = $user.Department
    $userInfo["Title"] = $user.Description
    $userInfo["UserPrincipalName"] = $user.UserPrincipalName
    $userInfo["Manager"] = $user.Manager
} else {
    $userInfo["Error"] = "Error getting user information: Kronos does not belong to a user"
}

# Convert the hashtable to JSON
$jsonOutput = $userInfo | ConvertTo-Json

# Output the JSON string
Write-Output $jsonOutput
