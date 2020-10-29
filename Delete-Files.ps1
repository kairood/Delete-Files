Function Delete-Files {


param([Parameter(Mandatory=$true)][String[]] $Servers, [Parameter(Mandatory=$true)][String] $FolderPath, [Parameter(Mandatory=$true)][int] $Days, [Parameter(Mandatory=$true)][ValidateSet('Yes','No')][String[]] $Delete)



$Date = (Get-Date).AddDays(-$Days)

foreach ($Server in $Servers) {

$GetFiles = Invoke-Command -ComputerName $Server -ScriptBlock {Get-ChildItem -Path $using:FolderPath | Where LastWriteTime -LT $using:Date}

$GetFiles 

$FileCount = $GetFiles.count


Write-Verbose "Found $FileCount files that are older than $Date on $Server" -Verbose



if ($Delete -eq "Yes") {

Write-Verbose "Delete Feature is toggled on. Deleting $FileCount files which are listed above on $Server..." -Verbose


$DeleteFiles = Invoke-Command -ComputerName $Server -ScriptBlock {$using:GetFiles | Remove-Item}


}

elseif ($Delete -eq "No") {

Write-Verbose "Delete Feature is toggled off. No files have been deleted" -Verbose


}

}

}

