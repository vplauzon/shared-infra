#!/bin/bash

###################################################################################################
### Determine the ip address of the main public IP of the AKS cluster
###
### Inputs:
###     nrg:  Node Resource Group
###     mainIp:  Name of the main ip within nrg
###
### Outputs:
###     ip:  IP address

#   Bind script parameters
nrg=$1
mainIp=$2

echo "Node Resource Group:  $nrg"
echo "Main IP:  $mainIp"

#   Get IP address
echo "Get IP Address..."
ip=$(az network public-ip show -g $nrg -n $mainIp -o tsv --query "ipAddress")
echo "IP Address:  $ip"

#   Pass it as an output variable
echo "##vso[task.setvariable variable=ip;]$ip"