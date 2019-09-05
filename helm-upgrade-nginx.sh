#!/bin/bash

###################################################################################################
### Upgrade NGinx Helm Chart
###
### Inputs:
###     rg:  Resource group of the cluster
###     cluster:  Name of the cluster
###     ip:  IP address to attach to the load balancer

#   Bind script parameters
rg=$1
cluster=$2
ip=$3

echo "Resource Group:  $rg"
echo "Cluster Name:  $cluster"
echo "IP:  #ip"
echo

echo "Attach to AKS cluster"

az aks get-credentials -g $rg -n $cluster

echo "Helm command"

./helm upgrade --install \
  --set rbac.create=false,controller.replicaCount=2,controller.service.loadBalancerIP=$ip \
  --wait main-ingress stable/nginx-ingress
