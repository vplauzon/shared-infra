environment=$1

if[$(request-colour)='default']
then
    dns=$(az network dns record-set cname show -g vpl-dns -z vplauzon.com -n main-ip.dev --query "cnameRecord.cname" -o tsv)
    blue=$($dns grep blue)
    green=$($dns grep green)

    if[$blue -n]
    then
        colour='blue'
    else
        if[$green -n]
        then
            colour='green'
        else
            raise error "DNS entry doesn't match a colour:  $dns"
        fi
    fi
else
    colour=$(request-colour)
fi

echo "Colour:  $colour"
##vso[task.setvariable variable=colour;]$colour