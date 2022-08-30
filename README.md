# set-ethernet-to-dhcp
With this script you can set all[^1] the Ethernet adapter to DHCP IP addresses. Work only with elevated rights.
Useful script if you plan to launch it from an Active Directory Server for specif group, or if you just want to automate the process.

# Other info:
In the first few lines of code you can change the behavior of the script, for example, if you want to look for network adapter that are online, you can change the second line to `$adapter = Get-NetAdapter | ? {$_.Status -eq "up"}`.

Remember to set the execution policy to unrestricted to run the script - use the command `Set-ExecutionPolicy Unrestricted` (more info: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2 and https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2).

[^1]: The script will look for **EVERY** adapter that **CONTAINS** the name "Ethernet".
