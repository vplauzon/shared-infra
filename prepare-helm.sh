#!/bin/bash

###################################################################################################
### Prepare Helm
###
### Inputs:
###     rg:  Resource group of the cluster
###     cluster:  Name of the cluster

#   Bind script parameters
rg=$1
cluster=$2

echo "Resource Group:  $rg"
echo "Cluster Name:  $cluster"
echo

echo "Attach to AKS cluster"

az aks get-credentials -g $rg -n $cluster

echo "Give helm execution priviledge"
chmod +x ./helm

echo "Install stable repo"
./helm repo add stable https://kubernetes-charts.storage.googleapis.com
