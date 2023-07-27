param(
    [string]$username,
    [string]$groupName
)

# Login to your Azure AD tenant
Connect-AzureAD

# Get the user
$user = Get-AzureADUser -SearchString $username

# Get the group
$group = Get-AzureADGroup -SearchString $groupName

if ($user -and $group) {
    # Add the user to the group
    Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $user.ObjectId
    Write-Host "User $($user.DisplayName) added to group $($group.DisplayName)"
} else {
    Write-Host "User or Group not found"
}