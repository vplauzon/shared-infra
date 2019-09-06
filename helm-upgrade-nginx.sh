#!/bin/bash

###################################################################################################
### Upgrade NGinx Helm Chart
###
### Inputs:
###     ip:  IP address to attach to the load balancer

#   Bind script parameters
ip=$1

echo "IP:  $ip"
echo

echo "Helm command"

./helm upgrade --install \
  --set rbac.create=false \
  --set controller.replicaCount=2 \
  --set controller.service.loadBalancerIP=$ip \
  --wait main-ingress stable/nginx-ingress
