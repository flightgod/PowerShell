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

# Install the PowerShell Module
#Install-Module -Name Microsoft.Online.SharePoint.PowerShell

#Import and Connect
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking

Connect-SPOService -Url https://ftj1.sharepoint.com


# Function to Update SharePoint List
#Need to make o365 Connection
Function UpdateStatus {
    $SPWeb = Get-SPWeb https://ftj1.sharepoint.com/sites/EnterpriseSystems2
    $List = $SPWeb.Lists["GIAS Environment Status"]
    $items = $List.Items
<#    foreach ($item in $items) {
        $taskStatus = $item["Status"]
        $docStatus = $item["Document Status"]
        if ($taskStatus -eq "Completed" -and $docStatus -eq "Pending") {
            $item["Document Status"] = "Approved"
            $item.Update()
            $list.Update()
        }
} #>
$SPWeb.Dispose()

}

