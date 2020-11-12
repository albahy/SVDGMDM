# $Policy = "RemoteSigned"
# If ((get-ExecutionPolicy) -ne $Policy) {
#     Set-ExecutionPolicy $Policy #-Force 
#     Exit
# } 
Clear-Host
Find-Module -Name Plaster | Install-Module -Scope CurrentUser
Get-Command -Module Plaster 

# The path to the Plaster template that we're invoking.
$templatePath = "$env:USERPROFILE/home/bfadam/.local/share/powershell/Modules/Plaster/1.1.3/Templates/NewPowerShellScriptModule"

# The destination path where we are going to scaffold the module, remember we are calling it 'PSImportFiles'.
$destinationPath = "$env:USERPROFILE/media/bfadam/Seagate BUP BK SCSI Disk Device/S-For ShareMe/SVDGMDM_PSProject/PSImportFiles/"

# Invoke that sucker!
Invoke-Plaster -TemplatePath $templatePath -DestinationPath $destinationPath
