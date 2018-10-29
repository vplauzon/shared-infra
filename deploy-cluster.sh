#   Bind script parameters
rg=$1
clusterName=$2
vaultId=$3
environment=$4

echo "Resource Group:  $rg"
echo "Cluster Name:  $clusterName"
echo "Vault ID:  $vaultId"
echo "Environment:  $environment"

#   Test if there is a cluster
filter="[?name=='cluster-dev']".name
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

az group deployment create -g shared-infra-dev --name deploy-$(date +"%d%m%y-%H%M%S") --template-file shared-infra.json  --parameters routeTableId="$rt" vault-id="$vaultId" environment="$environment"
