[string] $target = "https://reshmibc.atlassian.net"
[string] $username = "reshmi.babu@relevancelab.com"
[string] $password = "enigmaeish"

function set-Headers
{
$basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($Username):$Password"))
$headers = @{
Authorization = $basicAuth
}
return $headers
}

Function get-RestData
{
param([Parameter(Mandatory=$True)] $headers,
[Parameter(Mandatory=$True)]$requestURI)
return Invoke-RestMethod -uri $requestURI -Method GET -Headers $headers
}

Function Add-Jira-User
{
param([Parameter(Mandatory=$True)] $emailAddress,
[Parameter(Mandatory=$True)]$displayName)

$headers = set-Headers
$requestURI = "$target/rest/api/2/user"
$Data= @{
"X-ExperimentalApi" = "true"
     username="Sneha"
     password="qwerty@1234"
     emailAddress= "sneha@relevancelab.com"
     displayName= "Sneha"


}

$json = ConvertTo-Json -InputObject $Data
$response=Invoke-RestMethod -uri $requestURI -Method POST -Headers $headers -Body $json -ContentType "application/json"
Write-Host $response.status
}
Function Get-Jira-Users
{
$headers = set-Headers
$requestURI = "https://reshmibc.atlassian.net/rest/api/2/user/?username=admin"
$response=get-RestData -headers $headers -requestURI $requestURI
return $response.values
}


#$users=Get-Jira-Users
#write-host $users
Add-Jira-User -emailAddress "vignesh@gmail.com" -displayname "Vignesh"
#jira.add_user(-emailaddress ray@jira.com, password=xyz@123, displayname='Ray', notify=True, active=True, ignore_existing=False)