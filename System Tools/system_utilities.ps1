#######################################################
#######            System Utilities             #######
#######################################################
####### Version release date: August 31st 2024  #######
#######################################################


################ System Functions ################

function ListPrinters {
    Write-Host ""
    $targetComputer = Read-Host "Target ?"
    try {
        Write-Host ""
        Write-Host "Checking for known printers..." -ForegroundColor Green
        Get-Printer -ComputerName $targetComputer | Select-Object Name,Type,Location,Comment,DriverName,PrinterStatus | Format-Table -autoSize
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
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
    Write-Host "1. List Printers"
    Write-Host "Q. Quit"
    Write-Host "------------------------------------------------------------"
    $choice = Read-Host "Pick an option"
    switch ($choice) {
        1 { ListPrinters }
        'Q' { QuitScript }
        Default { InvalidOption }
    }
}
