#!/bin/sh

#   Bind script parameters
environment=$1

#   Switch environment
if [[ $environment=='dev' ]]
then
    echo "##vso[task.setvariable variable=aks-ssh-public-key;]$(dev-aks-ssh-public-key)"
    echo "##vso[task.setvariable variable=aks-dns-prefix;]$(dev-aks-dns-prefix)"
    echo "##vso[task.setvariable variable=aks-app-id;]$(dev-aks-app-id)"
    echo "##vso[task.setvariable variable=aks-object-id;]$(dev-aks-object-id)"
    echo "##vso[task.setvariable variable=aks-password;]$(dev-aks-password)"
fi

if [[ $environment=='prod' ]]
then
    echo "##vso[task.setvariable variable=aks-ssh-public-key;]$(prod-aks-ssh-public-key)"
    echo "##vso[task.setvariable variable=aks-dns-prefix;]$(prod-aks-dns-prefix)"
    echo "##vso[task.setvariable variable=aks-app-id;]$(prod-aks-app-id)"
    echo "##vso[task.setvariable variable=aks-object-id;]$(prod-aks-object-id)"
    echo "##vso[task.setvariable variable=aks-password;]$(prod-aks-password)"
fi
