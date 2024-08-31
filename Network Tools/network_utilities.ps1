#######################################################
#######            Network Utilities            #######
#######################################################
####### Version release date: August 31st 2024  #######
#######################################################


################ Network Functions ################

# Testing connectivity to a remote target on a specific port
function TestNetConnection {
    Write-Host ""
    $targetComputer = Read-Host "Target ?"
    $targetPort = Read-Host "Port ?"
    $validation = Read-Host "Are you sure that you would like to test connectivity with port $targetPort on $targetComputer ? y/N"
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "Testing connectivity..." -ForegroundColor Green
            Test-NetConnection -ComputerName $targetComputer -Port $targetPort
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Diagnosing network routes to a remote target
function DiagnoseRouting {
    Write-Host ""
    $targetComputer = Read-Host "Target ?"
    $validation = Read-Host "Are you sure that you would like to diagnose routing to $targetcomputer ? y/N "
    if ($validation -eq "y") {
        try {
            Write-Host ""
            Write-Host "Diagnosing routing..." -ForegroundColor Green
            Test-NetConnection -ComputerName $targetComputer -DiagnoseRouting
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
    Write-Host "Network Utilities"
    Write-Host "/!\ Please make sure to run this script with privileges /!\" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------"
    Write-Host "1. Test-NetConnection (ex telnet)"
    Write-Host "2. DiagnoseRouting"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch ($choice) {
        1 { TestNetConnection }
        2 { DiagnoseRouting }
        'Q' { QuitScript }
        Default { InvalidOption }
    }
}