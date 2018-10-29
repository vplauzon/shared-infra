#   Bind script parameters
rg=$1
clusterName=$2

echo "Resource Group:  $rg"
echo "Cluster Name:  $clusterName"

#   Test if there is a cluster
filter="[?name=='$clusterName']".name
clusterCount=$(az aks list -o tsv --query $filter | wc -l)

echo "Cluster Count:  $clusterCount"

#   Pass it as an output variable
if [$clusterCount -eq 1]
then
    echo "##vso[task.setvariable variable=clusterExist;]true"
else
    echo "##vso[task.setvariable variable=clusterExist;]false"
fi
