#!/bin/sh

#   Bind script parameters
echo "##vso[task.setvariable variable=aks-ssh-public-key;]$1"
echo "##vso[task.setvariable variable=aks-dns-prefix;]$2"
echo "##vso[task.setvariable variable=aks-app-id;]$3"
echo "##vso[task.setvariable variable=aks-object-id;]$4"
echo "##vso[task.setvariable variable=aks-password;]$5"

echo $1
echo $2
echo $3
echo $4
echo $5