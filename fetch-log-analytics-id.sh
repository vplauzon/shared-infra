#!/bin/bash

###################################################################################################
### Fetch Log Analytics resource ID
###
### Inputs:
###     ssrg:  shared-state resourge group
###
### Outputs:
###     laid:  Log Analytics Resource ID

ssrg=$1

echo "Shared State Resource Group:  $ssrg"

id=$(az resource list -g $ssrg --resource-type "Microsoft.OperationalInsights/workspaces" --query [0].id -o tsv)

echo "Log Analytics Resource ID:  $id"

echo "##vso[task.setvariable variable=laid;]$id"