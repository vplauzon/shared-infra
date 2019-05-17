#!/bin/bash

###################################################################################################
### Tag non-prod resource groups with a self destruct tag
###
### Inputs:
###     sirg:  Shared Infra resource group
###     env:  name of the stage/environment (e.g. dev, staging, prod)

#   Bind script parameters
sirg=$1
env=$2

echo "Shared Infra Resource Group:  $sirg"
echo "Environment:  $env"

if [[ $env == 'prod' ]]
then
    echo "Stage is prod:  we do not tag"
else
    #   Fetch the current hour in GMT
    ch=$(date -u +"%H")
    #   Compute the target time for destruction
    dh="$((ch+4))"
    
    echo "Current hour in GMT:  $ch"
    echo "Self-destruct hour in GMT:  $dh"
    
    echo "Add/update tag..."
    az group update -g $sirg --tags destructAt=$dh
fi