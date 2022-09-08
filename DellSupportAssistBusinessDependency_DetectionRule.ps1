﻿<#
_author_ = Sven Riebe <sven_riebe@Dell.com>
_twitter_ = @SvenRiebe
_version_ = 1.1
_Dev_Status_ = Test
Copyright Â© 2022 Dell Inc. or its subsidiaries. All Rights Reserved.

No implied support and test in test environment/device before using in any production environment.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
#>

<#
.Synopsis
   This PowerShell is for custom detection in Microsoft MEM for Dell Power Manager

.DESCRIPTION
   This PowerShell will checki if Dell Power Manager is ready installed on a device. It will be used as custom detection in Microsoft MEM win32 install.
   
#>

######################################################################################################################
# PreCheck if SupportAssistUninstall_Cleanup.ps1 is finished                                                         #
######################################################################################################################
$Program_current = Get-CimInstance -ClassName Win32_Product | Where-Object {($_.Name -like "*Dell SupportAssist*" -and $_.Name -notlike "*OS Recovery*" -and $_.Name -notlike "Dell*SupportAssist*Remediation")} | Select-Object -ExpandProperty Name


if($Program_current -ne $null)
{
    Start-Sleep -Seconds 300
}


######################################################################################################################
# Checking if a SupportAssist existing after Cleanup script                                                          #
######################################################################################################################
$Program_current = Get-CimInstance -ClassName Win32_Product | Where-Object {($_.Name -like "*Dell SupportAssist*" -and $_.Name -notlike "*OS Recovery*" -and $_.Name -notlike "Dell*SupportAssist*Remediation")} | Select-Object -ExpandProperty Name



if($Program_current -eq $null)
{
    Write-Host "Found it!"
}