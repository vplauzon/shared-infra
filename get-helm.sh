#!/bin/bash

###################################################################################################
### Get Helm binary
###
### Outputs:
###     helm (binary file) is output in XYZ folder

echo "Download helm"

wget https://get.helm.sh/helm-v3.0.0-beta.3-linux-amd64.tar.gz

echo "Extract helm"

tar --extract --file helm-v3.0.0-beta.3-linux-amd64.tar.gz

echo "Move helm"
mv linux-amd64/helm .
