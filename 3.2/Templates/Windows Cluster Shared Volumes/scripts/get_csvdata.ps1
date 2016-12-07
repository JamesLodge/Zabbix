#function Get-CSVData($CSVPath) {

 param ([string]$CSVPath)

Import-Module FailoverClusters
$obj =
$objs = @()

$csvs = Get-ClusterSharedVolume 
foreach ( $csv in $csvs )
{
   $csvinfos = $csv | select -Property Name -ExpandProperty SharedVolumeInfo
     foreach ( $csvinfo in ($csvinfos | Where-Object {$_.FriendlyVolumeName -Contains $CSVPath})  ) 
   {
   
      $obj = New-Object PSObject -Property @{
         #'{#CSVDiskName}'        = $csv.Name
         #'{#CSVPath}'        = $csvinfo.FriendlyVolumeName
         '{#CVSSize}'        = $csvinfo.Partition.Size
         '{#CVSFreeSpace}'   = $csvinfo.Partition.FreeSpace
         '{#CVSUsedSpace}'   = $csvinfo.Partition.UsedSpace
        # PercentFree = $csvinfo.Partition.PercentFree
      }
      
      $objs += $obj
    
   }
   
}
if ($obj) {
write-host "{"
write-host " `"data`":[`n"
$obj |  ConvertTo-Json
write-host
write-host " ]"
write-host "}"
}
#}