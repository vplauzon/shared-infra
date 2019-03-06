#   Bind script parameters
environment=$1
colour=$2

echo "Environment:  $environment"
echo "Colour:  $colour"

rg="shared-stateless-$environment-$colour"
cluster="shared-cluster-$environment-$colour"

echo "Resource Group:  $rg"
echo "Cluster Name:  $cluster"

echo "##vso[task.setvariable variable=rg;$rg]"
echo "##vso[task.setvariable variable=cluster;$cluster]"
