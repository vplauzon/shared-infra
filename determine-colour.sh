#!/bin/sh

environment=$1
requestColour=$2

echo "Environment:  $environment"
echo "Request Colour:  $requestColour"

if [[ $requestColour=='default' ]]
then
    echo "Fetch DNS recort set..."

    dns=$(az network dns record-set cname show -g vpl-dns -z vplauzon.com -n main-ip.dev --query "cnameRecord.cname" -o tsv)

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
else
    echo "Default colour"
    colour=$requestColour
fi

echo "Colour:  $colour"
##vso[task.setvariable variable=colour;]$colour
