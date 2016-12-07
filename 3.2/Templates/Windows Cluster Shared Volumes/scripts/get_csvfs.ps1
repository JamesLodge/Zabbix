$csvfsPS = Get-ClusterSharedVolume | select -Expand SharedVolumeInfo 
$csvfsWMI = Get-WmiObject win32_PerfFormattedData_CsvFsPerfProvider_ClusterCSVFileSystem
$CSVObj = New-Object psobject -Property @{
            '{#CSVFS}' = $csvfsWMI.Name
            '{#CSVNameSpace}' = $csvfsPS.FriendlyVolumeName
            }


write-host "{"
write-host " `"data`":[`n"
$CSVObj |  ConvertTo-Json
write-host
write-host " ]"
write-host "}"