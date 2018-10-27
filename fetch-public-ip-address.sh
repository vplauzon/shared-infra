$rg = $(echo "shared-infra-$environment")
$publicIp = $(echo "main-ip-$environment")

#   Display variables
echo "Environment:  $environment"
echo "Resource group:  $rg"
echo "Public IP:  $publicIp"

#   Fetch the ip address 
ip=$(az network public-ip show -g $rg -n $publicIp -o tsv --query ipAddress)

#   Display it
echo "Public IP is $ip"

#   Pass it as an output variable
echo "##vso[task.setvariable variable=ip;]$ip"