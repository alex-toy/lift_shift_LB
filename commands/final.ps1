$Global:AGName = "alexeiag"
$Global:AGAddressPool = "vm-backend"
$Global:AGHTTPSettings = "http-settings"
$Global:AGHTTPListener = "http-listener"


az network application-gateway create `
    --resource-group $RGName `
    --name $AGName `
    --vnet-name $VNETName `
    --subnet $SUBNET2Name `
    --public-ip-address ag-ip 


az network application-gateway address-pool create `
    --resource-group $RGName `
    --gateway-name $AGName `
    -n MyAddressPool `
    --servers $IP1 $IP2


az network application-gateway http-settings create `
    --resource-group $RGName `
    --gateway-name $AGName `
    --name alexeihttpsettings `
    --port 80 `
    --protocol Http
    # [--affinity-cookie-name]
    # [--auth-certs]
    # [--connection-draining-timeout]
    # [--cookie-based-affinity {Disabled, Enabled}]
    # [--enable-probe {false, true}]
    # [--host-name]
    # [--host-name-from-backend-pool {false, true}]
    # [--no-wait]
    # [--path]
    # [--probe]
    # [--protocol {Http, Https, Tcp, Tls}]
    # [--root-certs]
    # [--timeout]