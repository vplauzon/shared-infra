#!/bin/bash

###################################################################################################
### Determine the name of the node group
###
### Inputs:
###     rg:  Resource group of the cluster
###     cluster:  Name of the cluster
###
### Outputs:
###     nrg:  Node resource group

#   Bind script parameters
rg=$1
cluster=$2

echo "Resource Group:  $rg"
echo "Cluster Name:  $cluster"

#   Test if there is a resource group
echo "Get Resource Group..."

filter="[?name=='$rg'].name"
rgCount=$(az group list -o tsv --query $filter | wc -l)

echo "Resource Group Count:  $rgCount"

if [[ $rgCount == 1 ]]
then
    #   Test if there is a cluster
    echo "Get Cluster..."

    filter="[?name=='$cluster'].name"
    clusterCount=$(az aks list -g $rg -o tsv --query $filter | wc -l)

    echo "Cluster Count:  $clusterCount"

    if [[ $clusterCount == 1 ]]
    then
        #   Get the Node Resource Group:  the RG with actual resources
        echo "Get node resource group..."

        nrg=$(az aks show --resource-group $rg -n $cluster --query nodeResourceGroup -o tsv)

        echo "Node Resource Group:" $nrg

        #   Pass it as an output variable
        echo "##vso[task.setvariable variable=nrg;]$nrg"
    fi
fi