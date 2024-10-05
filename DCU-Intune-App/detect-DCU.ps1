$ProgramInstalled = Get-CimInstance -ClassName Win32_Product -Filter "Name like '%Dell%Command%'" | Select-Object -ExpandProperty Name

if ($ProgramInstalled)
{
    Write-Host "Found it! $ProgramInstalled"
    exit 0
}
else
{
    Write-Host "Not found!"
    exit 1
}