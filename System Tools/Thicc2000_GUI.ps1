#######################################################
#######                 THICC2000               #######
#######################################################
#######  Version release date: August 30th 2024 #######
#######################################################

# Loading Windows Forms
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("If you didn't run this with admin privileges, please restart.", "Thicc2000", 0, 64)


# Creating canva
$Thicc2000 = New-Object System.Windows.Forms.Form
$Thicc2000.Text = "Thicc2000"
$Thicc2000.Width = 500
$Thicc2000.Height = 200
$Thicc2000.Autosize = $true

# Main Menu Text
$Menu = New-Object System.Windows.Forms.Label
$Menu.Text = "Menu principal"
$Menu.Location = New-Object System.Drawing.Point(10,10)
$Menu.AutoSize = $true
$Menu.Visible = $true
$Thicc2000.Controls.Add($Menu)

# Display the GUI
$Thicc2000.ShowDialog()

# # AD Users management menu
# function ManageADUserGroups {
#     Clear-Host
#     Write-Host "AD user's group management"
#     Write-Host "------------------------------------------------------------"
#     Write-Host "1. Add user to a group"
#     Write-Host "2. Remove user from a group"
#     Write-Host "3. Move user from one group to an other"
#     Write-Host "4. List the user's groups"
#     Write-Host "R. Return to main menu"
#     Write-Host "Q. Quit"
#     Write-Host "------------------------------------------------------------"
#     $choice = Read-Host "Pick an option"
#     switch ($choice) {
#         1 { AddUserToGroup }
#         2 { RemoveUserFromGroup }
#         3 { MoveUserToGroup }
#         4 { ListUserGroups }
#         'R' { ReturnToMainMenu }
#         'Q' { QuitScript }
#         Default { InvalidOption }
#     }
# }

# # Adding AD user to AD group
# function AddUserToGroup {
#     $memberToAdd = Read-Host "Please provide the user to add" 
#     $destinationGroup = Read-Host "Please provide the group you want to add the user to"
#     $validation = Read-Host "Are you sure that you want to add $memberToAdd to the $destinationGroup group ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Add-ADGroupMember -Identity $destinationGroup -Members $memberToAdd -ErrorAction Stop
#             Write-Host "User $memberToAdd added to group $destinationGroup successfully." -ForegroundColor Green
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Removing AD User from AD Group
# function RemoveUserFromGroup {
#     $memberToRemove = Read-Host "Please provide the user to remove"
#     $currentGroup = Read-Host "Please provide the group you want to remove the user from"
#     $validation = Read-Host "Are you sure that you want to remove $memberToRemove from the $currentGroup group ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Remove-ADGroupMember -Identity $currentGroup -Members $memberToRemove -ErrorAction Stop
#             Write-Host "User $memberToRemove removed from group $currentGroup successfully." -ForegroundColor Green
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Moving AD user from an AD group to another
# function MoveUserToGroup {
#     $memberToMove = Read-Host "Please provide the user to move"
#     $currentGroup = Read-Host "Please provide the group you want to remove the user from"
#     $destinationGroup = Read-Host "Please provide the group you want to move the user to"
#     $validation = Read-Host "Are you sure that you want to move the user $memberToMove from the $currentGroup group to the $destinationGroup group ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Remove-ADGroupMember -Identity $currentGroup -Members $memberToMove -ErrorAction Stop
#             Add-ADGroupMember -Identity $destinationGroup -Members $memberToMove -ErrorAction Stop
#             Write-Host "User $memberToMove moved from group $currentGroup to $destinationGroup successfully." -ForegroundColor Green
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Listing the AD groups that an AD user is a member of
# function ListUserGroups {
#     $userToQuery = Read-Host "Please provide the user you want to query"
#     $validation = Read-Host "Are you sure that you want to list the group(s) that $userToQuery is a member of ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "The user $userToQuery is a member of:" -ForegroundColor Green
#             Get-ADUser -Identity $userToQuery -Properties MemberOf | Select-Object -ExpandProperty MemberOf
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # AD groups management menu
# function ManageADGroup {
#     Clear-Host
#     Write-Host "AD group management"
#     Write-Host "------------------------------------------------------------"
#     Write-Host "1. List AD group's members"
#     Write-Host "R. Return to main menu"
#     Write-Host "Q. Quit"
#     Write-Host "------------------------------------------------------------"
#     $choice = Read-Host "Pick an option"
#     switch($choice) {
#         1 { ListGroupMembers }
#         'R' { ReturnToMainMenu }
#         'Q' { QuitScript }
#     }
# }

