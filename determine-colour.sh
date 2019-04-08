#!/bin/bash

###################################################################################################
### Determine the colour to deploy
###
### Inputs:
###     stageName:  name of the stage (e.g. dev, staging, prod, alternate)
###
### Outputs:
###     env:  name of the environment (e.g. dev, staging, prod)
###     colour:  colour of the environment (blue, green or none)
###     sirg:  shared-infra resource group
###     ssrg:  shared-state resourge group
###     cluster:  name of the AKS cluster (in sirg)

#   Bind script parameters
stageName=$1

echo "Stage Name:  $stageName"

#   Are we in prod or not?
if [[ $stageName == 'prod' || $stageName == 'alternate' ]]
then
    env="prod"

    echo "Fetch DNS recort set..."

    dns=$(az network dns record-set cname show -g vpl-dns -z vplauzon.com -n main-ip --query "cnameRecord.cname" -o tsv)

    echo "DNS:  $dns"

    if [[ $dns == *"blue"* ]]
    then
        colour='blue'
    else
        if [[ $dns == *"green"* ]]
        then
            colour='green'
        else
            echo "DNS entry doesn't match a colour:  $dns" 1>&2
            exit 42
        fi
    fi

    sirg="shared-stateless-$env-$colour"
    ssrg="shared-state-$env"
    cluster="shared-cluster-$env-$colour"
else
    env="$stageName"
    colour="none"
    sirg="shared-stateless-$env"
    ssrg="shared-state-$env"
    cluster="shared-cluster-$env"
fi


echo "Colour:  $colour"
echo "Environment:  $env"
echo "sirg:  $sirg"
echo "ssrg:  $ssrg"
echo "Cluster:  $cluster"

echo "##vso[task.setvariable variable=colour;]$colour"
echo "##vso[task.setvariable variable=env;]$env"
echo "##vso[task.setvariable variable=sirg;]$sirg"
echo "##vso[task.setvariable variable=ssrg;]$ssrg"
echo "##vso[task.setvariable variable=cluster;]$cluster"