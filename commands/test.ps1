$Global:AGName = "alexeiag"
$Global:AGAddressPool = "vm-backend"
$Global:AGHTTPSettings = "http-settings"
$Global:AGHTTPListener = "http-listener"


az network application-gateway http-listener create `
    --resource-group $RGName `
    --frontend-port 80 `
    --gateway-name $AGName `
    --name alexeihttplistener
    # [--frontend-ip]
    # [--host-name]
    # [--host-names]
    # [--no-wait]
    # [--ssl-cert]
    # [--ssl-profile-id]
    # [--waf-policy]

