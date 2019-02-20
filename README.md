# Powershell

Custom powershell scripts used for DevOps and System Engineering

| Name        | Type           | Description  |
| ------------- |:-------------:| ----- |
| check_ports_established.ps1 | nagios check | Nagios NRPE script that checks for established ephemeral port usage and alerts when they begin to fill up |
| check_ports_time_wait.ps1 | nagios check | Nagios NRPE script that checks for ephemeral ports in the TIME WAIT condition and alerts when they cross a certain threshold
| disable_iisAppPool.ps1 | maintenance | simple maintenance script to disable IIS apps within a windows environment.  Deploy via Octopus. |