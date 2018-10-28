#   Bind script parameters
rg=$1
clusterName=$2

echo "Resource Group:  $rg"
echo "Cluster Name:  $clusterName"

#   Get the Node Resource Group:  the RG with actual resources
nrg=$(az aks show --resource-group $rg --name $clusterName --query nodeResourceGroup -o tsv)

echo "Node Resource Group:" $nrg

#   Pass it as an output variable
echo "##vso[task.setvariable variable=nrg;]$nrg"