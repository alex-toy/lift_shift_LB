"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE AN APPLICATION GATEWAY :"

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
    --name $AGAddressPool `
    --servers $IP1 $IP2

$rule = az network application-gateway rule list `
    --resource-group $RGName `
    --gateway-name $AGName | ConvertFrom-Json | Foreach-Object { $_.name }

az network application-gateway rule update `
    --resource-group $RGName `
    --gateway-name $AGName `
    --name $rule `
    --address-pool $AGAddressPool

