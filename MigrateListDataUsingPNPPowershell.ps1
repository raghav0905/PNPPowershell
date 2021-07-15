
#variables
$sourceURL = "https://xyz.sharepoint.com/sites/abc"
$listTitle = "Issue Tracker"
$outputTemplateFile = "C:\Temp\ListSchema.xml"
$destnURL = "https://ABC.sharepoint.com/sites/DeveloperSite/TestTrainingSite"

#Connect with source site
Connect-PnPOnline -Url $sourceURL -SPOManagementShell
 
#Get the template of source site lists
$template = Get-PnPSiteTemplate -Handlers Lists -Out $outputTemplateFile -Force

$listURL = "Lists/" + $listTitle

#Add data to list 
Add-PnPDataRowsToSiteTemplate -Path $outputTemplateFile -List $listURL

Disconnect-PnPOnline

#Connect to destination site
Connect-PnPOnline -Url $destnURL -SPOManagementShell

#Apply the site template to create list with data
Invoke-PnPSiteTemplate -Path $outputTemplateFile
