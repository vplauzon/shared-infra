#   Bind script parameters
rg=$1

echo "Resource Group:" $rg

#   Get the Node Resource Group:  the RG with actual resources
nrg=$(az aks show --resource-group $rg --name cluster --query nodeResourceGroup -o tsv)

echo "Node Resource Group:" $nrg

#   Get the routing table
rt=$(az network route-table list -g $nrg -o tsv --query [0].id)

echo "Routing Table:" $rt

#   Get the subnets
subnet1=$(az network vnet subnet list -g $rg --vnet-name cluster-vnet -o tsv --query [0].id)
subnet2=$(az network vnet subnet list -g $rg --vnet-name cluster-vnet -o tsv --query [1].id)

echo "Subnet 1:" $subnet1
echo "Subnet 2:" $subnet2

#   Attach the routing table to the subnets
az network vnet subnet update -g $rg --ids $subnet1 $subnet2 --route-table $rt
