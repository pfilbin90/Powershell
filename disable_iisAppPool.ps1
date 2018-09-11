try{ 
    import-module webadministration 
    if((Get-WebAppPoolState "Mozu.PricingRuntime2.WebApi").Value -eq 'Started'){ 
        Stop-WebAppPool "Mozu.PricingRuntime2.WebApi" 
        Write-Host "PricingRuntime2 App Pool Stopped" 
    } 
    else{Write-Host "PricingRuntime2 App Pool Already Stopped"} 
} 
catch {Write-Host "IIS not installed"} 