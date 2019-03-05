#!/bin/sh

#   Bind script parameters
echo "##vso[task.setvariable variable=aks-ssh-public-key;]$1"
echo "##vso[task.setvariable variable=aks-dns-prefix;]$2"
echo "##vso[task.setvariable variable=aks-app-id;]$3"
echo "##vso[task.setvariable variable=aks-object-id;]$4"
echo "##vso[task.setvariable variable=aks-password;]$5"

$(dev-aks-ssh-public-key) $(dev-aks-dns-prefix) $(dev-aks-app-id) $(dev-aks-object-id) $(dev-aks-password)