#!/bin/bash

###################################################################################################
### Determine the colour to deploy
###
### Inputs:
###     env:  name of the environment (e.g. dev, staging, prod)
###     colour:  colour of the environment (blue, green or none)
###
### Outputs:
###     mainIp:  name of the main-ip resource

#   Bind script parameters
env=$1
colour=$2

echo "Environment:  $env"
echo "Colour:  $colour"

#   Do we have a colour?
if [[ $colour == 'none' ]]
then
    mainIp="vpl-cluster-main-ip-$env"
else
    mainIp="vpl-cluster-main-ip-$colour-$env"
fi

echo "Main IP:  $mainIp"

echo "##vso[task.setvariable variable=mainIp;]$mainIp"