# Delete-Files
Delete files older than X amount of days quickly via PowerShell across multiple servers using WINRM

# Example Delete Files over 30 days old

Import-Module .\Delete-Files.ps1

Delete-Files -Servers "Server1","Server2" -FolderPath "C:\inetpub\logs\LogFiles\W3SVC1" -Days 30 -Delete Yes

# Example Check Volume of Files over 30 days old

Import-Module .\Delete-Files.ps1

Delete-Files -Servers "Server1","Server2" -FolderPath "C:\inetpub\logs\LogFiles\W3SVC1" -Days 30 -Delete No
