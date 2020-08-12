#!/bin/bash

###################################################################################################
### Sets the DNS label of the public IP of the cluster
###
### Inputs:
###     resource group:  Resource Group containing the cluster
###     cluster name:  Name of the cluster
###     DNS Label:  Label to apply to the IP

#   Bind script parameters
rg=$1
cluster=$2
label=$3

echo "Resource Group:  $rg"
echo "Cluster:  $cluster"
echo "Label:  $label"

#   Fetch the id of the public IP
ipid=$(az aks show --resource-group $rg -n $cluster --query networkProfile.loadBalancerProfile.effectiveOutboundIps[0].id -o tsv)

echo "Public IP ID:  $ipid"

#   Set the DNS Label
az network public-ip update --ids $ipid --public-ip-prefix $label