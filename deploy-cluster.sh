#   Bind script parameters
environment=$1
location=$2
rg=$3
clusterName=$4
vaultId=$5

echo "Resource Group:  $rg"
echo "Cluster Name:  $clusterName"
echo "Vault ID:  $vaultId"
echo "Environment:  $environment"

#   Test if there is a resource group
filter="[?name=='$rg']".name
rgCount=$(az group list -o tsv --query $filter | wc -l)

echo "Resource Group Count:  $rgCount"

#   If there is no resource group, deploy one
if [ $rgCount -ne 1 ]
then
    echo "No resource group:  deploy one"

    az group create -g "$rg" -l $location
fi

#   Test if there is a cluster
filter="[?name=='$clusterName']".name
clusterCount=$(az aks list -g $rg -o tsv --query $filter | wc -l)

echo "Cluster Count:  $clusterCount"

#   If there is no cluster, deploy it without hooking the routing table
if [ $clusterCount -ne 1 ]
then
    echo "No cluster:  first deploy"

    az group deployment create -g shared-infra-dev --name deploy-$(date +"%d%m%y-%H%M%S") --template-file shared-infra.json \
     --parameters routeTableId= vault-id="$vaultId" environment="$environment"
fi

#   Get the Node Resource Group:  the RG with actual resources
nrg=$(az aks show --resource-group $rg --name $clusterName --query nodeResourceGroup -o tsv)

echo "Node Resource Group:" $nrg

#   Get the routing table
rt=$(az network route-table list -g $nrg -o tsv --query [0].id)

echo "Routing Table:" $rt

echo "Deploy with routing table"

#   Deploy with routing table
nrg=$(az group deployment create -g shared-infra-dev --name deploy-$(date +"%d%m%y-%H%M%S") \
    --template-file shared-infra.json \
    --parameters routeTableId="$rt" vault-id="$vaultId" environment="$environment" \
    --query properties.outputs.nodeResourceGroup.value -o tsv)

echo "Node Resource Group:  $nrg"

#   Deploy main ip in nrg resource group
ip=$(az group deployment create -g "$nrg" --name deploy-$(date +"%d%m%y-%H%M%S") \
    --template-file main-ip.json --parameters environment="$environment" \
    --query properties.outputs.ipAddress.value -o tsv)

echo "IP Address:  $ip"

#   Pass it as an output variable
echo "##vso[task.setvariable variable=ip;]$ip"
