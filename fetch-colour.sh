#!/bin/bash

###################################################################################################
### Fetch the colour to deploy from resource group tag (deploy-colour)
###
### Inputs:
###     resource group name:  name of the resource group to get the colour tag from
###
### Outputs:
###     colour:  colour of the environment (blue or green)

#   Bind script parameters
rg=$1

echo "Resource group:  $rg"

colour=$(az group show --name $rg --query "tags['deploy-colour']" -o tsv)

echo "Colour:  $colour"

echo "##vso[task.setvariable variable=colour;]$colour"