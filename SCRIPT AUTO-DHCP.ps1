$IPType = "IPv4"
$adapter = Get-NetAdapter | ? {$_.Name -contains "Ethernet"}
$interface = $adapter | Get-NetIPInterface -AddressFamily $IPType
echo $interface

$interface | ForEach-Object -Process {
    If ($interface.Dhcp -eq "Disabled") 
    {
       # Remove existing gateway
       If (($interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
       $interface | Remove-NetRoute -Confirm:$false
       echo "Imposto il gateaway predefinito"
       }
       # Enable DHCP
       $interface | Set-NetIPInterface -DHCP Enabled
        echo "Imposto il DHCP"
       # Configure the DNS Servers automatically
       $interface | Set-DnsClientServerAddress -ResetServerAddresses
       echo "Resetto i DNS"
    }
}