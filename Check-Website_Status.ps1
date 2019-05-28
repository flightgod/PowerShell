<#
Testing to run remotely in Memory

$url = 'https://raw.githubusercontent.com/flightgod/PowerShell/master/Check-Website_Status.ps1'
iex ((New-Object Net.WebClient).DownloadString($url))

#>

param (
$Site = "http://google.com"
)


# Command to Check Status
$statusCode = wget $site | % {$_.StatusCode}

If ($statusCode -eq 200) {
    Write-Host "Site is up"
} Else { 
    Write-Host "Site is down"
}
