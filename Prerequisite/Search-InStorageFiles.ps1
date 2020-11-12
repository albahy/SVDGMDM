#----------------------------------------------------------
# Search-InStorageFiles: 
#----------------------------------------------------------
Function Search-InStorageFiles (
    $fileName = $(Read-Host "Give file name you want to find?")
    , $filePath = $(Read-Host "give the path for the file location?")
    , $fileExten = $(Read-Host "give the extention for the file?")
    , $SearchFilter = $(Read-Host "give the search word?")
) {
    $LocationAndlFileName = $filePath + '\' + $fileName + '.' + $fileExten
    if (Test-Path -Path $filePath) {

        $fileFound = Get-ChildItem -Recurse -Force $filePath -ErrorAction SilentlyContinue | 
        Where-Object { ($_.PSIsContainer -eq $false) -and ( $_.Name -like "*$fileName*") -and ($_.extension -like "*$fileExten*") } |
        Select-Object Name, Directory | Format-Table -AutoSize * 

        If ($fileFound) {
            $msg = "$LocationAndlFileName Exists"
            Write-Host $msg -ForegroundColor Green
            $FilterMatches = Select-String $SearchFilter $LocationAndlFileName
            if ($FilterMatches.count) {
                $msg = "$SearchFilter exists in $LocationAndlFileName file"
                write-host $msg -ForegroundColor Green
                return $true
            }
            else {
                $msg = "$SearchFilter NOT Exists in the file:' $LocationAndlFileName'"
                write-host $msg -ForegroundColor red
                return $false
            }
        }
        else {
            $msg = "$LocationAndlFileName The File does not exist"
            Write-Host $msg -ForegroundColor red
            return $false
        }
    }
}






