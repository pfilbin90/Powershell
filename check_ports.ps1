#####################################
# $count = netstat -ano | findstr ESTABLISHED | measure | Select-Object -expand count
# Invoke-Expression $count | Tee-Object -Variable $out 

# if ($out -gt 5) {write 'this worked'}
# else {write "this didnt work"}

# Add the following to NSClient.ini:
#
#    [/settings/external scripts/wrapped scripts]
#    check_ports = check_ports.ps1
#
#    [/settings/external scripts/wrappings]
#    ps1 = cmd /c echo If (-Not (Test-Path "scripts\%SCRIPT%") ) { exit(3) }; scripts\\%SCRIPT% %ARGS%; exit($lastexitcode) | powershell.exe -command -
#
#  Written by Peter Filbin 2018
#
#
#####################################

$ok = 0
$warning = 1
$critical = 2
$unknown = 3

	try {
		$count = netstat -ano | findstr ESTABLISHED | measure | Select-Object -expand count
			if ($count -lt "10000") { 
                    Write-Host "Okay - Showing" $count "connections"
                    exit $ok }	
            elseif ($count -gt "10000" -and $count -lt "14000") { 
                    Write-Host "Warning - Showing" $count "connections"
                    exit $warning }		
            elseif ($count -gt "14000") {
                    Write-Host "Critical - Showing" $count "connections"
                    exit $critical}
            else {
                    Write-Host "Unknown"
                    exit $unkown}
        }
				
    catch{
	    $desc = $_.Exception.Message	
	    Write-Output $desc
	}

	

		