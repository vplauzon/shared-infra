#   Bind script parameters
rg=$1
clusterName=$2

echo "Resource Group:  $rg"
echo "Cluster Name:  $clusterName"

#   Test if there is a cluster
filter="[?name=='cluster-dev']".name
clusterCount=$(az aks list -o tsv --query $filter | wc -l)

if [$clusterCount -eq 1]
then
    #   Get the Node Resource Group:  the RG with actual resources
    nrg=$(az aks show --resource-group $rg --name $clusterName --query nodeResourceGroup -o tsv)

    echo "Node Resource Group:" $nrg

    #   Get the routing table
    rt=$(az network route-table list -g $nrg -o tsv --query [0].id)

    echo "Routing Table:" $rt

    #   Pass it as an output variable
    echo "##vso[task.setvariable variable=routeTableId;]$rt"
else
    #   Pass empty as an output variable
    echo "##vso[task.setvariable variable=routeTableId;]"
fi
