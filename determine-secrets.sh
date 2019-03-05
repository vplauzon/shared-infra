#!/bin/sh

#   Bind script parameters
environment=$1

echo "Environment:  $environment"

a=$(dev-aks-ssh-public-key)
echo "Test:  $a"

#   Switch environment
if [[ $environment=='dev' ]]
then
    echo "Set Dev Variables..."

    echo "##vso[task.setvariable variable=aks-ssh-public-key;]$2"
    echo "##vso[task.setvariable variable=aks-dns-prefix;]$3"
    echo "##vso[task.setvariable variable=aks-app-id;]$4"
    echo "##vso[task.setvariable variable=aks-object-id;]$5"
    echo "##vso[task.setvariable variable=aks-password;]$6"
fi

if [[ $environment=='prod' ]]
then
    echo "Set Prod Variables..."

    echo "##vso[task.setvariable variable=aks-ssh-public-key;]$7"
    echo "##vso[task.setvariable variable=aks-dns-prefix;]$8"
    echo "##vso[task.setvariable variable=aks-app-id;]$9"
    echo "##vso[task.setvariable variable=aks-object-id;]$10"
    echo "##vso[task.setvariable variable=aks-password;]$11"
fi