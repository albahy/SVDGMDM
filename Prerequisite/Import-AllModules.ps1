#################################################################
## function Import-AllModules
#################################################################
Clear-Host
function Import-AllModules {
    $modules = @(
        @{ Name = 'dbatools' }
        @{ Name = 'sqlps' }
        @{ Name = 'SQLServer' }
        @{ Name = 'SQLPSX' }
    )
    foreach ($module in $modules) {
        #Use PowerShellGet Module ,find-Module function:

        if (!(Get-Module -Name $module.Name -ListAvailable -errorAction SilentlyContinue)) {
            write-host "Module : $module.Name does NOT Exist." -foregroundcolor "red" -BackgroundColor white
            return;
        }
        else {
            Import-Module -Name $module.Name -Verbose -Force -ErrorAction SilentlyContinue
        }
    }
}