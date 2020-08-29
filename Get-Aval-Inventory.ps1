<#
wmic diskdrive get  | Export-CSV $Ruta -append -force -NoTypeInformation

Get-ComputerInfo | Export-Csv $Ruta
#>
Param( 
    [string]$Ruta
) 

gwmi Win32_ComputerSystem | Export-CSV $Ruta -append -force -NoTypeInformation
gwmi Win32_OperatingSystem | Export-CSV $Ruta -append -force -NoTypeInformation
gwmi Win32_BIOS | Export-CSV $Ruta -append -force -NoTypeInformation
gwmi Win32_Processor | Export-CSV $Ruta -append -force -NoTypeInformation
gwmi Win32_NetworkAdapterConfiguration |` where{$_.IPEnabled -eq "True"} | Export-CSV $Ruta -append -force -NoTypeInformation
gwmi Win32_DiskDrive | Export-CSV $Ruta -append -force -NoTypeInformation
