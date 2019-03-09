#!/bin/bash

###################################################################################################
### Determine the ip address of the main public IP of the AKS cluster
###
### Outputs:
###     ip:  IP address

#   Bind script parameters
nrg=$1
colour=$2
environment=$3

echo "Node Resource Group:  $nrg"
echo "Colour:  $colour"
echo "Environment:  $environment"

#   Get IP address
echo "Get IP Address..."
ipName="main-ip-$colour-$environment"
echo "IP Name:  $ipName"
ip=$(az network public-ip show -g $nrg -n $ipName -o tsv --query "ipAddress")
echo "IP Address:  $ip"

#   Pass it as an output variable
echo "##vso[task.setvariable variable=ip;]$ip"