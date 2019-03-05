environment=$1
requestColour=$2

if [$requestColour=='default']
then
    dns=$(az network dns record-set cname show -g vpl-dns -z vplauzon.com -n main-ip.dev --query "cnameRecord.cname" -o tsv)

    echo "DNS:  $dns"

    blue=$($dns grep blue)
    green=$($dns grep green)

    if [-n $blue]
    then
        colour='blue'
    else
        if [-n $green]
        then
            colour='green'
        else
            raise error "DNS entry doesn't match a colour:  $dns"
        fi
    fi
else
    colour=$requestColour
fi

echo "Colour:  $colour"
##vso[task.setvariable variable=colour;]$colour