# # Listing the members of an AD group
# function ListGroupMembers {
#     $groupToQuery = Read-Host "Please provide the group you want to query"
#     $validation = Read-Host "Are you sure that you want to list the members of the group $groupToQuery ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "Listing the member(s) of the $groupToQuery Active Directory group:" -ForegroundColor Green
#             Get-ADGroupMember -Identity $groupToQuery -ErrorAction Stop | Format-Table Name, SamAccountName
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Managing GPOs menu
# function DisplayGPOs {
#     Clear-Host
#     Write-Host "GPOs display"
#     Write-Host "------------------------------------------------------------"
#     Write-Host "1. Display user GPOs"
#     Write-Host "2. Display computer GPOs"
#     Write-Host "R. Return to main menu"
#     Write-Host "Q. Quit"
#     Write-Host "------------------------------------------------------------"
#     $choice = Read-Host "Pick an option"
#     switch ($choice) {
#         1 { DisplayUserGPOs }
#         2 { DisplayComputerGPOs }
#         'R' { ReturnToMainMenu }
#         'Q' { QuitScript }
#     }
# }

# # Listing the GPOs applied to an AD user
# function DisplayUserGPOs {
#     Write-Host ""
#     $userToQuery = Read-Host "Please provide the user you want to query"
#     Write-Host "/!\ User $userToQuery must have logged on at least once /!\" -ForegroundColor Yellow
#     $validation = Read-Host "Are you sure that you want to list the GPOs applied to $userToQuery ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "The following GPOs are applied to $userToQuery" -ForegroundColor Green
#             gpresult /USER $userToQuery /SCOPE user /R
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Listing the GPOs applied to an AD computer
# function DisplayComputerGPOs {
#     Write-Host ""
#     $computerToQuery = Read-Host "Please provide the computer you want to query"
#     $validation = Read-Host "Are you sure that you want to list the GPOs applied to $computerToQuery ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "The following GPOs are applied to $computerToQuery" -ForegroundColor Green
#             gpresult /s $computerToQuery /r /scope computer
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     } 
# }

# # Network Utilities menu
# function NetworkUtilities {
#     Clear-Host
#     Write-Host "Network Utilities"
#     Write-Host "------------------------------------------------------------"
#     Write-Host "1. Test-NetConnection (ex telnet)"
#     Write-Host "2. DiagnoseRouting"
#     Write-Host "R. Return to main menu"
#     Write-Host "Q. Quit"
#     Write-Host "------------------------------------------------------------"
#     $choice = Read-Host "Pick an option"
#     switch ($choice) {
#         1 { TestNetConnection }
#         2 { DiagnoseRouting }
#         'R' { ReturnToMainMenu }
#         'Q' { QuitScript }
#     }
# }

# # Testing connectivity to a remote target on a specific port
# function TestNetConnection {
#     Write-Host ""
#     $targetComputer = Read-Host "Target ?"
#     $targetPort = Read-Host "Port ?"
#     $validation = Read-Host "Are you sure that you would like to test connectivity with port $targetPort on $targetComputer ? y/N"
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "Testing connectivity..." -ForegroundColor Green
#             Test-NetConnection -ComputerName $targetComputer -Port $targetPort
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# # Diagnosing network routes to a remote target
# function DiagnoseRouting {
#     Write-Host ""
#     $targetComputer = Read-Host "Target ?"
#     $validation = Read-Host "Are you sure that you would like to diagnose routing to $targetcomputer ? y/N "
#     if ($validation -eq "y") {
#         try {
#             Write-Host ""
#             Write-Host "Diagnosing routing..." -ForegroundColor Green
#             Test-NetConnection -ComputerName $targetComputer -DiagnoseRouting
#         }
#         catch {
#             Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
#         }
#     }
# }

# function ReturnToMainMenu {
#     Clear-Host
# }

# function QuitScript {
#     Clear-Host
#     Write-Host "Bye, have a great day"
#     Start-Sleep 1
#     Clear-Host
#     Exit
# }

# function InvalidOption {
#     Clear-Host
#     Write-Host "Invalid option, moving back to the main menu." -ForegroundColor Red
#     Start-Sleep 1
#     Clear-Host
# }
# # Launch menu / Main menu
# $global:continue = $true
# while ($global:continue) {
#     Write-Host ""
#     Write-Host "/!\ Please make sure to run this script with privileges /!\" -ForegroundColor Yellow
#     Write-Host "------------------------------------------------------------"
#     Write-Host "1. AD user's groups management"
#     Write-Host "2. AD group management"
#     Write-Host "3. GPOs display"
#     Write-Host "4. Network utilities"
#     Write-Host "Q. Quit"
#     Write-Host "------------------------------------------------------------"
#     $choice = Read-Host "Pick an option"
#     switch ($choice) {
#         1 { ManageADUserGroups }
#         2 { ManageADGroup }
#         3 { DisplayGPOs }
#         4 { NetworkUtilities}
#         'Q' { QuitScript }
#         Default { InvalidOption }
#     }
# }