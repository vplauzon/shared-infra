#!/bin/bash

###################################################################################################
### Fetch the colour to deploy from the DNS resource group tag (deploy-colour)
###
### Inputs:
###     colour:  colour of the environment (blue or green)

colour=$1

echo "Colour:  $colour"

rg=vpl-dns

az group update --name $rg --tags deployColour=$colour

