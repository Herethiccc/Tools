#######################################################
#######       Active Directory Utilities        #######
#######################################################
####### Version release:     September 2nd 2024 #######
#######################################################

# AD Users management menu
function ManageADUser {
    Clear-Host
    Write-Host "AD user management"
    Write-Host "------------------------------------------------------------"
    Write-Host "1. Add user to a group"
    Write-Host "2. Remove user from a group"
    Write-Host "3. Move user from one group to an other"
    Write-Host "4. List the user's groups"
    Write-Host "5. Check if a user's password expired"
    Write-Host "R. Return to main menu"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch ($choice) {
        1 { AddUserToGroup }
        2 { RemoveUserFromGroup }
        3 { MoveUserToGroup }
        4 { ListUserGroups }
        5 { CheckPasswordExpiration }
        'R' { ReturnToMainMenu }
        'Q' { QuitScript }
        Default { InvalidOption }
    }
}

# Adding AD user to AD group
function AddUserToGroup {
    $memberToAdd = Read-Host "Please provide the user to add" 
    $destinationGroup = Read-Host "Please provide the group you want to add the user to"
    $validation = Read-Host "Are you sure that you want to add $memberToAdd to the $destinationGroup group ? y/N"
    if ($validation -eq "y") {
        try {
            Add-ADGroupMember -Identity $destinationGroup -Members $memberToAdd -ErrorAction Stop
            Write-Host "User $memberToAdd added to group $destinationGroup successfully." -ForegroundColor Green
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Removing AD User from AD Group
function RemoveUserFromGroup {
    $memberToRemove = Read-Host "Please provide the user to remove"
    $currentGroup = Read-Host "Please provide the group you want to remove the user from"
    $validation = Read-Host "Are you sure that you want to remove $memberToRemove from the $currentGroup group ? y/N"
    if ($validation -eq "y") {
        try {
            Remove-ADGroupMember -Identity $currentGroup -Members $memberToRemove -ErrorAction Stop
            Write-Host "User $memberToRemove removed from group $currentGroup successfully." -ForegroundColor Green
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Moving AD user from an AD group to another
function MoveUserToGroup {
    $memberToMove = Read-Host "Please provide the user to move"
    $currentGroup = Read-Host "Please provide the group you want to remove the user from"
    $destinationGroup = Read-Host "Please provide the group you want to move the user to"
    $validation = Read-Host "Are you sure that you want to move the user $memberToMove from the $currentGroup group to the $destinationGroup group ? y/N"
    if ($validation -eq "y") {
        try {
            Remove-ADGroupMember -Identity $currentGroup -Members $memberToMove -ErrorAction Stop
            Add-ADGroupMember -Identity $destinationGroup -Members $memberToMove -ErrorAction Stop
            Write-Host "User $memberToMove moved from group $currentGroup to $destinationGroup successfully." -ForegroundColor Green
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Listing the AD groups that an AD user is a member of
function ListUserGroups {
    $userToQuery = Read-Host "Please provide the user you want to query"
    $validation = Read-Host "Are you sure that you want to list the group(s) that $userToQuery is a member of ? y/N"
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "The user $userToQuery is a member of:" -ForegroundColor Green
            Get-ADUser -Identity $userToQuery -Properties MemberOf | Select-Object -ExpandProperty MemberOf
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

function CheckPasswordExpiration {
    $userToQuery = Read-Host "Please provide the user you want to query"
    
    try {
        Write-Host ""
        Write-Host "Checking if $usertoQuery's password has expired.." -ForegroundColor Yellow
        $PasswordExpired = Get-ADUser -Identity $userToQuery -Properties PasswordExpired
            if ($PasswordExpired -eq "True") {
                Write-Host "Password is Expired" -ForegroundColor Red
            } else {
                Write-Host "Password isn't expired" -ForegroundColor Green
            }
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# AD groups management menu
function ManageADGroup {
    Clear-Host
    Write-Host "AD group management"
    Write-Host "------------------------------------------------------------"
    Write-Host "1. List AD group's members"
    Write-Host "R. Return to main menu"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch($choice) {
        1 { ListGroupMembers }
        'R' { ReturnToMainMenu }
        'Q' { QuitScript }
    }
}

# Listing the members of an AD group
function ListGroupMembers {
    $groupToQuery = Read-Host "Please provide the group you want to query"
    $validation = Read-Host "Are you sure that you want to list the members of the group $groupToQuery ? y/N"
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "Listing the member(s) of the $groupToQuery Active Directory group:" -ForegroundColor Green
            Get-ADGroupMember -Identity $groupToQuery -ErrorAction Stop | Format-Table Name, SamAccountName
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Managing GPOs menu
function DisplayGPOs {
    Clear-Host
    Write-Host "GPOs display"
    Write-Host "------------------------------------------------------------"
    Write-Host "1. Display user GPOs"
    Write-Host "2. Display computer GPOs"
    Write-Host "R. Return to main menu"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch ($choice) {
        1 { DisplayUserGPOs }
        2 { DisplayComputerGPOs }
        'R' { ReturnToMainMenu }
        'Q' { QuitScript }
    }
}

# Listing the GPOs applied to an AD user
function DisplayUserGPOs {
    Write-Host ""
    $userToQuery = Read-Host "Please provide the user you want to query"
    Write-Host "/!\ User $userToQuery must have logged on at least once /!\" -ForegroundColor Yellow
    $validation = Read-Host "Are you sure that you want to list the GPOs applied to $userToQuery ? y/N"
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "The following GPOs are applied to $userToQuery" -ForegroundColor Green
            gpresult /USER $userToQuery /SCOPE user /R
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Listing the GPOs applied to an AD computer
function DisplayComputerGPOs {
    Write-Host ""
    $computerToQuery = Read-Host "Please provide the computer you want to query"
    $validation = Read-Host "Are you sure that you want to list the GPOs applied to $computerToQuery ? y/N"
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "The following GPOs are applied to $computerToQuery" -ForegroundColor Green
            gpresult /s $computerToQuery /r /scope computer
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    } 
}

################ Global Functions ################

function ReturnToMainMenu {
    Clear-Host
}

function QuitScript {
    Clear-Host
    Write-Host "Bye, have a great day"
    Start-Sleep 1
    Clear-Host
    Exit
}

function InvalidOption {
    Clear-Host
    Write-Host "Invalid option, moving back to the main menu." -ForegroundColor Red
    Start-Sleep 1
    Clear-Host
}

# Launch menu / Main menu
$global:continue = $true
while ($global:continue) {
    Write-Host ""
    Write-Host "/!\ Please make sure to run this script with privileges /!\" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------"
    Write-Host "1. AD user management"
    Write-Host "2. AD group management"
    Write-Host "3. GPOs display"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch ($choice) {
        1 { ManageADUser }
        2 { ManageADGroup }
        3 { DisplayGPOs }
        'Q' { QuitScript }
        Default { InvalidOption }
    }
}