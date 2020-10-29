# Delete-Files
Delete files older than X amount of days quickly via PowerShell across multiple servers using WINRM


#Example clear logs over 30 days old


Clear-Logs -Servers "Server1","Server2" -FolderPath "C:\inetpub\logs\LogFiles\W3SVC1" -Days 30 -Delete Yes


#Check volume of logs over 30 days old and their names/locations


Clear-Logs -Servers "Server1","Server2"  -FolderPath "C:\inetpub\logs\LogFiles\W3SVC1" -Days 30 -Delete No
