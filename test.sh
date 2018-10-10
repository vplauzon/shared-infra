#!/bin/bash

az group list -o table

az aks show --resource-group shared-infra-dev --name cluster --query nodeResourceGroup -o tsv
