#Requires
# V2 PowerShell
# WINRM Enabled On Remote Servers


Function Delete-Files {


param([Parameter(Mandatory=$true)][String[]] $Servers, [Parameter(Mandatory=$true)][String] $FolderPath, [Parameter(Mandatory=$true)][int] $Days, [Parameter(Mandatory=$true)][ValidateSet('Yes','No')][String[]] $Delete)



$Date = (Get-Date).AddDays(-$Days) 

foreach ($Server in $Servers) {

$GetFiles = Invoke-Command -ComputerName $Server -ScriptBlock {Get-ChildItem -Path $using:FolderPath | Where-Object {$_.LastWriteTime -LT $using:Date}}

$GetFiles 

$FileCount = $GetFiles.count


Write-Verbose "Found $FileCount files that are older than $Date on $Server" -Verbose



if ($Delete -eq "Yes" -and $FileCount -ge 1) {

Write-Verbose "Delete Feature is toggled on. Deleting $FileCount files which are listed above on $Server..." -Verbose


foreach ($File in $GetFiles ) {

$DeleteFiles = Invoke-Command -ComputerName $Server -ScriptBlock {$using:File | Remove-Item}

}

}

elseif ($Delete -eq "Yes" -and $FileCount -eq 0) {

Write-Verbose "Delete Feature is toggled on. But $FileCount files found on $Server... Deleting Skipped" -Verbose


}

elseif ($Delete -eq "No") {

Write-Verbose "Delete Feature is toggled off. No files have been deleted" -Verbose


}

}

}

