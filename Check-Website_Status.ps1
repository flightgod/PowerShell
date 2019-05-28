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
