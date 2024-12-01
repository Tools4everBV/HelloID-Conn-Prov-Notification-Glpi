#####################################################
# HelloID-Conn-Prov-Notification-Glpi
# Version: 1.0.0 | new-powershell-connector
#####################################################

# Set to true at start, because only when an error occurs it is set to false
$outputContext.Success = $true

# Enable TLS1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

#region functions
function New-GlpiTicket {
	param (
		[Parameter(Mandatory)][string]$User
	)

	$api = "$Server/apirest.php"
	$headers = @{
		"Content-Type" = "application/json";
		"Authorization" = "user_token $UserToken";
		"App-Token" = $AppToken;
	}

	$init = Invoke-RestMethod -Headers $headers "$api/initSession"
	$headers.Remove("Authorization")
	$headers["Session-Token"] = $init.session_token

	try {
		$item = @{
			#type = [Type number]; # example 2 for Request (optional)
			#itilcategories_id = [ID number]; # example 57 for IT > New user (optional)
			name = "[Message here]";
			content = "[Message here] for user : $User";
		}

		$body = ConvertTo-Json @{ input = $item }
		Invoke-RestMethod -Method Post -Headers $headers -Body $body "$api/Ticket"
	} finally {
		Invoke-RestMethod -Headers $headers "$api/killSession" > $null
	}
}
#endregion functions

$actionContext.DryRun = $false
if (-Not($actionContext.DryRun -eq $true)) {
    
    try{
        $result = New-GlpiTicket -User $User
        $outputContext.AuditLogs.Add([PSCustomObject]@{
            Message = "Successfully submitted the GLPI ticket for user : $User"
            IsError = $false
        })
    }catch{
        $outputContext.AuditLogs.Add([PSCustomObject]@{
            Message = "Error when submitting GLPI Ticket for user : $User - Error $_."
            IsError = $true
        })
        $outputContext.Success = $false
    }
}
