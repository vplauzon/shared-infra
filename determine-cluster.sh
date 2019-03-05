#   Bind script parameters
environment=$1
colour=$2

echo "Environment:  $environment"
echo "Colour:  $location"

echo "##vso[task.setvariable variable=rg;]shared-stateless-$environment-$colour"
echo "##vso[task.setvariable variable=cluster;]shared-cluster-$environment-$colour"
